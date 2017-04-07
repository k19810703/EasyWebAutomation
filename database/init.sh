#!/usr/bin/env bash
mysql -uroot -p123456 -e "create database IF NOT EXISTS autotable"
mysql -uroot -p123456 autotable < /usr/src/inittable.sql
mysql -uroot -p123456 -e "create database IF NOT EXISTS appdb"
mysql -uroot -p123456 appdb < /usr/src/initapptable.sql
