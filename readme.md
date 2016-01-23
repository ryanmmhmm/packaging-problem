
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

# Why did I do it this way?
Good question!

There are many ways to look at this problem and many different depths that you can take it to.  I chose to address this problem as if it were more a problem of handling data format rather than something more simple with broad assumptions.

I also wanted to work with some concepts as constraints to the problem:

* Class.new() only accepts a single object as input, not raw string values
* Data within the instances is protected from being changed from external sources
* Data within the instances is queriable by other objects
* Methods adhere to the SRP (Single Responsibility Principle)
* Verbage for method calls on an object make sense when spoken out loud
* Classes are open for extension, but closed for modification

After a lot of refactoring, I thought it was best to accept data as a Hash of _String_ values.  Because of this, the Quote class can be utilized with many data sources assuming they have the same key names.  This data could come from a website form, an internal or external API.  Other keys in the input data would have no affect on the system.

The Quote class is also designed around an internal standard for handling the formatted input data, which may be stored in a database or used elsewhere by other classes in the future.  Strings that are to be used/manipulated as numbers are formatted as such and stored within the instance of the object.

The Price class integrates with the data formatting from the Quote class, and calculates the price of the Quote given to it.  Output from the Price class can be a number or a `formatted_total_price` depending on future needs.

# Assumptions:
* All currency is in CAD denoted by a $
* All input is recieved in the form of a Hash will string values for corresponding keys and must be parsed by the program
* Each attribute input (string) must be passed through a filter to ensure that the format of the input can be managed by the program, in the case that poorly formatted input is provided
* The cost attribute will always be referenced as a floating point number with two decimals
* The people attribute will always be referenced as an integer
* The property_type attribute will always be all lowercase and will have no spaces
* All strings within the program are reformatted to be all lowercase
* properly formatted total price for each quote is available through the `formatted_total_price` method
