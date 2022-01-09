---
title: 'A Reminder on the Importance of Exploratory Data Analysis: My First B2VB Entry'
author: ''
date: '2022-01-09'
slug: a-reminder-on-the-importance-of-exploratory-data-analysis-my-first-b2vb-entry
categories: [Tableau, Data Analysis]
tags: [Tableau, Data Analysis, B2VB]
description: ~
image: 'great_coaches.png'
math: ~
license: ~
hidden: no
comments: yes
---


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

Results in this


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
