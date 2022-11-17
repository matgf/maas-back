# Monitoring as a Service API (maas-back)

API application for Monitoring as a Service web app.
The assignations were made using random algorithm in the AssignShift Service.

The entire API was made with GraphQL.
Almost everything has its respective test.

## Get started

### Required instalations
### Clone the repo

```shell
git clone https://github.com/matgf/maas-back.git
cd maas-back
```

### ruby

Check if you have it installed
```shell
ruby -v
```

install ruby with the last version at the moment 3.1.2 or use rvm:

```shell
rvm install ruby-3.1.2
```

## Database Schema

maas-back uses postgres
```
psql --version
version: psql (PostgreSQL) 12.12
```
### Install dependencies of the project

```shell
bundle install
```

### Initial configuration

```shell
rails db:create
rails db:migrate
rails db:seed
```

### Tests

run on terminal:

```shell
bundle exec rspec
```

### Starting the Server

```shell
rails s
```
This will run the server at port 3000 by default.


# FrontEnd
For the FrontEnd see the this [repository](https://github.com/matgf/maas-front)