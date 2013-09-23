<?php
function getip()
    {
        if(@$_SERVER['HTTP_X_FORWARDED_FOR'])
        {
            return $_SERVER['HTTP_X_FORWARDED_FOR'];
        }
        elseif(@$_SERVER['HTTP_CLIENT_IP'])
        {
            return $_SERVER['HTTP_CLIENT_IP'];
        }
        else
        {
            return $_SERVER['REMOTE_ADDR'];
        }
    }
    
    
function stripslashes_deep($value) {
        $value = is_array($value) ? array_map('stripslashes_deep', $value) : stripslashes($value);
        return $value;
        $_POST = array_map('stripslashes_deep', $_POST);
}   
    
$ipadres = getip();
 
 
// Einde functie om het e-mail adres te controleren
if($_SERVER['REQUEST_METHOD'] == 'POST') 
{
    
if(empty($_POST['voornaam'])) {
    echo "<p class=\"bold roze\">U heeft geen voornaam ingevuld.</p>";
  }
if(empty($_POST['achternaam'])) {
    echo "<p class=\"bold roze\">U heeft geen achternaam ingevuld.</p>";
  }
if(empty($_POST['email'])) {
    echo("<p class=\"bold roze\">Het e-mail adres is ongeldig!</p>");
  }
  
else {
 
 
$datum = date("d.m.Y H:i");
$ipadres = getip();
 
    $voornaam = stripslashes_deep($_POST['voornaam']);
    $achternaam= stripslashes_deep($_POST['achternaam']);
    $email= stripslashes_deep($_POST['email']);
    
$email = trim($email);
 
mysql_query("INSERT INTO $DatabaseTabel VALUES ('id',
 '".$voornaam."',
'".$achternaam."',
'".$email."',
'".$ipadres."',
'".$datum."')");
 
 
$headers = "From: $voornaam $achternaam <$email>\n"; //afzender 
$headers .= "Bcc: mij@email.nl\r\n";  
 
 
mail("$email","Bevestiging inschrijving","Beste $voornaam $achternaam,\n\nU heeft zich aangemeld.\n\nMet vriendelijke groet,\nMijn naam", $headers);
 
echo "<script language=\"javascript\" type=\"text/javascript\">window.location='inschrijf_bedankt.php'</script>\n";
}
 
}
  
?>