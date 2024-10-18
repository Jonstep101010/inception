# Inception
<a href="https://skillicons.dev">
<img src="https://skillicons.dev/icons?i=docker">
</a>

## wordpress admin login

1. visit [https://$WP_URL/wp-admin]()
2. enter `$WP_ADMIN_EMAIL` and `$WP_ADMIN_PASS`

## adminer login
1. visit [http://localhost:81/adminer.php]()
2. enter server `mariadb`, user `$DB_USER`, `$DB_PASS` and `$DB_NAME`

## prometheus
1. visit [http://localhost:9090]()
2. access the raw data for:
    - [mariadb](http://localhost:9104/metrics)
    - [prometheus](http://localhost:9090/metrics)
