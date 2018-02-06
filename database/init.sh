su - db2inst1 -c "db2 create db AUTOTEST"
su - db2inst1 -c "db2 -tvf /usr/src/DDL.sql"
su - db2inst1 -c "db2 -tvf /usr/src/CONFIG.sql"
