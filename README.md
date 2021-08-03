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

POST `localhost:3000/init`

POST `localhost:3000/get_dead_ends?room=<room-to-analize>`

GET `localhost:3000/get_all`
