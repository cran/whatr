library(testthat)
library(whatr)

expect_showgame <- function(object) {
  expect_true(is(object, "xml_document") & !grepl("ddred", object))
}

expect_showscores <- function(object) {
  expect_true(is(object, "xml_document") & grepl("ddred", object))
}

# id ----------------------------------------------------------------------

id <- sample(whatr::episodes$game, 1)
test_that("game ID can be converted to showgame HTML", {
  expect_showgame(whatr_html(id, out = "showgame"))
  Sys.sleep(runif(1, 5, 10))
})

test_that("game ID can be converted to showscores HTML", {
  expect_showscores(whatr_html(id, out = "showscores"))
  Sys.sleep(runif(1, 5, 10))
})

# html --------------------------------------------------------------------

game_url <- paste0("http://www.j-archive.com/showgame.php?game_id=", id)
game_html <- read_html(game_url)
score_url <- paste0("http://www.j-archive.com/showscores.php?game_id=", id)
score_html <- read_html(score_url)
test_that("showgame HTML can be converted to showscores HTML", {
  expect_showscores(whatr_html(game_html, out = "showscores"))
  Sys.sleep(runif(1, 5, 10))
})

test_that("showgame HTML can be converted to showgame HTML", {
  expect_showgame(whatr_html(game_html, out = "showgame"))
  Sys.sleep(runif(1, 5, 10))
})

test_that("showscores HTML can be converted to showscores HTML", {
  expect_showscores(whatr_html(score_html, out = "showscores"))
  Sys.sleep(runif(1, 5, 10))
})

test_that("showscores HTML can be converted to showgame HTML", {
  expect_showgame(whatr_html(score_html, out = "showgame"))
  Sys.sleep(runif(1, 5, 10))
})

# show --------------------------------------------------------------------

show <- paste0("#", sample(1:8000, 1))
test_that("show num can be converted to showgame HTML", {
  expect_showgame(whatr_html(show, out = "showgame"))
  Sys.sleep(runif(1, 5, 10))
})

test_that("show num can be converted to showscores HTML", {
  expect_showscores(whatr_html(show, out = "showscores"))
  Sys.sleep(runif(1, 5, 10))
})

# date --------------------------------------------------------------------

date <- sample(seq(from = as.Date("1984-09-10"), to = Sys.Date(), by = 7), 1)
test_that("air date can be converted to showgame HTML", {
  expect_showgame(whatr_html(date, out = "showgame"))
  Sys.sleep(runif(1, 5, 10))
})

test_that("air date can be converted to showscores HTML", {
  expect_showscores(whatr_html(date, out = "showscores"))
  Sys.sleep(runif(1, 5, 10))
})

# error -------------------------------------------------------------------

test_that("air date can be converted to showscores HTML", {
  expect_error(whatr_html("test", out = "showscores"))
  Sys.sleep(runif(1, 5, 10))
})
