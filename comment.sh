#!/bin/bash

if [ $# -eq 1 ] ; then
  ID=$(curl -s -u "xxx:xxx" -X GET https://jira.dtvlaops.net/rest/api/2/issue/$1/comment/ | jq .comments[].id -r)
  while read line ; do curl -s -u 'xxx:xxx' -X DELETE "https://jira.dtvlaops.net/rest/api/2/issue/${1}/comment/${line}" ; done <<< $ID
else
        echo 'Usage: koment.sh issueID|key'
fi
