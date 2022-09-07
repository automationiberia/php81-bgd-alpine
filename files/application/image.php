<?php
// Create a 55x30 image
$im = imagecreatetruecolor(200, 200);
$white = imagecolorallocate($im, 255, 255, 255);
$black = imagecolorallocate($im, 0, 0, 0);
$red   = imagecolorallocate($im, 255, 0, 0);
$green = imagecolorallocate($im, 0, 255, 0);
$blue  = imagecolorallocate($im, 0, 0, 250);
$yellow = imagecolorallocate($im, 255, 255, 0);
$orange = imagecolorallocate($im, 220, 110, 0);
// Line reserved to trigger the webhook in the lab.
$deployment = getenv("COLOR");

if ( $deployment == 'blue') {
  $color = $blue;
} elseif ($deployment == 'green')  {
  $color = $green;
} elseif ($deployment == 'yellow')  {
  $color = $yellow;
} elseif ($deployment == 'red')  {
  $color = $red;
} elseif ($deployment == 'orange')  {
  $color = $orange;
} else {
  $color = $orange;
}

// Draw a filled rectangle
imagefilledrectangle($im, 0, 0, 199, 199, $color);

// Save the image
header('Content-Type: image/png');
imagePNG($im);
imagedestroy($im);

?>
