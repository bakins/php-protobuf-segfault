<?php
// based on https://github.com/GoogleCloudPlatform/php-docs-samples/blob/master/spanner/quickstart.php

require __DIR__ . '/vendor/autoload.php';


use Google\Cloud\Spanner\SpannerClient;

$spanner = new SpannerClient();

$instance = $spanner->instance(getenv('SPANNER_INSTANCE'));

$database = $instance->database(getenv('SPANNER_DATABASE'));


$results = $database->execute('SELECT "Hello World" as test');

foreach ($results as $row) {
    print($row['test'] . PHP_EOL);
}

$database->close();

print("I made it\n\n");
