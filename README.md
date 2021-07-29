# Map Near Places

API REST that shows the user's closest locations.

## Documentation:

-To know how to basic create places e get them by your current location proximity: https://documenter.getpostman.com/view/9971759/TzXukJXC

## Using:

- Ruby version 2.7.3 with Rails 6.0.3
- PostgreSQL
- JWT Authentication

## Docker:
to inicialize docker just fallow the steps:
if you have any permissions issue, just run the following commands with "sudo";

- docker-compose build 
- docker-compose run app rake db:create
- docker-compose run app rake db:migrate
- docker-compose up

and the server is on!

## Main Features

- The user of the application will be able to register a new account or enter an account already existing using email and password.

- The authenticated user can register a new location.

- The authenticated user will be able to view the locations already registered by him and others users in map and list format

- The authenticated user will be able to evaluate a place, with rating and comment.

- The authenticated user will be able to view the evaluations of a location.

- The authenticated user can also view his profile, change e-mail, change password and log out.

## Other Features:

- Docker / Docker Compose config.

- Errors catcher with ExceptionHandler.

- TDD with Rspec using Faker, FactoryBot, Shoulda Matchers end DatabaseCleaner for:
    - Authentication
    - Models
    - Serializers
    - Requests

- CI configuration
### Comments

- Using rails Serializers to send response

- JWT Logout using blacklist to disable current token.

- Using Rails Api Only
