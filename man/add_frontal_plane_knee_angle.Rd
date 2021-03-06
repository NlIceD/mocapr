% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/frontal_plane_kinematics.R
\name{add_frontal_plane_knee_angle}
\alias{add_frontal_plane_knee_angle}
\title{Calculate frontal plane knee kinematics.}
\usage{
add_frontal_plane_knee_angle(.data)
}
\arguments{
\item{.data}{A tibble containg knee and ankle spatial joint center positions in the anatomical frontal plane. These positions can be created from
global spatial joint center positions using \code{project_full_body_to_AP()}}
}
\value{
The tibble supplied in \code{.data} argument with the added columns \code{LFPKA} and \code{RFPKA}.
}
\description{
Positive values of LFPKA and RFPKA reflects lateral deviation of the knee (knee varus).
}
\section{Equation}{

\if{html}{\out{<div style="text-align: center">}\figure{eqFPKA.png}{options: style="width:750px;max-width:90\%;"}\out{</div>}}
}

\section{Figure}{

\if{html}{\out{<div style="text-align: center">}\figure{pcFPKA.png}{options: style="width:750px;max-width:50\%;"}\out{</div>}}
}

\examples{
# Prepare data
df <- data.frame(
                 LA_APR = c(10,5,0,-5,-10),
                 LK_APR = c(0,0,0,0,0),
                 LA_APU = c(0,0,0,0,0),
                 LK_APU = c(10,10,10,10,10),
                 RA_APR = c(20,15,10,5,0),
                 RK_APR = c(10,10,10,10,10),
                 RA_APU = c(0,0,0,0,0),
                 RK_APU = c(10,10,10,10,10))

add_frontal_plane_knee_angle(df)
}
\references{
Stone EE, Butler M, McRuer A, Gray A, Marks J, Skubic M. Evaluation of the Microsoft Kinect for screening ACL injury. Conf Proc IEEE Eng Med Biol Soc. 2013;2013:4152-5.
\cr\cr Ortiz A, Rosario-Canales M, Rodriguez A, Seda A, Figueroa C, Venegas-Rios HL. Reliability and concurrent validity between two-dimensional and three-dimensional evaluations of knee valgus during drop jumps. Open access journal of sports medicine. 2016;7:65-73.
\cr\cr Harsted S, Holsgaard-Larsen A, Hestbaek L, Boyle E, Lauridsen HH. Concurrent validity of lower extremity kinematics and jump characteristics captured in pre-school children by a markerless 3D motion capture system. Chiropr Man Therap. 2019;27:39.
}
