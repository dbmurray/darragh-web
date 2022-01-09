---
title: 'A Reminder on the Importance of Exploratory Data Analysis: My First B2VB Entry'
author: ''
date: '2022-01-09'
slug: a-reminder-on-the-importance-of-exploratory-data-analysis-my-first-b2vb-entry
categories: [Tableau, Data Analysis]
tags: [Tableau, Data Analysis, B2VB, rstats]
description: ~
image: 'great_coaches.png'
math: ~
license: ~
hidden: no
comments: yes
---
[Eric Balish](https://twitter.com/ReadySetData) has started a brilliant new data visualisation challenge called [Back to Viz Basics (B2VB)](https://www.thetableaustudentguide.com/vizbasics). 

For those unfamiliar, B2VB is a fortnightly challenge where a dataset is posted on data.world and participants must build a particular visualisation based on that dataset. The first 'official' challenge was practising one of the critical charts in any data professional's armoury - the scatter plot. 

We were tasked with working with [US college basketball coaching data](https://data.world/back2vizbasics/2020week1-build-a-scatter-plot). Critically, Eric asked us the following: "*The data we are working with comes from the NCAA. We are looking at some Men's Basketball Coaching Records. I'd like to understand if there is a relationship between Seasons Coaching and overall Win Percentage.*"

Given I was on annual leave, I jumped in early in the piece. I quickly ran the dataset through R to check the variables and their relationships to each other, whipped up a basic scatterplot in Tableau and then added a few little bells and whistles and came up with this:

[NCAA Coaching Longevity v Win %](great_coaches_full.png)

* [See the full interactive on Tableau](https://public.tableau.com/app/profile/darragh.murray/viz/MoreThanGamesCoached/GreatCoaches)

In asnswering the core question put to us in the challenge, I concluded **no meaningful relationship*

Why did I conclude this? Well the answer is in the summary statistics from running the data through a basic R linear regression analysis.


```r
library(readxl)
winning_coaches <- read_excel("NCAA DI Winningest Active Coaches.xlsx")
winning_coaches.lm = lm(`Seasons Coaching` ~ `Win Percentage`, data = winning_coaches)
summary(winning_coaches.lm)
```

```
## 
## Call:
## lm(formula = `Seasons Coaching` ~ `Win Percentage`, data = winning_coaches)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -14.510  -7.651  -2.190   6.094  22.264 
## 
## Coefficients:
##                  Estimate Std. Error t value Pr(>|t|)  
## (Intercept)       -0.6025    11.0023  -0.055    0.956  
## `Win Percentage`  28.3769    17.0400   1.665    0.099 .
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 9.397 on 99 degrees of freedom
## Multiple R-squared:  0.02725,	Adjusted R-squared:  0.01742 
## F-statistic: 2.773 on 1 and 99 DF,  p-value: 0.09901
```

Two key summary statistics immediately jump out - the **R-squared value** and the **p-statistic**. 

R-squared, being the measure that shows how much of the variance for a dependent variable (in this case *win%*) that is explained by the independent variable (*seasons coached*). Typically, data modelers would ideally want this value as close to 1 as possible, but in this case we see the value is extremely low at 0.027. This tells us that there is little relationship between these two variables. 

The p-statistic is also high at 0.09. Typically, to have a statistically significant relationship, we want the p value <0.05 otherwise there is a case that the null hypothesis, that there is no relationship between seasons coached and win %, is a possibility. 

Based on these two statistics, there is a good case for saying that we cannot say there is any meaningful relationship between seasons coached and win percentage.

Looking closer at the data.

A close look at the data and some critical refleciton on what it tells us unveils why any meaningful relationship between these two variables failed to materialise:

* Firstly, the data is *limited* to coaches who have already already have pretty great win percentages. The minimum value in the dataset is 57% with the mean around 64%. These are incredibly high win percetnages in any sport and is our first clue that the dataset we're working with is likely incomplete.


```r
summary(winning_coaches$`Win Percentage`)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.5730  0.6020  0.6300  0.6433  0.6710  0.8170
```

* Secondly, when you look at the summary statistics for seasons coached, you find similar evidence of the limitations of the data, with the minimum amount of season coached being 5. This again provides evidence that we're dealing with a dataset that makes it difficult to evaluate the core problem provided in the challenge.


```r
summary(winning_coaches$`Seasons Coaching`)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    5.00   10.00   16.00   17.65   23.00   42.00
```

* Finally, putting these facts together - it *totally makes sense*. Coaches in any sport who are successful at a sporting organisation will likely have more wins than the unsuccessful coaches and higher win %, therefore their careers will be longer (and thus, they coach more seasons). What we are *NOT* seeing in the data is those coaches who performed poorly, had low win percentages and did not coach past a certain number of seasons. 


