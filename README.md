# Spreadsheet-style Greenhouse Gas Emissions calculator

Licensed under the BSD 3-Clause license (See LICENSE.txt for details)

Authors: Andrew Berkeley, James Smith

Copyright: Copyright (c) 2011 AMEE UK Ltd

Website: 

* Stationary fuel combustion - https://stationary-ghg-demo.ameeapps.com/login
* Transport                  - https://transport-ghg-demo.ameeapps.com/login
* Adipic acid production     - https://adipic-ghg-demo.ameeapps.com/login
* Aluminium production       - https://aluminium-ghg-demo.ameeapps.com/login
* Amonia production          - https://ammonia-ghg-demo.ameeapps.com/login
* Iron and Steel production  - https://iron-ghg-demo.ameeapps.com/login
* HCFC-22 production         - https://hcfc22-ghg-demo.ameeapps.com/login
* Lime production            - https://lime-ghg-demo.ameeapps.com/login
* Nitric acid production     - https://nitric-ghg-demo.ameeapps.com/login

All can be accessed using the following credentials:

* email: help@amee.com
* password: demo

Homepage: https://github.com/AMEE/ghgp_spreadsheets

## INTRODUCTION

This application was written as an example of an integration with the AMEE web service for environmental data.

It represents a suite of tool for calculating the greenhouse gas emissions associated with specific industrial processes. The design and content of the applicaton is intended to replicate the spreadsheet tolls provided by the Greenhouse Gas Protocol (http://www.ghgprotocol.org/calculation-tools/sector-toolsets).

The calculations within the application are driven by the AMEE platform.

## INSTALLATION

Download the codebase and run 

		bundle install

Add database details in /config/database.yml and set up database

    rake db:create
    rake db:migrate

### Defining AMEE API connection details

Next, define AMEE API server and authentication credentials. There are two ways of doing this, both of which follow from the amee gem:

* Set the required server, username and password in /config/amee.yml. There exists a template for this at /config/amee.example.yml.
* Set the required server, username and password as AMEE_SERVER, AMEE_USERNAME and AMEE_PASSWORD environmental variables respectively.

### Configuring the suite of calculations
The suite of calculations provided by an instance of the app is defined using a configuration file defined in /config/calculations.

9 configuration files are provided herein, with the choice of which one to use defined by the SHEET_TYPE environmental variable, e.g.

    ENV['SHEET_TYPE'] = 'iron_and_steel'

This provides the appropriate path from which the application can read in the configuration file and configure the range of calculations by contacting the AMEE platform.

Configuration files follow the DSL defined as part of the amee-data-abstraction gem. See here for more details: https://github.com/AMEE/amee-data-abstraction/blob/stable/README.txt

Configuration files can be locked down by invoking:

    rake calcs:config:lock[config_file_name]

or

    rake calcs:config:lock_all

These generate config 'lock' files contain all of the configuration details derived from the AMEE platform. This precludes the need to call AMEE each time the application is started.

### Set up and admin user
To set up and admin user, invoke the following:

    rake setup:data[email,password]


Start the application and log in!

## REQUIREMENTS

 * Ruby 1.8.7
 * bundler
 * AMEE API key

## USAGE
The application uses a spreadsheet format with a single summary tab containing summary data and several other 'worksheets' representing specific industrial activities.

Navigating worksheets is done via the spreadsheet-style tabs at the foot of the window.

Each worksheet contains a number of rows each of which represents a single emissions calculation. Enter data into the cells and the associated emissions quantities are calculated. In some cases the required data takes the form of a drop-down choice - this usually represents setting the context of the activity. 

For convenience, optional inputs are hidden by default, but these columns can be shown by clicking 'show optional inputs'.

Clicking on column headers will reveal help information regaring that and other columns.

## TO DO

* DRY up code!
* DRY up css!

