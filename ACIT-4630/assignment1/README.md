### Q1. Screenshots
- Running docker containers
![[Pasted image 20260205162537.png]]
-  Running Wordpress
![[Pasted image 20260205162723.png]]

### Q2. Thoughts on hardcoded credentials
![[Pasted image 20260205162952.png]]

Since source control is shared among teams or even public, here are some valid points that I found online.

1. History exposure
Even if you realize and fix hardcoded credentials in your yaml file, it is still possible for others to see the commit history to find out the plain-text credentials

2. Permission Creep
Imagine there is a new junior Frontend Develop or a  Frontend contractor, we should not give them the secret of databases. This violates the principle of giving minimum permission

### Q3. Good Development Practices from GItGuardian
1. Store secret by using environment variables or secrets managers.
```
# Sample .env file
DB_HOST=<IP ADDRESS>
DB_USER=<USERNAME>
DB_PASS=<PASSWORD>
API_SECRET_KEY=<API KEY>
```
Some common secrets managers are **AWS Secrets Manager**, **BitWarden Secrets Manager**

2. Rotate API key regularly to reduce harm from long-term exposure.
   
3. Monitor the usage of your API key to see if there are unexpected usage from an unknown source

### Q4. Demo of using .env file for docker-compose.yml
#### Sample `.env` file
```
# Sample .env file
ROOT_PASS=<ROOT_PASS>
DB_HOST=<IP ADDRESS>
DB_USER=<USERNAME>
DB_PASS=<PASSWORD>
DATABASE=<DATABASE>
WP_USER=<USERNAME>
WP_PASS=<PASSWORD>
WP_NAME=<NAME>
```
Then you can replace the **password, username, database, host** with `${<KEY>}` within your `docker-compose.yml`

```
services:
  db:
    # We use a mariadb image which supports both amd64 & arm64 architecture
    image: mariadb:10.6.4-focal
    # If you really want to use MySQL, uncomment the following line
    #image: mysql:8.0.27
    command: '--default-authentication-plugin=mysql_native_password'
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=${ROOT_PASS}
      - MYSQL_DATABASE=${DATABASE}
      - MYSQL_USER=${DB_USER}
      - MYSQL_PASSWORD=${DB_PASS}
    expose:
      - 3306
      - 33060
  wordpress:
    image: wordpress:latest
    volumes:
      - wp_data:/var/www/html
    ports:
      - 80:80
    restart: always
    environment:
      - WORDPRESS_DB_HOST=${DB_HOST}
      - WORDPRESS_DB_USER=${WP_USER}
      - WORDPRESS_DB_PASSWORD=${WP_PASS}
      - WORDPRESS_DB_NAME=${WP_NAME}
volumes:
  db_data:
  wp_data:
```