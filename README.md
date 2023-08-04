### Data-Analytics---Power-BI-Sales-Insight

#### Step 1 : Introducing the AIMS GRID

- **Purpose** : to unlok sales insight that are not visible before for sales team for decision support & automate them to reduce manuel time spent in data gathering.

-  **Stakeholders** : Sales Director, Marketing team, customer service team, data & analytics team and IT.

-  **End Result** : An automated dashboard providing quick & latest sales insights in order to support data driven decision making.

-   **Success Criteria** : Dashboard uncovering sales order insights with the latest data available. Sales team able to take better decisions & prove 10% cost savings of total spend. Sales analysts stop data gathering manually in order to save 20% of their business time.


##### Step 2 : Getting the Data

After that we have downloaded the database from this link [https://codebasics.io/resources/sales-insights-data-analysis-project] (Giving credits to Codebasics), then we will download the database file **db_dump.sql** and import it into our MySQL Workbench.

Now let's talk about the database:


The Sales Database contains 5 tables:
-  customers
-  date
-  markets
-  products
-  transactions

After that we've done some data wrangling using SQL to explore the data before importing it to POWER BI and clean it using Power Query.


#### Step 3 : ETL and Data wrangling using Power Query


We have also exported all the 5 tables into CSV files for those who prefer to work with Excel as a datasource.


##### Step 4 : Building the Report / DataViz Part

For this part, we began by creating a Measures table in order to seperate them from the other columns.

After that we create the main measures for our analysis and we create a new Calender Table in order to work with dates correctly using that script:


```
Calendrier = ADDCOLUMNS(
    CALENDAR(DATE(2017,01,01), DATE(2023,12,31))
    , "Year", YEAR([Date])
    , "Quarter", QUARTER([Date])
    , "Month Num", MONTH([Date])
    , "Week Num", WEEKNUM([Date])
    , "Week Day", WEEKDAY([Date])
    , "Day", DAY([Date])


    , "Month", FORMAT([Date], "Mmmm")
    , "Week", FORMAT([Date], "dddd")
    , "Quarter Number", "Q" & QUARTER([Date])
    , "Year Month", YEAR([Date]) & " " & FORMAT([Date], "Mmmm")
    , "Fiscal Year", YEAR(EDATE([Date], 11))
    , "Fiscal Month", MONTH(EDATE([Date], 11))
    , "Fiscal Quarter", QUARTER(EDATE([Date], 11))
    , "Fiscal Week", WEEKNUM(EDATE([Date], 11))
    )
```


