#!/usr/bin/env bash
mysql -uroot -p123456 -e "create database IF NOT EXISTS autotable"
mysql -uroot -p123456 autotable < /usr/src/inittable.sql
