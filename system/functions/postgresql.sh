# get procore-reporting schemas

function ls_dbs(){
  psql -p $1 -U $2 -w -l
}

function get_all_pcr_schemas() {
  find . -path "*lib/procore_reporting/bi_temporal/schemas/*.ex" |
  xargs cat |
  grep BiTemp.*do |
  sed 's/def.*BiT.*\.\(.*\) do/\1/' |
  sort
}

function reset_prc_db_vol(){
  rm -rf $HOME/docker/volumes/procore_db
  mkdir $HOME/docker/volumes/procore_db
}

function reset_pit_db_vol(){
  rm -rf $HOME/docker/volumes/procore_reporting_db
  mkdir $HOME/docker/volumes/procore_reporting_db
}

function start_pit_db(){
  docker run --rm --name pit_db -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -d -p 5433:5432 -v $HOME/docker/volumes/procore_reporting_db:/var/lib/postgresql/data postgres:10.5
}

function start_prc_db(){
  docker run --rm --name prc_db -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=procore_db -d -p 5432:5432 -v $HOME/docker/volumes/procore_db:/var/lib/postgresql/data postgres:9.6.9
}

