#!/bin/sh

start-pit-db(){
  docker run --rm --name pit_db -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -d -p 5433:5432 -v $HOME/docker/volumes/procore_reporting_db:/var/lib/postgresql/data postgres:10.5
}

start-prc-db(){
  docker run --rm --name prc_db -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=procore_db -d -p 5432:5432 -v $HOME/docker/volumes/procore_db:/var/lib/postgresql/data postgres:9.6.9
}