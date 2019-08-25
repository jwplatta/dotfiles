cfs () {
  curl -sS https://circleci.com/api/v1.1/project/gh/procore/$1/$2/tests?circle-token=$CIRCLE_CI_TOKEN |\
  jq --raw-output '.tests[] | select( .result | contains("failure")) | .file' |\
  uniq -c |\
  sort -r
}