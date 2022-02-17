# Analysis on bike sharing data with SQL and Tableau - Google Data Analytics Professional Certificate - Capstone Project 1 - Cyclistic bike-share case study
Google Data Analytics Professional Certificate - Capstone Project 1 - Cyclistic bike-share case study

## Introduction
In this case study, we work for a fictional company, Cyclistic, and we are asked to follow the steps of the data analysis process highlighted during the course: ask, prepare, process, analyze, share, and act.

## Business Task
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.   
Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.
How do annual members and casual riders use Cyclistic bikes differently? 

## 1. Ask
The business task is to maximize the number of annual memberships and the idea is to do that by converting casual riders into annual riders.
In order to do so, the question we are trying to answer is, specifically, how casual riders differ from annual members.

## 2. Prepare
I'm using all the data for the 12 months of the year 2020 ( from 01/01 until 31/12). Data is stored in CSV file available [here](https://divvy-tripdata.s3.amazonaws.com/index.html).
The data is public and made available by Motivate International Inc. under this [this license](https://ride.divvybikes.com/data-license-agreement).
The privacy of the riders is safeguarded as there are no IDs and it's not possible to identify the riders.

## 3. Process
I will use SQL Server (which makes importing csv and excel files easy) to clean the data and make them ready for analysis. 
Data consists of different csv files. They contain 13 columns related to bike trips such as starting and ending stations, membership status, etc.
Before importing files into SQL Server, I made sure that data are generally consistent. There however some inconsistencies:

- departure and arrival times data with negative values
- several values that pertain to test 
- several blanks (which start to appear from march, so the company might want to inquire why)

I will address all of these issues in the cleaning process. Time to start now.
The full SQL script is available [here](https://github.com/Eudossodicnido/Analysis-on-bike-sharing-data/commit/487ba7db71d96a380ffa844206036134e497a8f8).

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

Then I'll calculate the length of the rides and the day of the week.

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153852722-6ab42773-77fd-476c-bf79-1ad277da99c1.png" />
</p>

Finally, I'll remove the test and inconsistent ride lengths values.








<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153852889-f41265e9-8250-4be0-b04f-636d38ec3b22.png" />
</p>

## 4. Analyze + 5. Share
### Overview

I will perform the stages together, as I will visualise and share the findings as I go through.
I will perform my analysis by comparing the two groups, since understanding their differences is the goal. Anyway, I will exclude the rides longer than 24 hours, as there is a minority that hugely skews the data.

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153856001-3f7f1723-917a-4c27-9914-39863c09078e.png" />
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153872113-04826ce0-99f1-413e-b7f9-a9ced7893194.png" />
</p>

We can immediately see that about 2/3 of the rides are from members but they account for only about 1/3 of the time spent riding. 
But let's have a broader look.

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153876206-0abea156-5eb6-423e-a11a-7144b35d14b4.png" />
</p>

We get an immediate confirmation of the chart above.
We can see that the two groups share a similar pattern (especially from April to December). The main difference regards the winter.
Members are somehow consistent during this season, even though on a descending line (with the peak in April which might be related to COVID, given the fact the data is from 2020), while members are particularly inactive. 
It is interesting to note that from April to August (the peak) the volume of rides increase about 5 times for members while it increases about 12 times for members. 

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153901145-0b34f84e-f0fa-406e-85d5-f7e1c5988420.png" />
</p>

Regarding the average ride lengths, we can also see that members are quite consistent while casual riders tend to have more variation. 
As hinted by the previous chart we know can see that, averagely, members tend to do use bikes more often and for short rides compared to casual riders that do fewer rides but quite long ones (around 2 to 4 times longer).

### Seasonality

It is evident that seasonality plays a big role in terms of riding behaviour and for this reason, I want to dig deeper into the matter.
I'll therefore try to analyse data in quarters that roughly correspond to the four seasons.

#### Q1 - Winter

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/154130635-e84f7c32-6715-4d1c-be70-5866f911a80f.png" />
</p>

We can see that members are more active during the central days of the week, while casual riders are more active during the weekend, Sundays in particular.
In terms of time spent both groups are generally consistent throughout the week.
On top of this, I also want to see what are the most popular routes among the groups.


<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/153855563-9be991eb-aa04-4dad-86e7-6dc44ce135de.png" />
</p>

I have used a similar query for the members.

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/154131752-d5a4c064-9d97-4c6c-82c3-4dca7c0b54d4.png" />
</p>

We can see that the pattern here is quite different.
The most popular routes for members are in the inner part of the city (the first two routes pass through a university).
The most popular routes for casual riders are circular rides, which seem to hint at some kind of recreational ride as they are mostly close to the coast of Lake Michigan.

#### Q2 - Spring

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/154133367-5236a314-b72b-4a81-b622-768d0fe19265.png" />
</p>

In spring we can see a certain peak around the weekend for both groups, which is also reflected by the time spent riding.

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/154133776-7f2e1409-fdc4-4403-8bcb-abd8de3321ce.png" />
</p>

Here the pattern seems similar for casual riders while we can see an important presence of recreational routes among the members, alongside other routes in the inner part of the city.

#### Q3 - Summer

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/154135031-153c8027-6ae8-4ff8-a930-9d4b655212d8.png" />
</p>

In the summer we can an incredible increase in terms of the volume of rides in both groups.
Members are still consistent with spikes on Wednesday and the weekend, while casual riders peak from Friday to Sunday.
Again time spent is in line with the above-mentioned pattern.

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/154136005-1d503599-fa2f-4656-a9f5-3e93f7b16c3a.png" />
</p>

Popular routes are mostly the same we found in Spring but the figures are way larger.

#### Q4-Autumn

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/154343213-a19f4475-ef83-4683-afa5-4aba267f9d73.png" />
</p>

Here the pattern seems quite similar to one observed for Winter. 
Members are generally consistent, peaking during the week (Thursday) while casual riders have most of the rides toward the end of the week (from Friday to Sunday)

<p align="center">
  <img src="https://user-images.githubusercontent.com/69009356/154343475-b5b2bcbb-7ef3-4cc5-b460-8955f22bffeb.png" />
</p>

The most popular routes are also the same we observed during Winter.

## 6. Act
### Findings
To recap we have found the following:

**Members**

- Are active through all the year with
- The number of rides and average ride time suggest that they do frequent trips of short distance
- They tend to have most of the rides during the week in  Winter and Autumn and on the weekends in Spring and Summer
- Their top routes hint that they use the bike for work/studying purposes throughout the year and for a more recreational purpose during Spring and Summer

**Casual riders**
- Are active mostly during Spring and Summer
- The number of rides and average ride time suggest that they don't do frequent trips but when they do they spend a high amount of time
- They tend to have most of the rides during the end of the week, no matter the season
- Their top routes hint that they use the bike almost only for a recreational purpose

### Suggestions
To convert casual riders into members my suggestions would be the following:
- As most of the casual riders use the service from Spring to the end of the Summer, I will try to seize that moment for the marketing campaign
- As casual riders tend to ride the most towards the end of the week, they could be offered a "light" membership for the weekend
- Alternatively, given that they seem to enjoy leisure trips they could be offered an "entry-level" membership that leverages the sightseeing spots e.g. a sightseeing tour membership
- Again, as they tend to ride the longest, they could be offered an "entry-level" membership that gives them a discount on a full membership after they have spent a certain amount of time on the app or have done a certain amount of kilometers.
