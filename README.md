# Modular Ruby on Rails CSV Importer

This is a modular rails app that imports data from CSV into rails database. The solution contains importing 
data from csv file on a local machine, as well as web csv in any case your csv file is updated online day by day.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing 
purposes. 

#### Prerequisites

* Rails version: 5.1.6

* Ruby version: 2.4.1


#### Cloning the application and provisioning for development environment

To clone the repo:

```
git clone https://github.com/AfolabiOlaoluwa/ruby_interview.git
```

Then cd into root of the application from your terminal e.g.

```
cd ruby_interview
```

To install the necessary dependencies, run:

```
bundle install
```

#### Installing

Setup your database by running the following:

```
rake db:drop 
```

```
rake db:create
```

```
rake db:migrate
```

#### Importing CSV data into database
Note: This is just an explanation on how the solution was crafted, however, for easy running of the application,
you can proceed to the next title: "Running the application", which uses FOREMAN for easy running of the solution.

...I solved this in three (3) different solutions.
1. Importing csv from a web link using rake task
2. Importing csv from a local file in the root of the engine.
3. By using class method for easy testing of rake task.

..to run the rake tasks or to run import tasks, cd into the parent root (`ruby_interview`) of the application
and proceed with any of the rake task commands below:

To import data from a web link: 

```
rake web_import:users
```

To import data from csv file bundled with csv_importer module inside the engine:

```
rake import:users
``` 

To import data from a web link by using class method for easy testing of rake task:

```
rake users
```


#### Running the application

To run the app

To make it a little seamless, we can wrap `Importing Data` and `running the application` into FOREMAN.

Therefore using Foreman since its already integrated into the app, just run:

```foreman start``` this will deal with importing data and running the app. You can the view the app on `localhost:3000`

## Running the tests

Running Test on Controller, cd into `engines/csv_importer`, then run:

```
rails test test/controllers/csv_importer/users_controller_test.rb
```

Running Test on Model, cd into `engines/csv_importer`, then run:

```
rails test test/models/csv_importer/user_test.rb
```

Running Test on integration, cd into `engines/csv_importer`, then run:

```
rails test test/integration/navigation_test.rb
```

Running Test on the rake task solution, cd in `engines/csv_importer`, then run:

```
rails test test/csv_importer_test.rb
```

However if you want to run all the Tests, cd into `engines/csv_importer`, the run:

```
rails tests
```


## Deployment

Not captured

## Continous Integration 

Not captured

## Catch Processing e.g. Using Redis

Not Captured

## Image Processing e.g. Docker

Not Captured

## Isolating configuration / 12 factor app

Environment variables are not isolated for the basis of this test.
Most importantly a modern `12-factor app` methodology can fully be considered if need be and requested.


## License

This code challenge is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

