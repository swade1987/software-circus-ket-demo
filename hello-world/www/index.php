<?php

function hello_world(){
    return "Hello ".(isset($_ENV["NAME"])?$_ENV["NAME"]:"world")."!";
}

function table_contents(){
    $rows = [];
    $values = array(
        "HOSTNAME" => "Host Name",
        "MY_POD_NAME" => "Pod Name",
        "MY_POD_NAMESPACE" => "Namespace",
        "MY_POD_IP" => "Pod IP",
    );

    // values
    foreach($values as $key => $value) {
        if (! isset($_ENV[$key])) break;
        $rows[] =[
            $value,
            $_ENV[$key]
        ];
    }

    // services
    foreach($_ENV as $key => $value) {
        if(preg_match("/^(.*)_PORT_([0-9]*)_(TCP|UDP)$/", $key, $matches)) {
            $service = [
                "name" => $matches[1],
                "port" => $matches[2],
                "proto" => $matches[3],
                "value" => $value
            ];
            $rows[] =[
                "Service ".$service["name"].":".$service["port"],
                $service["value"],
            ];
        }
    }
    return $rows;
}


if (isset($_SERVER['HTTP_USER_AGENT']) && preg_match("/(curl|wget)/i", $_SERVER['HTTP_USER_AGENT'])) {
    echo hello_world()."\n";
    $tc = table_contents();
    $max = 0;
    foreach($tc as $row) {
        if (strlen($row[0]) > $max) $max = strlen($row[0]);
    }
    foreach($tc as $row) {
        printf("  %-".($max+3)."s %s\n", $row[0], $row[1]);
    }
}
else {
?><html>
<head>
<title><?php echo hello_world(); ?></title>
    <link href="//fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <style>
    body {
        background-color: #303030;
        color: white;
        background-image: url(texture.png);
        text-align: center;
        padding: 10px;
        font-family: "Montserrat",Helvetica,Arial,sans-serif;
    }

    #content {
        width: 400px;
        margin: 0 auto;
    }

    .logo {
        margin-top: 20px;
        margin-bottom: 20px;
    }
    </style>
</head>
<body><div id="content">
    <h1><?php echo hello_world(); ?></h1>
    <table style="width:100%">
<?php
    foreach(table_contents() as $row) {
        echo "      <tr><td>".$row[0]."</td><td>".$row[1]."</td></tr>\n";
    }
?>
    </table>
    <a href="https://www.kubernetes.com"><img class="logo" src="kubernetes-logo.png" /></a>
    <a href="https://www.apprenda.com"><img class="logo" src="apprenda.png" /></a>
</div></body>
</html>
<?php
}
?>
