<?php

class Scorers 
{
	static function is_format_selected ($selected_format, $current_format)
	{
		if (strcasecmp($selected_format, $current_format) === 0)
		{
			return ' lb-selected';
		}
		return '';
	}
	
	static function get_last_db_update ($connection) {
		$last_update_query = 'SELECT value
			FROM  variables
			WHERE name=\'last_update\'';
		$rs = $connection->query($last_update_query);
		$last_update = new DateTime($rs->fetch_object()->value);
		return $last_update;
	}
	
	static function update_db_stamp ($connection) {
		$update_query = 'UPDATE `variables` SET `value`=? 
		WHERE `name`=\'last_update\'';
		$stmt = $connection->prepare($update_query);
		$current_datetime = date('Y-m-d H:i:s');
		$stmt->bind_param('s', $current_datetime);
		$stmt->execute();
	}
}
