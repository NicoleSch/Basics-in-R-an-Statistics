library(tidyverse)
#Read insurance with date - with read_csv
insurance_with_date <- read_csv("data/raw/insurance_with_date.csv")
view(insurance_with_date)

#Read insurance with date - with read.csv
ins_w_d_ <- read.csv("data/raw/insurance_with_date.csv")
view(ins_w_d_)

#Review Data with read_csv
str(insurance_with_date)

#Review Data with read.csv
str(ins_w_d_)

#With read_csv you see that data is a better wirh read_csv as it e.g. recognizes
#that the some are dates. 

#Make factors out of the sex, and region

fac <- factor(paste(insurance_with_date$sex, insurance_with_date$region, sep = " "))


reformatted <- insurance_with_date |> 
  mutate(
    across(c(sex, region), factor),
    # sex = factor(sex),
    # region = factor(region),
    gt2_children = children > 2,
    smokes = smoker == "yes",
    date_6m = date + months(6)
    # date_6m = date + 30.4 * 6
  )
str(reformatted) 


