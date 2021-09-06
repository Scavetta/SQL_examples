library(dplyr)
con <- DBI::dbConnect(RSQLite::SQLite(), path = ":dbname:")
con

copy_to(con, nycflights13::flights, "flights",
        temporary = FALSE,
        indexes = list(
         c("year", "month", "day"),
         "carrier",
         "tailnum",
         "dest"
        )
)

flights_db <- tbl(con, "flights")

flights_db

DBI::dbDisconnect(con)

# No longer valid:
flights_db
