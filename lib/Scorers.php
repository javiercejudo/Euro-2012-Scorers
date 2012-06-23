<?php

class Scorers 
{
	static function is_format_selected ($selected_format, $current_format)
	{
		if (strcasecmp($selected_format, $current_format) == 0)
		{
			return ' lb-selected';
		}
		return '';
	}
}
