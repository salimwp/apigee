#!/bin/bash

ORG=YOUR_PROJECT
TOKEN="$(gcloud auth print-access-token)"

curl  -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d @developer.json "https://apigee.googleapis.com/v1/organizations/$ORG/developers"                    