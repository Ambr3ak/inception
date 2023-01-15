# inception
## the subject

**3 different containers** : 

- [ ]  NGINX (TLS v1.2 or v1.3)
- [ ]  WordPress (with php-fpm)
- [ ]  MariaDB (without NGINX)

**2 volumes :** 

- [ ]  One that contains the WP data base
- [ ]  One that contains the WP files

This volumes must be available form the rep `/home/<login>/data`

- [ ]  a Docker network that links all the containers

**Users :**

- [ ]  Admin user (named different than admin)
- [ ]  Standard user

> For readability reasons, we will have to configure our domain name so that it points to our local IP address. This domain name will be `<login>.42.fr`
> 

### What is forbidden ? And Mandatory ?

- The tag latest is forbidden.
    
    When we want to install a dependency, we have to specify the version. With `latest` we install the last version. 
    
    But over time, it can bring compatibility issues. 
    
- No password must be present in Dockerfiles
    
    One of the biggest mistakes of dev using github, is that it happens that they push API key or pw en clear. 
    
- Environment variable is mandatory
    
    Useful to stock pw
    
- **.env** is strongly recommanded
    
    from the subject `cat srcs/.env`
    
    ```
    DOMAIN_NAME=wil.42.fr
    # certificates
    CERTS_=./XXXXXXXXX
    # MYSQL SETUP
    MYSQL_ROOT_PASSWORD=XXXXXXXXXX
    MYSQL_USER=XXXXXXXXXX
    MYSQL_PASSWORD=XXXXXXXXXX
    [...]
    ```
    
- Have a makefile that compiles all the files
- “*Your NGINX container must be the only entry point to your infrastructure through port 443 only using TLSv1.2 or TLSv1.3 protocol”*

## How to launch the program ?
First use this commands to erase all the previous data you might have stored.

```docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q);docker network rm $(docker network ls -q) 2>/dev/null ```

Launch the program by using ``make``.
