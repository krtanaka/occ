library(RODBC)
library(odbc)
library(DBI)
library(dbplyr)
library(dplyr)

# PIC - ktanaka/Nereus0406!
# GIS - ktanaka/n3ks#Wr1d0FlaHo

# Open connection to database
ch_dplyr <- dbConnect(
  odbc::odbc(),
  dsn = "GIS",
  uid = rstudioapi::askForPassword("Oracle user name"),
  pwd = rstudioapi::askForPassword("Oracle password")
)

# View which tables are included in the GISDAT schema
tables <- dbListTables(ch_dplyr, schema = "GISDAT")


db <-
  tbl(ch_dplyr, in_schema("GISDAT", 'MV_OCN_NCEI_STR_HI'))

# Generate query 
str <- db %>%
  filter(YEAR == "2019" & OCC_SITEID == "OCC-KUR-001") %>%
  collect()
