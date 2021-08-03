# README
# Project
This app is the solution to the challeng Badi proposed.

[GitHub](https://github.com/GuillemAcero/RbSmartVacuum)

# Install

## Clone the repository

```shell
git clone https://github.com/GuillemAcero/RbSmartVacuum.git
cd rb_smart_vacuum
```

## Check Ruby version

```shell
ruby -v
```

The ouput should be `ruby-3.0.0`


## Initialize the database
Run the following command to initialize the database

```shell
rails db:create db:migrate
```

And run the following to install the gems
```shell
bundle
```
## Server
Initialize the server using the following:

```shell
rails s
```

# Usage

## Available endpoints

### I personally recommend use Postman to test the endpoinds available:

* POST `localhost:3000/init`*

* POST `localhost:3000/get_dead_ends?room=<room-to-analize>`

* GET `localhost:3000/get_all`


\* For the `/init` endponid, it's necessary to send along with the request a JSON body with some restiction listed here:

* We asume that no furniture can be in the exit coordinates (0, n-1).
* We asume that furniture pieces don’t overlap each other.
* This rule is alwaystrue: `0 <= start[0] <= end[0] and 0 <= start[1] <= end[1].`


A house sample could be the following:
```JSON
[
   {
      "room":"living_room",
      "m":3,
      "n":3,
      "furniture_count":1,
      "furniture":[
         {
            "name":"coach",
            "start":"(0,1)",
            "end":"(0,1)"
         }
      ]
   },
    {
      "room":"bedroom",
      "m":4,
      "n":6,
      "furniture_count":1,
      "furniture":[
         {
            "name":"desk",
            "start":"(0,1)",
            "end":"(0,3)"
         },
         {
            "name":"chair",
            "start":"(1,2)",
            "end":"(1,2)"
         }
      ]
   },
   {
      "room":"badi_example_room",
      "m":7,
      "n":7,
      "furniture_count":3,
      "furniture":[
         {
            "name":"lamp",
            "start":"(0,3)",
            "end":"(0,3)"
         },
         {
            "name":"bed",
            "start":"(1,1)",
            "end":"(1,4)"
         },
         {
            "name":"desk",
            "start":"(4,4)",
            "end":"(5,5)"
         }
      ]
   }
]
```


