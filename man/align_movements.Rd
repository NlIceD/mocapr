% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/align_movements.R
\name{align_movements}
\alias{align_movements}
\title{Time align two or more motion capture recordings containing the same event.}
\usage{
align_movements(
  .data,
  .group_var,
  event_var,
  event_value,
  return_equal_length_groups = TRUE,
  prolong_event = 1
)
}
\arguments{
\item{.data}{A tibble containing multible movements that are grouped by a variable (provided in group_var), and that all contain the same event (provided in event_var and event_value). )}

\item{.group_var}{The grouping variable of the movements. Mulitble variables should be given using unquoted variable names inside c(), e.g., c(group1, group2)}

\item{event_var}{The variable that you wish to align the movements by}

\item{event_value}{The value in even_var that you wish to align the movements by}

\item{return_equal_length_groups}{TRUE/FALSE. If the movements are of different lengths. Should the first and last rows of the shorter movements be duplicated? Defaults to TRUE.}

\item{prolong_event}{Must be a positive whole number. Should the event that you match the movements on be prolonged? It will essentially create a freeze for a given number of frames. Defaults to 1}
}
\value{
An ungrouped tibble.
}
\description{
\code{align_movements()} time-aligns the groups in a tibble to an event. All groups (movements) must contain the same event supplied with arguments \code{event_var} and \code{event_value}.
The event must only occur once within each group.
The frame numbers in the movements will be syncrhonised according to the supplied event,
and the event will occur at the same framenumber for all movements.
}
\examples{
# Generate data
df <- tibble::tibble(
    frame = c(rep(seq(1:5), 2), 1, 2, 3, 4,
              101, 102, 103, 104, 105, 106,
              401, 402, 403),
    x = rnorm(n = 23),
    ID = c(rep(c(1,2), each = 5),
           3, 3, 3, 3, 4, 4, 4,
           4, 4, 4, 5, 5, 5),
    aligner = c(NA, "here", NA, NA, NA,
                NA, NA, "here", NA, NA,
                "here", NA, NA, NA, NA,
                NA, "here", NA, NA, NA,
                NA, NA, "here"))
# Align movements
align_movements(df,
                .group_var = ID,
                event_var = aligner,
                event_value = "here",
                return_equal_length_groups = TRUE,
                prolong_event = 1)
}
