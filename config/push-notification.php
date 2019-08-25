<?php

return array(

    'IOSUser'     => array(
        'environment' => env('IOS_USER_ENV', 'production'),
        'certificate' => app_path().'/apns/user/apn-user.pem',
        'passPhrase'  => env('IOS_USER_PUSH_PASS', 'Sky@2016'),
        'service'     => 'apns'
    ),
    'IOSProvider' => array(
        'environment' => env('IOS_PROVIDER_ENV', 'production'),
        'certificate' => app_path().'/apns/provider/apn-driver.pem',
        'passPhrase'  => env('IOS_PROVIDER_PUSH_PASS', 'Sky@2016'),
        'service'     => 'apns'
    ),
    'IOSProviderVoip' => array(
        'environment' => env('IOS_PROVIDER_ENV', 'production'),
        'certificate' => app_path().'/apns/provider/apn-driver-voip.pem',
        'passPhrase'  => env('IOS_PROVIDER_PUSH_PASS', 'Sky@2016'),
        'service'     => 'apns'
    ),
    'AndroidUser' => array(
        'environment' => env('ANDROID_USER_ENV', 'production'),
        'apiKey'      => env('ANDROID_USER_PUSH_KEY', 'AIzaSyDfXuGRlk16jcMzSBZNlIoLRTscADhW7yc'),
        'service'     => 'gcm'
    ),
    'AndroidProvider' => array(
        'environment' => env('ANDROID_PROVIDER_ENV', 'production'),
        'apiKey'      => env('ANDROID_PROVIDER_PUSH_KEY', 'AIzaSyDfXuGRlk16jcMzSBZNlIoLRTscADhW7yc'),
        'service'     => 'gcm'
    )

);
