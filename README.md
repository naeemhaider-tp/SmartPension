# Weblog_Parser

## Description
Task which performs following operations: 

• receive a log file as an argument  
• return a list of webpages in descending order of page visits   
• return a list of webpages in descending order of unique page views

## Technology used:
• Language: Ruby  
• Test Framework: Rspec  
• Linter: Rubocop

## How to Run
From the terminal:  
• git clone this repository  
• navigate into the project repository  
• bundle install  
• run the application:
```
 rake run 
```

## How to Test
From the terminal, within the project repository, run:
```
 rspec
```

Feature test by running the programme on the sample.log file :

```
rake test
```

## Methods

1. Define different files for handling different functions:
   1) Parser class handles all the reading file and drafting logic for getting most visited 
      views and getting sorted it. 
   2) Also calls Print class to display the results.
   3) Error Handling is also been used to handle different cases and throw exceptions.
   
2. Print class handles all the output handling and making sure the response is correct
   against the desired results.

3. ErrorHandler class is responsible for raising exceptions for different cases 
   and can be handled separately for more validations to cater . 
