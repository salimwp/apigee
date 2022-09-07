#!/bin/bash

PROJECT_ID="kinetic-pilot-360310"
RANGE_NAME=apigee-range

gcloud alpha apigee organizations delete $PROJECT_ID

gcloud services vpc-peerings delete --network=default --service=servicenetworking.googleapis.com

gcloud -q compute addresses delete google-managed-support-1 --global
gcloud -q compute addresses delete $RANGE_NAME --global

