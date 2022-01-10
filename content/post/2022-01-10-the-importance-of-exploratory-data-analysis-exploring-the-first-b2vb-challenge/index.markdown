---
title: 'The importance of exploratory data analysis: Exploring the first B2VB challenge'
author: 'Darragh Murray'
date: '2022-01-10'
slug: the-importance-of-exploratory-data-analysis-exploring-the-first-b2vb-challenge
categories: [Data Analysis, Tableau, Rstats]
tags: [Data Analysis, Tableau, Rstats, EDA, B2VB]
description: ~
image: "great_coaches.png"
math: ~
license: ~
hidden: no
comments: yes
---
I kicked off the year participating in a brand-new data visualisation curated by [Eric Balish](https://twitter.com/ReadySetData). It’s called **‘Back to Viz Basics’**, also known by its hashtag #B2VB. It’s a fortnightly challenge where the data visualisation community – both new and old – come together to practice some core charting skills. [You can read about the initiative here](https://www.thetableaustudentguide.com/vizbasics).

The first ‘official’ challenge was on the theme of the **scatter plot**, a chart type that’s a core communication tool of the data professional. Eric challenged us to analyse some [American college basketball data](https://data.world/back2vizbasics/2020week1-build-a-scatter-plot), specifically on coaching, to sharpen our scatter plot skills. Given I was on holidays, I blasted out a chart analysing win percentage (%) versus coaching longevity (measured in seasons).

Over the next few days, I watched the #datafam community publish many beautiful scatterplots, often far more complex than the basic one I threw together. But it became increasingly clear that the challenge Eric posted required more in depth thought than perhaps he initially intended (or perhaps he did, Eric – let me know!). 

Not only was this an exercise in building scatterplots, but it was also fundamentally an exercise in answering specific problem using the basic tools of **exploratory data analysis**. 

I’m going to briefly outline my process to answering the B2VB challenge showing why this is, and finish with a small sermon about why dual-use challenges like B2VB are excellent arenas for developing the key skills of the data professional. You’ll see some #rstats thrown in the mix as well.

###The Analytics Problem

The task was to examine some NCAA basketball coaching data. Critically, Eric asked us:
>“I’d like to understand if there is a relationship between ‘Season Coaching’ and ‘Overall Win Percentage.” 

This is what I usually refer to as the analytics problem. It’s the key question that drives both the data analysis and the output of the analysis – in this case, a scatter plot data visualisation.

###The Importance of Exploratory Data Analysis

Getting an understanding of the data you’re working with is a crucial step to completing any analyses. There are many great commentaries on why this is, but I’ll just leave you with this quote from a great book on doing data science from Hadley Wickham and Garrett Grolemund which neatly sums up its importance:

>“EDA is an important part of any data analysis, even if the questions are handed to you on a platter, because you always need to investigate the quality of your data. Data cleaning is just one application of EDA: you ask questions about whether your data meets your expectations or not. To do data cleaning, you’ll need to deploy all the tools of EDA: visualisation, transformation, and modelling.” ([Source](https://r4ds.had.co.nz/exploratory-data-analysis.html))

###Variable selection

The dataset itself contains 101 observations of six variables.

* Coach (String representing the name of the NCAA coach)
*	School (String representing the school the coach works at)
*	Seasons Coaching (numeric representing the number of seasons the coach has participated in)
*	Wins (numeric representing the number of victories the coach has had)
*	Losses (numeric representing the number of victories the coach has had)
*	Win Percentage (numeric representing the percentage of total games the coach has won – or wins / (wins+losses))

We don’t have a wide variety of variables to work with in this instance, and taking the analytics question into account, I decided to primarily work with Win Percentage and Seasons Coaching are they seemed the most relevant to the task at hand. 

###Interrogating the data

So, what do these variables *actually* look like? Let’s look at their distributions starting with *Seasons Coaching*. Here’s a histogram.


```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
```

```
## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
## ✓ tibble  3.1.6     ✓ dplyr   1.0.7
## ✓ tidyr   1.1.4     ✓ stringr 1.4.0
## ✓ readr   2.1.1     ✓ forcats 0.5.1
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```
## You can cite this package as:
##      Patil, I. (2021). Visualizations with statistical details: The 'ggstatsplot' approach.
##      Journal of Open Source Software, 6(61), 3167, doi:10.21105/joss.03167
```

```
## Warning: Removed 2 rows containing non-finite values (stat_bin).
```

```
## Warning: Removed 2 rows containing missing values (geom_bar).
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-1-1.png" width="672" />

We can immediately see that this variable is limited. All the coaches in the data have coached over five seasons. This is quite interesting because it gives rise to another question: *where are all the coaches who coach less than five seasons? Do they limitations impact our approach to the analytics problem?*

With that in mind, let’s turn our mind to the other key variable of interest: *Win Percentage (%)*. Here’s a plot:

