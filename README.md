mocapr
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

`mocapr` uses a series of tidyverse packages to import
([`readr`](https://github.com/tidyverse/readr),
[`tidyr`](https://github.com/tidyverse/tidyr),
[`dplyr`](https://github.com/tidyverse/dplyr),
[`stringr`](https://github.com/tidyverse/stringr),
[`forcats`](https://github.com/tidyverse/forcats)), plot
([`ggplot2`](https://github.com/tidyverse/ggplot2)), animate
([`gganimate`](https://github.com/thomasp85/gganimate)), and analyse
motion capture data.  
The package also contains sample data set `MOCAP_data` which is
generated using some of the above packages as well as
[`purrr`](https://github.com/tidyverse/purrr).

While all functions should run without loading other libraries I
strongly recommend you load the \[`tidyverse`\].

The current state of the package is **work in progress**.  
Feedback and suggestions for improvements are most welcome.

## Why this package?

The field of motion capture has expanded rapidly over the last years
Motion capture data has become readily availble, and more will come It
is becoming easy to collect this type of data Most systems are using
their own export formats (especially true for markerless motion
capture), and Open source tools to work with this data has not followed
the same trajectory.

\#\#The Vision

\#\#Can you help? Yes. Clinical background, ended up with the
programming part by nessescity. No programming skills when I started the
Ph.D., and I consider myself a beginner/intermediate R-user. While I
think the code is correct, I am quite sure that it is not optimal.
Input….

Data + video(if possible) Function to import data into the
`mocapr`format

## Installation

`mocapr` can be installed directly from github using devtools:

``` r
# install.packages('devtools')
devtools::install_github('steenharsted/mocapr')
```

\#\#The Data All data currently obtained from the CapturyLive system
Kinetisense to come Vicon plug-in-gait likely to come

``` r
library(mocapr)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
#Data
mocapr::MOCAP_data %>% 
  group_by(movement_nr, movement_description) %>% 
  tidyr::nest()
```

    ## # A tibble: 5 x 3
    ##   movement_nr movement_description                            data         
    ##         <dbl> <chr>                                           <list>       
    ## 1           1 standing long jump for maximal performance      <tibble [172~
    ## 2           2 standing long jump with simulated poor landing~ <tibble [228~
    ## 3           3 normal gait in a straight line                  <tibble [157~
    ## 4           4 normal gait in a semi square                    <tibble [375~
    ## 5           5 caipoera dance                                  <tibble [1,2~

``` r
Jump <- mocapr::MOCAP_data %>%
  filter(movement_nr == 1)
```

\#\#Example 1

``` r
#Project to movements planes
Jump %>% 
  project_full_body_to_MP() %>%
  #Animate the movement plane projections
  animate_movement(nframes = nrow(.)*2, fps = 50, rewind = FALSE)
```

    ## Registered S3 methods overwritten by 'ggplot2':
    ##   method         from 
    ##   [.quosures     rlang
    ##   c.quosures     rlang
    ##   print.quosures rlang

![](README_files/figure-gfm/unnamed-chunk-2-1.gif)<!-- -->

\#\#Example 2

``` r
#Project to Anatomical Planes 
Jump %>% 
  project_full_body_to_AP() %>% 
  #Animate the anatomical projections
  animate_anatomical(nframes = nrow(.)*2, fps = 50, rewind = FALSE)
```

![](README_files/figure-gfm/unnamed-chunk-3-1.gif)<!-- -->

``` r
library(dplyr)
Jump %>% 
  project_full_body_to_AP() %>% 
  filter(frame == 1 | frame == 50 | frame == 75| frame == 100 | frame == 150 | frame == max(frame)) %>% 
  animate_anatomical(animate = FALSE)
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

``` r
library(dplyr)
Jump %>% 
  project_full_body_to_MP() %>% 
  filter(frame == min(frame) | frame == max(frame) | frame == 50) %>% 
  animate_movement(animate = FALSE)
```

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->
