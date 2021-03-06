#Document mocapr_synthetic_data
#' @title Synthetic motion capture data of spatial joint-center positions in the anatomcial frontal plane
#' @description `mocapr_synthetic_data` contains synthetic motion catpure data of joint-center positions in the anatomical planes.
#' The data contains postures that are intended to help with the understanding of the frontal plane kinematics that can be calculated using the \code{mocapr} package.
#' Futhermore, the postures also display planar cross-talk issues with some frontal plane kinematics.\cr\cr
#'  Each joint is represented by 3 columns up (_APU), right (_APR), forward (_APF).
#'  The _APF forward columns are not used for generating frontal plane kinematic and, therefore, only contains the value 0 at all positions.
#'  All joint related variables are abbreviated according to their side (L|R),
#'  joint(A|K|H|S|E|W). E.g., \code{LK_FPR} contains the spatial right position in the anatomical planes for the left knee.\cr
#'  Please see GitHub README.md for more information.
#' @format A \code{tibble}
#' \describe{
#'   \item{_APU}{A variable containg the 'Up' spatial position.}
#'   \item{_APR}{A variable containg the 'Right' spatial position.}
#'   \item{_APF}{A variable containg the 'Forward' spatial position. Not relevant in this data.}
#'   \item{frame}{Frame number.}
#'   \item{row_fa}{A variable usefull for facceting plots.}
#'   \item{col_fa}{A variable usefull for facceting plots.}
#'   \item{sample}{A variable usefull for filtering the data.\cr Sample == 1 Contains postures that are intended to help with the visual understanding of the frontal plane
#'   kinematic measures.\cr Sample == 2 displays three movements where the knee and ankle joint positions are constant, and the hip joints are descending.
#'   This is usefull for displaying issues with planar-cross-talk for some of the frontal plane kinematics.}
#'   }
#' @name mocapr_synthetic_data
#' @docType data
#' @author Steen Harsted \email{steenharsted@gmail.com}
#' @references The data is synthetic.
#' @keywords data
"mocapr_synthetic_data"
