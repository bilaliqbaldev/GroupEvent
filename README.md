# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

rails = 5.1.7
ruby 2.6.3

* System dependencies

* Configuration

$ bundle install

* Database creation

rake db:create

* Database initialization

$ rake db:migrate
$ rake db:seed

* Assumptions
1: Added Duration attribute to group event and calculating end time from start date + duration
2: No Auth , So created a user in seeds


* How to run the test suite

$ rspec

* API routes

GET         /api/v1/group_events              index
POST        /api/v1/group_events              create
GET         /api/v1/group_events/new          new 
GET         /api/v1/group_events/:id/edit     edit
GET         /api/v1/group_events/:id          show   
PATCH       /api/v1/group_events/:id          update
DELETE      /api/v1/group_events/:id          delete


* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...