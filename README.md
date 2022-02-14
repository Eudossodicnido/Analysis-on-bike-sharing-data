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
For this process I have decided to use SQL Server, as it makes working with excel files easier.
The first step is putting all the data into a single table. 
![immagine](https://user-images.githubusercontent.com/69009356/153830950-824c2429-9b2e-41f8-b985-96dcad4c664e.png)


## 4. Analyze

## 5. Share


## 6. Act
