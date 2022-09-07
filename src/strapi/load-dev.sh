#!/bin/bash

URL='https://strapi-dev.elysautus.io/api/restaurants'

curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "(DEV) ABC Burgers",
        "Website": "https://abcburgers.com",
        "Cuisine": "Burgers"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "(DEV) DEF Seafood",
        "Website": "https://defseafood.com",
        "Cuisine": "Seafood"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "(DEV) XYZ Tacos",
        "Website": "https://xyztacos.com",
        "Cuisine": "Mexican"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "(DEV) RCC Pasta",
        "Website": "https://rccpasta.com",
        "Cuisine": "Italian"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "(DEV) YYZ Gyros",
        "Website": "https://yyzgyros.com",
        "Cuisine": "Greek"
    }
}'


URL='https://strapi-dev.elysautus.io/api/premiumrestaurants'

curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "(DEV) ALO RESTAURANT",
        "Website": "https://ALORESTAURANT.com",
        "Cuisine": "French, European"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "(DEV) Scaramouche Restaurant",
        "Website": "https://Scaramouch Restaurant.com",
        "Cuisine": "French, International"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "(DEV) Jacobs & Co. Steakhouse",
        "Website": "https://JacobsSteakhouse.com",
        "Cuisine": "American, Steakhouse"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "(DEV) Miku",
        "Website": "https://Miku.com",
        "Cuisine": "Sushi, Japanese"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "(DEV) Chiado Restaurant",
        "Website": "https://ChiadoRestaurant.com",
        "Cuisine": "Seafood, Mediterranean"
    }
}'