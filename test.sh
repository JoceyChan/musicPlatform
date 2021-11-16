#!/bin/bash

db="music.sqlite"
rm -f ${db}
touch ${db}

sqlite3 ${db} < create-schema-tpch.sql
