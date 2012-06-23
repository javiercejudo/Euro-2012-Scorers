<?php 

//error_reporting(E_ALL);
//ini_set('display_errors', 1);
header('Content-type: text/html; charset=utf-8');
require_once 'config.php';
require_once 'lib/Country.php';
require_once 'lib/Time.php';
require_once 'lib/Scorers.php';
$path_xml  = 'data/TopGoalScorers.xml';
$path_json = 'data/TopGoalScorers.json';
$format = array();
$update_db = false;

?>
<!DOCTYPE html>
<meta charset="UTF-8" />
<title>Javier Cejudo | Euro 2012 Scorers</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<body>
<header>
<h1 class="fancy-font">Euro 2012 Scorers</h1>
</header>
<?php

$connection = new mysqli(HOST, USERNAME, PASSWD, DBNAME);

$input_conditions = isset($_GET['top']) 
	&& is_numeric($_GET['top'])
	&& $_GET['top'] >= 0 // zero means everyone 
	&& $_GET['top'] < 100;
$max_number = ($input_conditions) ? (int) $_GET['top'] : 0;

if (isset($_GET['format']) && strcasecmp($_GET['format'], 'soap') === 0) 
{
	$time_start = microtime(true);
	$format[] = 'soap';
	$format[] = 'HTTP SOAP/XML (stored to MySQL DB)';
	$client = new SoapClient (
		"http://footballpool.dataaccess.eu/data/info.wso?WSDL",
		array('features' => SOAP_SINGLE_ELEMENT_ARRAYS)
	);
	$response = $client->TopGoalScorers(array('iTopN' => $max_number));
	$goleadores = $response->TopGoalScorersResult->tTopGoalScorer;
	$time_end = microtime(true);
	
	$update_db = true;
	
	// This would save an XML file with the data, but it is effectevely
	// another request, so we are going to keep the local file in JSON
	//~ $xml_response = file_get_contents('http://footballpool.dataaccess.eu/data/info.wso/TopGoalScorers?iTopN=');
	//~ file_put_contents($path_xml, $xml_response);
} 
elseif (isset($_GET['format']) && strcasecmp($_GET['format'], 'json') === 0) 
{
	$time_start = microtime(true);
	$format[] = 'json';
	$format[] = 'HTTP JSON (stored to local file)';
	$json_request = 'http://footballpool.dataaccess.eu/data/info.wso/TopGoalScorers/JSON?iTopN=' . $max_number;
	$json_response = file_get_contents($json_request);
	$goleadores = json_decode($json_response);
	$time_end = microtime(true);
	
	// We now save the data in a local file
	file_put_contents($path_json, $json_response);
}
elseif (isset($_GET['format']) && strcasecmp($_GET['format'], 'mysql') === 0) 
{
	$last_update_query = 'SELECT value
		FROM  variables
		WHERE name=\'last_update\'';
	$rs = $connection->query($last_update_query);
	$last_update = new DateTime($rs->fetch_object()->value);
	$rs->close();
	
	$format[] = 'mysql';
	$format[] = 'MYSQL DB (stored ' . Time::ago($last_update) . ')';		
	$time_start = microtime(true);
	$data_query = 'SELECT sName, iGoals, sCountry, sFlag, sFlagLarge 
		FROM top_goal_scorers ORDER BY iGoals DESC, sName';
	if ($max_number != 0)
		$data_query .= " LIMIT $max_number";
	$rs = $connection->query($data_query);
	$goleadores = array();
	while ($goleador = $rs->fetch_object())
		$goleadores[] = $goleador;
	$rs->close();
	$time_end = microtime(true);
}
elseif (!isset($_GET['format']) || strcasecmp($_GET['format'], 'file') === 0) 
{
	$format[] = 'file';
	$format[] = 'LOCAL FILE (stored ' . Time::ago(DateTime::createFromFormat('U', filemtime($path_json))) . ')';
	$time_start = microtime(true);
	$json_response = file_get_contents($path_json);
	$goleadores = json_decode($json_response);
	$time_end = microtime(true);
}
	
$time = $time_end - $time_start;
//var_dump($goleadores);
echo '<p class="technical">Response time: ' . number_format($time, 4);
echo ' seconds. Using ' . $format[1] . '.</p>' . "\n";

echo '<p class="fancy-font">Live data: ';
echo '<a class="likeabutton live';
echo Scorers::is_format_selected($format[0], 'soap');
echo '" href="?format=SOAP">SOAP/XML</a>&nbsp; ';
echo '<a class="likeabutton live';
echo Scorers::is_format_selected($format[0], 'json');
echo '" href="?format=JSON">JSON</a>&nbsp; ';
echo '</p>' . "\n";

echo '<p class="fancy-font">Stored data: ';
echo '<a class="likeabutton stored';
echo Scorers::is_format_selected($format[0], 'mysql');
echo '" href="?format=MYSQL">MySQL DB</a>&nbsp; ';
echo '<a class="likeabutton stored';
echo Scorers::is_format_selected($format[0], 'file');
echo '" href="?format=FILE">Local file</a>&nbsp; ';
echo '</p>' . "\n";

?>
<table>
<tr>
<th><span title="Players count">#</span></th>
<th><span title="Ranking">R.</span></th>
<th>Player</th>
<!--<th><img src="assets/soccer.gif" alt="soccer ball" title="Goals" width="16" height="16" /></th>-->
<th><span title="Goals">G.</span></th>
</tr>
<?php

$i = 0;
$pos = 0;
$goles_anterior = -1;
foreach ($goleadores as $goleador)
{
	if ($update_db === true)
	{
		// inserting or updating the values
		$insert_query = 'INSERT INTO `top_goal_scorers`
			(`sName`, `iGoals`, `sCountry`, `sFlag`, `sFlagLarge`)
			VALUES 
			(?,?,?,?,?)
			ON DUPLICATE KEY UPDATE `iGoals`=?';
		$stmt = $connection->prepare($insert_query);
		$decoded_name = utf8_decode($goleador->sName);
		$stmt->bind_param('sisssi', $decoded_name, $goleador->iGoals, 
			$goleador->sCountry, $goleador->sFlag, $goleador->sFlagLarge, 
			$goleador->iGoals);
		$stmt->execute();
		$stmt->close();
		
		// updating variable to track the freshness of stored data
		$update_query = 'UPDATE `variables` SET `value`=? 
			WHERE `name`=\'last_update\'';
		$stmt = $connection->prepare($update_query);
		$current_datetime = date('Y-m-d H:i:s');
		$stmt->bind_param('s', $current_datetime);
		$stmt->execute();
		$stmt->close();
	}
	if (isset($_GET['format']) && strcasecmp($_GET['format'], 'mysql') === 0)
	{
		$goleador->sName = utf8_encode($goleador->sName);
	}
	$i++;
	$pos = ($goles_anterior !== $goleador->iGoals) ? $i : '↑';
	echo '<tr>' . "\n";
	echo '<td><em>' . $i . '</em></td>' . "\n";
	echo '<td><strong>' . $pos . '</strong></td>' . "\n";
	$original_url_components = explode("/", $goleador->sFlag);
	$country = substr(end($original_url_components),0,2);
	$flag_url = 'assets/' . $country . '.gif';
	echo '<td>' . $goleador->sName . ' <span class="flag_pole" title="';
	echo Country::code2name(strtoupper($country)) . '"><img class="flag" src="';
	echo $flag_url . '" alt="" width="16" height="11" /></span></td>' . "\n";
	echo '<td><strong>' . $goleador->iGoals . '</strong></td>' . "\n";
	echo '</tr>' . "\n";
	$goles_anterior = $goleador->iGoals;
}
$connection->close();

?>
</table>
<footer>
<p class="technical footer">Data provided by 
<a href="http://footballpool.dataaccess.eu/">Data Access Europe</a> 
(<a href="http://footballpool.dataaccess.eu/data/info.wso">web service</a>).
<p class="technical footer">© <?php echo date('Y'); ?> Javier Cejudo
</footer>
