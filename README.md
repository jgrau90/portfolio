# Technical Task by Qustodio

### Qustodio - Data Analyst position - Technical Task
## Situation
A&B Gaming is a SAAS company that offers monthly subscriptions to access their online
gaming platform.
They offer 3 different plans: Small, Medium and Large for 9.95, 13.95 and 17.95, respectively.
Users can pay in EUR or USD.
Subscriptions are renewed automatically unless the user cancels them. No refunds are allowed!
:)
## Problem
We are given a CSV file listing all the orders received in 2019 and the Marketing team asks us
to analyze and understand the behavior of our customers.
We want to perform a monthly cohort analysis of our subscribers.
In a cohort analysis the data set is broken down into related groups rather than looking at all
users as one unit. These related groups, or cohorts, usually share common characteristics or
experiences within a defined time-span (taken from Wikipedia ).
In this case we want to group users by the month of their initial purchase, and then add a
column for each month they renewed their subscription.
This analysis should let us answer the following questions:
- What products have higher retention?
- Can you spot any differences between users paying in USD vs EUR?
## Hints
1. Load the given CSV data into a Relational DB.
2. Write a SQL query that lets you make the monthly cohort analysis. e.g.: Group users by initial
purchase date.
3. Import the result of the query in a spreadsheet (i.e. Google Spreadsheets) and use it to
create a chart showing the cohort.
## Deliverables
We would like to receive a report presenting the cohort analysis chart and answering the
questions proposed above.
Additionally, describe the initial data loading step as well as include the SQL query that you
made to generate the cohort analysis.
