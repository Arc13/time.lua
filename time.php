<?php

if($_GET["req"]) {
	$days = getdate();
	echo($days[$_GET["req"]]);
}

?>
