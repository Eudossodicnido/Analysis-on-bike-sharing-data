# Analysis on bike sharing data with SQL and Tableu 
# (Google Capstone Project 1 - Cyclistic bike-share case study)
Analysis on the Cyclistic bike-share case study (Google Capstone Project 1)

## Introduction
In this case study we work for a fictional company, Cyclistic, and we are asked to follow the steps of the data analysis process: ask, prepare, process, analyze, share, and act.

## Business Task
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.   
Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.
How do annual members and casual riders use Cyclistic bikes differently? 

## 1. Ask
The business task is maximize the number of annual memberships and the idea is to do that by converting casual riders into annual riders.
In order to do so the question we are trying to answer is, specifically, how casual riders differ from annual members.

## 2. Prepare
I'm using all the data for the 12 months of year 2020 ( from 01/01 until 31/12). Data is stored in CSV file available [here](https://divvy-tripdata.s3.amazonaws.com/index.html).
The data is public and made available by Motivate International Inc. under this [this license](https://ride.divvybikes.com/data-license-agreement).
The privacy of the riders is safeguard as there are no IDs and it's not possible to identify the riders.

## 3. Process
I will use SQL Server to (which makes importing csv and excel files easy) clean the data and make them ready for analysis. 
Data consists of different csv files. They contain 13 columns related to bike trips such as starting and ending stations, memebrship status, etc.
Before importing files into SQL Server, I made sure that data are generally consistent. There however some inconsistencies:

- departure and arrival times data with negative values
- several values that pertain to test 
- several blanks (which start to appear from march, so the company might want to inquire why)

I will address all of these issues in the cleaning process. Time to start now.
For this process I have decided to use SQL Server, as it makes working with excel files easier (the full SQL script is available [here](https://github.com/Eudossodicnido/Analysis-on-bike-sharing-data/commit/487ba7db71d96a380ffa844206036134e497a8f8)).

The first step is putting all the data into a single table. 

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153830950-824c2429-9b2e-41f8-b985-96dcad4c664e.png" />
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153835145-cfdedec4-aa29-42c0-92cb-862fb1b4d301.png" />
</p>

Now that we have a single table, it's time to make it fit for analysis. 
I'll first eliminate the null values.

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153852205-b4b7ba3f-001b-4f37-88d2-b66cf07a09b6.png" />
</p>

Then I'll calculate the length of the rides and the day of week.

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153852722-6ab42773-77fd-476c-bf79-1ad277da99c1.png" />
</p>

Finally, I'll remove the test and inconsistent ride lengths values.








<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153852889-f41265e9-8250-4be0-b04f-636d38ec3b22.png" />
</p>


## 4. Analyze + 5. Share

I will perform the stages togheter, as I will visualise and share the findings as I go through.
I will perform my analysis by comparing the two groups, since understanding their differences is the goal. Anyway, i will exclude the rides longer than 24 hours, as there is a minority that hugely skew the data.

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153856001-3f7f1723-917a-4c27-9914-39863c09078e.png" />
</p>


<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153855563-9be991eb-aa04-4dad-86e7-6dc44ce135de.png" />
</p>

I have used a similar query for the members.



## 6. Act
