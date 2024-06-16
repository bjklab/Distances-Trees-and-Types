#' #######################
#' load libraries and set seed
#' #######################
#' 
#' 
library(tidyverse)
library(officer)
library(gt)

set.seed(16)


#' #######################
#' load data
#' #######################
#' 
#' 
cceb_pptx <- system.file(package = "officer",
  "doc_examples/example.pptx")

cceb_doc <- read_pptx("BJK CCEB ID EPI seminar 20220602.pptx")

cceb_content <- pptx_summary(cceb_doc)

image_row <- cceb_content[cceb_content$content_type %in% "image", ]

media_file <- image_row$media_file

#png_file <- tempfile(fileext = ".png")

media_extract(cceb_doc, path = media_file, target = "img/pptx_img/")
