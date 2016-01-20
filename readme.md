
Alt-H1 Requirements:

built using ruby 2.2.3p173
uses rake & minitest to run tests

Tests:  This program was developing using minitest TDD methodologies and tests can be run using the  > rake command in the root directory of the repository.

All required files to run this program are included in the repo.




This is a program designed to recieve input in sets in the form of:

1) base cost($)
2) number of people required to perform the work
3) type of product

Each product has a different markup(%) according to a table like so:
* Without exception, there is a flat markup on all jobs of 5%
* For each person that needs to work on the job, there is a markup of 1.2%

Markups are also added depending on the types of materials involved:

* If pharmaceuticals are involved, there is an immediate 7.5% markup
* For food, there is a 13% markup
* Electronics require a 2% markup
* Everything else, there is no markup


The output of this program will provide the user with a pricing estimate for the job in the following format:
Output 1: Price($)
