#!/bin/sh
cfs () {
  curl -sS https://circleci.com/api/v1.1/project/gh/procore/$1/$2/tests?circle-token=$CIRCLE_CI_TOKEN |\
  jq --raw-output '.tests[] | select( .result | contains("failure")) | .file' |\
  uniq -c |\
  sort -r
}

# Outputs aggregation of CircleCI build failures by file
# Sorted from most failutes to least failures
# Input is a build URL, e.g. https://circleci.com/gh/some_org/some_project/12345
# Requires CIRCLE_CI_TOKEN to be set in env
function cfs_v2() {
  local CIRCLE_CI_BUILD_URI="$(echo $1 | sed "s/^https:\/\/circleci.com\///")"
  curl -sS https://circleci.com/api/v1.1/project/gh/procore/$1/$2/tests?circle-token=$CIRCLE_CI_TOKEN \
  | jq --raw-output '.tests[] | select( .result | contains("failure")) | .file' \
  | uniq -c | sort -r
}

function asdf() {
  case $1 in
    "start")
      case $2 in
        "es"|"elasticsearch")
          `asdf which elasticsearch` -p /tmp/elasticsearch-pid -d
          echo "[STARTED] Elasticsearch `asdf current elasticsearch`"
        ;;
        "kibana")
          nohup `echo $(asdf which kibana) --log-file $(asdf where kibana)/kibana.log` >/dev/null&
          echo "[STARTED] Kibana `asdf current kibana`"
        ;;
        *)
          echo "Plugin not found. Run \"asdf plugin-list\" to find available plugins."
        ;;
      esac
    ;;
    "stop")
      case $2 in
        "es"|"elasticsearch")
          kill -SIGTERM $(cat /tmp/elasticsearch-pid | sed 's/%//')
          echo "[STOPPED] Elasticsearch `asdf current elasticsearch`"
        ;;
        "kibana")
          kill $(ps aux | grep "$(asdf where kibana)" | awk '{print $2}')
          echo "[STOPPED] Kibana `asdf current kibana`"
        ;;
        *)
          echo "Plugin not found. Run \"asdf plugin-list\" to find available plugins."
        ;;
      esac
    ;;
    "restart")
      case $2 in
        "es"|"elasticsearch")
          asdf stop elasticsearch
          asdf start elasticsearch
        ;;
        "kibana")
          asdf stop kibana
          asdf start kibana
        ;;
        *)
          echo "Plugin not found. Run \"asdf plugin-list\" to find available plugins."
        ;;
      esac
    ;;
    *)
      ~/.asdf/bin/asdf "$@"
    ;;
  esac
}