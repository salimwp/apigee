#!/bin/bash

ORG=strapi-360313
TOKEN="$(gcloud auth print-access-token)"

# Array list of all the proxies

curl  -H "Authorization: Bearer $TOKEN"  "https://apigee.googleapis.com/v1/organizations/$ORG/apis"

#Start of loop

# api=myscipt
# cd $api
# rm -rf $api.zip
# curl -H "Authorization: Bearer $TOKEN" "https://apigee.googleapis.com/v1/organizations/$ORG/apis/$api/revisions/1" -X DELETE
# zip -r $api.zip apiproxy 
# curl -H "Authorization: Bearer $TOKEN"  "https://apigee.googleapis.com/v1/organizations/$ORG/apis?action=import&name=$api" -T $api.zip  -H "Content-Type: application/octet-stream" -X POST
# curl  -H "Authorization: Bearer $TOKEN" "https://apigee.googleapis.com/v1/organizations/$ORG/environments/prod/apis/$api/revisions/1/deployments" -X POST
# cd ..

# Install oauth
api=oauth
cd $api
rm -rf $api.zip
curl -H "Authorization: Bearer $TOKEN" "https://apigee.googleapis.com/v1/organizations/$ORG/apis/$api/revisions/1" -X DELETE
zip -r $api.zip apiproxy
curl -H "Authorization: Bearer $TOKEN"  "https://apigee.googleapis.com/v1/organizations/$ORG/apis?action=import&name=$api" -T $api.zip  -H "Content-Type: application/octet-stream" -X POST
curl  -H "Authorization: Bearer $TOKEN" "https://apigee.googleapis.com/v1/organizations/$ORG/environments/prod/apis/$api/revisions/1/deployments" -X POST
curl  -H "Authorization: Bearer $TOKEN" "https://apigee.googleapis.com/v1/organizations/$ORG/environments/eval/apis/$api/revisions/1/deployments" -X POST
cd ..