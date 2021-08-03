# README
# Project
This app is the solution to the challeng Badi proposed.

[project.com](github_url)

# Install

## Clone the repository

```shell
git clone git@github.com:juliendargelos/project.git
cd project
```

## Check Ruby version

```shell
ruby -v
```

The ouput should be `ruby-3.0.0`


## Initialize the database

```shell
rails db:create db:migrate
```

# TODO BUNDLE INSTURCITON
## Server

```shell
rails s
```

# Usage

## Available endpoints

POST `localhost:3000/init`

POST `localhost:3000/get_dead_ends?room=<room-to-analize>`

GET `localhost:3000/get_all`
