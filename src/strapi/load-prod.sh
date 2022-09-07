#!/bin/bash

URL='https://strapi.elysautus.io/api/restaurants'

curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "ABC Burgers",
        "Website": "https://abcburgers.com",
        "Cuisine": "Burgers"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "DEF Seafood",
        "Website": "https://defseafood.com",
        "Cuisine": "Seafood"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "XYZ Tacos",
        "Website": "https://xyztacos.com",
        "Cuisine": "Mexican"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "RCC Pasta",
        "Website": "https://rccpasta.com",
        "Cuisine": "Italian"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "YYZ Gyros",
        "Website": "https://yyzgyros.com",
        "Cuisine": "Greek"
    }
}'


URL='https://strapi.elysautus.io/api/premiumrestaurants'

curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "ALO RESTAURANT",
        "Website": "https://ALORESTAURANT.com",
        "Cuisine": "French, European"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "Scaramouche Restaurant",
        "Website": "https://Scaramouch Restaurant.com",
        "Cuisine": "French, International"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "Jacobs & Co. Steakhouse",
        "Website": "https://JacobsSteakhouse.com",
        "Cuisine": "American, Steakhouse"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "Miku",
        "Website": "https://Miku.com",
        "Cuisine": "Sushi, Japanese"
    }
}'
curl -X POST $URL \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "Chiado Restaurant",
        "Website": "https://ChiadoRestaurant.com",
        "Cuisine": "Seafood, Mediterranean"
    }
}'