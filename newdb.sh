#!/usr/bin/env sh
psql postgres <<EOF
-- CREATE ROLE sonarqube WITH LOGIN PASSWORD 'sonarqube';
CREATE DATABASE ee9 WITH ENCODING 'UTF8' OWNER sonarqube TEMPLATE=template0;
GRANT ALL ON DATABASE ee9 TO sonarqube;
\connect ee9
CREATE SCHEMA IF NOT EXISTS ee9 AUTHORIZATION sonarqube;
ALTER ROLE sonarqube IN DATABASE ee9 SET search_path TO ee9;
EOF