Pre-installed VM dependencies:
  - git (`sudo yum install git`)
  - Java OpenJDK 8 (`sudo yum install java-1.8.0-openjdk`)
  - Tomcat 8 (`sudo yum install tomcat`) https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-8-on-centos-7
  - Postgres 11 (https://www.postgresql.org/download/linux/redhat/)
    - Configs found in /var/lib/pgsql/data
    - PG_CONFIG = /var/lib/pgsql/11/data/postgresql.conf
    - Maven `sudo yum install maven`

Required environment variables:
These must be set in the VM prior to starting ANNIS with the `export` command.
  - `export PG_CONFIG=/var/lib/pgsql/11/data/postgresql.conf`
  - `export TOMCAT_DIR=/usr/share/tomcat`

To start service:
  - Navigate to directory
  - Run `bash start-annis.sh`
    - If first time running on machine: it's recommended to set the 'new' flag to `true`
    - `bash start-annis.sh -n true`
    - Otherwise, your PG_CONFIG variables in bin/config.sh may not be set  

To stop service:
  - `bash stop-annis.sh`


Debugging:
  - Sometimes on starting the annis-service, you get the `java.net.BindException: Address already in use` error. That's why this chunk was put in start-annis-backend.sh:
  ```shell
  annis_pid=$(ps -ef | egrep '\-Dannis\.home\=annis\-service' | awk '{print $2}')
  kill -9 ${annis_pid}
  ```

Helpful commands:
- Get permissions: `ls -ld`
- Get tomcat logs: `journalctl -xe`
- Clone permissions:
`chown --reference=otherfile thisfile
chmod --reference=otherfile thisfile
`
- tomcat logs (in case it differs from journalctl for some reason):
  `tail -100 /usr/share/tomcat/logs/catalina.2020-10-09.log`


Java virtual machine used: /usr/lib/jvm/jre/bin/java
Is this Java 8?
should be /usr/lib/jvm/jre-1.8.0/bin/java
- Changing `/etc/tomcat/tomcat.conf` to list `/usr/lib/jvm/jre-1.8.0/bin/java` as `JAVA_HOME`
- `systemctl daemon-reload` to respect new changes

Initiate maven: `maven package`
Added tomcat path to settings.xml
Added admin login to settings.xml
mvn tomcat:run-war
For some reason, tomcat7:run-war needs context.xml form META-INF, but tomcat:run-war does not.
