# Mini Seedrs API

#### Environments
```
ruby version: 2.7.0
rails version: 6.0.6
database: postgreSQL 14.5
```

#### Run App

```
1. bundle install
2. rails db:create
3. rails db:migrate
4. rails db:seed
5. rails s
```

#### Run App in docker

````
1. docker-compose build
2. docker-compose run web rake db:create && rake db: migrate && rake db:seed
3. docker-compose up
````

## Usage

#### Get All Campaigns


    get localhost:3000/v1/campaigns

##### Response
> status: 200
```
[
  {
    "id": "1b27fa5d-e593-4e8d-9f61-600af4279882",
    "name": "Compatible static flexibility",
    "image_url": "http://little-gerhold.io/kera.terry",
    "country": "Puerto Rico",
    "sector": "Nanotechnology",
    "percentage_raised": "80.0",
    "target_amount": "38719.0",
    "investment_multiple": "154.779378071656"
  },
  {
    "id": "5c5acc05-aeb1-4d18-9cd5-b35797edd2a0",
    "name": "Intuitive empowering instruction set",
    "image_url": "http://rowe-wiegand.org/randell",
    "country": "Austria",
    "sector": "Publishing",
    "percentage_raised": "91.0",
    "target_amount": "32620.0",
    "investment_multiple": "287.924584843123"
  },
  {
    "id": "396d2ab3-b0d9-439b-90d7-5f31eab040d4",
    "name": "Quality-focused radical initiative",
    "image_url": "http://kulas-goldner.com/wally.turner",
    "country": "Montenegro",
    "sector": "Cosmetics",
    "percentage_raised": "9.0",
    "target_amount": "64832.0",
    "investment_multiple": "283.589876045873"
  },
  {
    "id": "8b206d09-5438-4108-a782-e89b8478e8e6",
    "name": "Optimized stable instruction set",
    "image_url": "http://hartmann-green.io/barton_dare",
    "country": "Nepal",
    "sector": "Alternative Dispute Resolution",
    "percentage_raised": "48.0",
    "target_amount": "84532.0",
    "investment_multiple": "162.581627495494"
  },
  {
    "id": "85189e93-60d7-41c4-9803-15c8f33a8c5b",
    "name": "Networked upward-trending paradigm",
    "image_url": "http://lowe-hickle.name/jacob",
    "country": "Turkmenistan",
    "sector": "Biotechnology",
    "percentage_raised": "9.0",
    "target_amount": "62117.0",
    "investment_multiple": "274.791489262689"
  },
  {
    "id": "09eea508-9e8c-4734-aeca-cced31483640",
    "name": "Extended full-range structure",
    "image_url": "http://okuneva.biz/cornell",
    "country": "Saint Helena",
    "sector": "Insurance",
    "percentage_raised": "18.0",
    "target_amount": "24348.0",
    "investment_multiple": "798.177179359063"
  },
  {
    "id": "c1618fc0-12fd-4a26-8818-6b36db964815",
    "name": "Compatible exuding moratorium",
    "image_url": "http://kohler.co/juliann.baumbach",
    "country": "Virgin Islands, U.S.",
    "sector": "Utilities",
    "percentage_raised": "44.0",
    "target_amount": "72778.0",
    "investment_multiple": "356.876424743835"
  },
  {
    "id": "5bdbf72f-f726-472e-8a7c-d075a1e07f3c",
    "name": "Grass-roots impactful function",
    "image_url": "http://larson.co/heidi",
    "country": "Aruba",
    "sector": "Restaurants",
    "percentage_raised": "22.0",
    "target_amount": "25372.0",
    "investment_multiple": "522.045950064007"
  },
  {
    "id": "4af18f19-c2ec-4214-b189-03ff6b8107df",
    "name": "Synchronised high-level local area network",
    "image_url": "http://steuber.org/jason.haley",
    "country": "Brunei Darussalam",
    "sector": "Law Enforcement",
    "percentage_raised": "35.0",
    "target_amount": "45240.0",
    "investment_multiple": "348.89341232162"
  },
  {
    "id": "055db107-e2a1-406a-9767-226b68f5093c",
    "name": "Team-oriented intangible info-mediaries",
    "image_url": "http://osinski.org/coy_johnston",
    "country": "Zambia",
    "sector": "E-Learning",
    "percentage_raised": "10.0",
    "target_amount": "94527.0",
    "investment_multiple": "243.611431900871"
  },
  {
    "id": "513657d4-93dc-4afb-bb4c-63dbc9c27795",
    "name": "Persevering global internet solution",
    "image_url": "http://doyle.info/pearly",
    "country": "Liechtenstein",
    "sector": "Entertainment",
    "percentage_raised": "1.0",
    "target_amount": "34358.0",
    "investment_multiple": "455.477639944714"
  },
  {
    "id": "89fff0b8-63fd-49d9-add6-6fb413794865",
    "name": "Managed client-server migration",
    "image_url": "http://mclaughlin-wolf.net/mason_farrell",
    "country": "Jordan",
    "sector": "Sports",
    "percentage_raised": "71.0",
    "target_amount": "50078.0",
    "investment_multiple": "928.082562149409"
  },
  {
    "id": "0418fc5f-aaa5-4bb1-83cd-6a77989e49c5",
    "name": "Seamless bi-directional intranet",
    "image_url": "http://schamberger-daniel.io/pierre_mayert",
    "country": "Turkmenistan",
    "sector": "Cosmetics",
    "percentage_raised": "60.0",
    "target_amount": "55841.0",
    "investment_multiple": "585.549936099722"
  }
]
```
#### Filter by
    
Filter by options
   1. id
   2. name
   3. image_url
   4. country
   5. sector
   6. percentage_raised
   7. target_amount
   8. investment_multiple



    get localhost:3000/v1/campaigns?filter_by=sector&query=Law


##### Response
> status: 200

````
[
  {
    "id": "4af18f19-c2ec-4214-b189-03ff6b8107df",
    "name": "Synchronised high-level local area network",
    "image_url": "http://steuber.org/jason.haley",
    "country": "Brunei Darussalam",
    "sector": "Law Enforcement",
    "percentage_raised": "35.0",
    "target_amount": "45240.0",
    "investment_multiple": "348.89341232162"
  }
]
````

#### Create Investment


    post localhost:3000/v1/investments

##### request body

```
{
  "investment": {
    "amount": "15000",
    "campaign_id": "ff841aa7-715c-4cb6-ac91-d6cd8186348b"
  }
}
```

##### Response
> status: 201

```
{
  "id": "54d58484-2864-4382-bbb9-d77b35364590",
  "campaign_id": "ff841aa7-715c-4cb6-ac91-d6cd8186348b",
  "amount": "15000.0"
}
```