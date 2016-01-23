
# Requirements:

built using ruby 2.2.3p173
uses rake & minitest to run tests

Please run bundle from root of repo to install rake and minitest

# Tests:
This program was developing using minitest TDD methodologies.

All required files to run this program are included in the repo.

run `rake` from the command line in the /packaging/ folder to run the tests for the program.

# About the Program:
This is a program designed to recieve input in sets in strings with the form of:

1. base cost($)
2. number of people required to perform the work
3. type of product

Each product has a different markup(%) according to a table like so:

* Without exception, there is a flat markup on all jobs of 5%
* For each person that needs to work on the job, there is a markup of 1.2%

Markups are also added depending on the types of materials involved:

* If pharmaceuticals are involved, there is an immediate 7.5% markup
* For food, there is a 13% markup
* Electronics require a 2% markup
* Everything else, there is no markup


The output of this program will provide the user with a pricing estimate for the job in the following format:

* Output 1: Price($)

# Assumptions:
* All currency is in CAD denoted by a $
* All input is recieved in the form of a Hash will string values for corresponding keys and must be parsed by the program
* Each attribute input (string) must be passed through a filter to ensure that the format of the input can be managed by the program, in the case that poorly formatted input is provided
* The cost attribute will always be referenced as a floating point number with two decimals
* The people attribute will always be referenced as an integer
* The property_type attribute will always be all lowercase and will have no spaces
* properly formatted total price for each quote is available through the `formatted_total_price` method
