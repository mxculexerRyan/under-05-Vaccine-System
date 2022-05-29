<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://messaging-service.co.tz/api/sms/v1/text/multi',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{"messages": [{"from": "N-SMS","to": ["255716718040","255758483019"],"text": "Your message"},{"from": "N-SMS","to": ["255758483019", "255655912841","255716718040"],"text": "Your other message"}]}',
  CURLOPT_HTTPHEADER => array(
    'Authorization: Basic dGVzdDE6MTIzNDU2',
    'Content-Type: application/json',
    'Accept: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;