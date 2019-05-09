mocapr
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

`mocapr` uses a series of tidyverse packages to import
([`tidyr`](https://github.com/tidyverse/tidyr),
[`dplyr`](https://github.com/tidyverse/dplyr),
[`stringr`](https://github.com/tidyverse/stringr),
`forcats`(<https://github.com/tidyverse/forcats>)), plot
([`ggplot2`](https://github.com/tidyverse/ggplot2)), animate
([`gganimate`](https://github.com/thomasp85/gganimate)), and analyse
motion capture data.

\#\#Why this package?

\#\#The Vision

\#\#Can you help?

## Installation

`mocapr` can be installed directly from github using devtools:

``` r
# install.packages('devtools')
devtools::install_github('steenharsted/mocapr')
```

\#\#Example 1

``` r
library(mocapr)

#Data
Jump <- mocapr::jump_1

#Project to Anatomical Planes 
Jump <- cbind(Jump,
              #Upper extremity
              Project_to_AP(Jump, Y=LSY, X=LSX, Z=LSZ, New_Name = "LS"),
              Project_to_AP(Jump, Y=LEY, X=LEX, Z=LEZ, New_Name = "LE"),
              Project_to_AP(Jump, Y=LWY, X=LWX, Z=LWZ, New_Name = "LW"),
              Project_to_AP(Jump, Y=RSY, X=RSX, Z=RSZ, New_Name = "RS"),
              Project_to_AP(Jump, Y=REY, X=REX, Z=REZ, New_Name = "RE"),
              Project_to_AP(Jump, Y=RWY, X=RWX, Z=RWZ, New_Name = "RW"),
              #Lower extremity
              Project_to_AP(Jump,Y=LKY, X=LKX, Z=LKZ, New_Name = "LK"),
              Project_to_AP(Jump,Y=LHY, X=LHX, Z=LHZ, New_Name = "LH"),
              Project_to_AP(Jump,Y=LAY, X=LAX, Z=LAZ, New_Name = "LA"),
              Project_to_AP(Jump,Y=LTY, X=LTX, Z=LTZ, New_Name = "LT"),
              Project_to_AP(Jump,Y=RKY, X=RKX, Z=RKZ, New_Name = "RK"),
              Project_to_AP(Jump,Y=RHY, X=RHX, Z=RHZ, New_Name = "RH"),
              Project_to_AP(Jump,Y=RAY, X=RAX, Z=RAZ, New_Name = "RA"),
              Project_to_AP(Jump,Y=RTY, X=RTX, Z=RTZ, New_Name = "RT"))

#Animate the anatomical projections
Jump %>% animate_anatomical(nframes = nrow(.)*2, fps = 50, rewind = FALSE)
```

    ## Registered S3 methods overwritten by 'ggplot2':
    ##   method         from 
    ##   [.quosures     rlang
    ##   c.quosures     rlang
    ##   print.quosures rlang

![](README_files/figure-gfm/unnamed-chunk-1-1.gif)<!-- -->

\#\#Example 2

``` r
#Project to movements planes
Jump <- cbind(Jump,
              #Upper extremity
              Project_to_MP(Jump, Y=LSY, X=LSX, Z=LSZ, New_Name = "LS"),
              Project_to_MP(Jump, Y=LEY, X=LEX, Z=LEZ, New_Name = "LE"),
              Project_to_MP(Jump, Y=LWY, X=LWX, Z=LWZ, New_Name = "LW"),
              Project_to_MP(Jump, Y=RSY, X=RSX, Z=RSZ, New_Name = "RS"),
              Project_to_MP(Jump, Y=REY, X=REX, Z=REZ, New_Name = "RE"),
              Project_to_MP(Jump, Y=RWY, X=RWX, Z=RWZ, New_Name = "RW"),
              #Lower extremity
              Project_to_MP(Jump,Y=LKY, X=LKX, Z=LKZ, New_Name = "LK"),
              Project_to_MP(Jump,Y=LHY, X=LHX, Z=LHZ, New_Name = "LH"),
              Project_to_MP(Jump,Y=LAY, X=LAX, Z=LAZ, New_Name = "LA"),
              Project_to_MP(Jump,Y=LTY, X=LTX, Z=LTZ, New_Name = "LT"),
              Project_to_MP(Jump,Y=RKY, X=RKX, Z=RKZ, New_Name = "RK"),
              Project_to_MP(Jump,Y=RHY, X=RHX, Z=RHZ, New_Name = "RH"),
              Project_to_MP(Jump,Y=RAY, X=RAX, Z=RAZ, New_Name = "RA"),
              Project_to_MP(Jump,Y=RTY, X=RTX, Z=RTZ, New_Name = "RT"))

#Animate the movement plane projections
Jump %>% animate_movement(nframes = nrow(.)*2, fps = 50, rewind = FALSE)
```

![](README_files/figure-gfm/unnamed-chunk-2-1.gif)<!-- -->
