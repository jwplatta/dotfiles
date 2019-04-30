#!/bin/sh

ls_dbs(){
  psql -p $1 -U $2 -w -l
}

# get procore-reporting schemas
get_all_pcr_schemas() {
  find . -path "*lib/procore_reporting/bi_temporal/schemas/*.ex" |
  xargs cat |
  grep BiTemp.*do |
  sed 's/def.*BiT.*\.\(.*\) do/\1/' |
  sort
}

reset_prc_db_vol(){
  rm -rf $HOME/docker/volumes/procore_db
  mkdir $HOME/docker/volumes/procore_db
}

reset_pit_db_vol(){
  rm -rf $HOME/docker/volumes/procore_reporting_db
  mkdir $HOME/docker/volumes/procore_reporting_db
}

