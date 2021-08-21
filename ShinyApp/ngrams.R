library(stringr)
library(dplyr)
library(tidyr)
library(tidytext)

two_words <- readRDS("two_words_25pct.rds")
three_words <- readRDS("three_words_25pct_v2.rds")
four_words <- readRDS("four_words_25pct_v2.rds")
five_words <- readRDS("five_words_25pct_v2.rds")

guess_2nd_word <- function(words_input){
    filter_result_1 <- filter(two_words,
                              word_1 == words_input[1])
    filter_result_2 <- filter(filter_result_1,
                              row_number() == 1L)
    word_output <- as.character(filter_result_2[2])
    ifelse(word_output == "character(0)", "Sorry! Not idea!", return(word_output))
}

guess_3rd_word <- function(words_input){
    filter_result_1 <- filter(three_words,
                              word_1 == words_input[1],
                              word_2 == words_input[2])
    filter_result_2 <- filter(filter_result_1,
                              row_number() == 1L)
    word_output <- as.character(filter_result_2[3])
    ifelse(word_output == "character(0)", "Sorry! Not idea!", return(word_output))
}

guess_4th_word <- function(words_input){
    filter_result_1 <- filter(four_words,
                              word_1 == words_input[1],
                              word_2 == words_input[2],
                              word_3 == words_input[3])
    filter_result_2 <- filter(filter_result_1,
                              row_number() == 1L)
    word_output <- as.character(filter_result_2[4])
    ifelse(word_output == "character(0)", "Sorry! Not idea!", return(word_output))
}

guess_5th_word <- function(words_input){
    filter_result_1 <- filter(five_words,
                              word_1 == words_input[1],
                              word_2 == words_input[2],
                              word_3 == words_input[3],
                              word_4 == words_input[4])
    filter_result_2 <- filter(filter_result_1,
                              row_number() == 1L)
    word_output <- as.character(filter_result_2[5])
    ifelse(word_output == "character(0)", "Sorry! Not idea!", return(word_output))
}

guess_next_word <- function(string_input) {
    string_input <- tibble(text = string_input)
    words_count <- str_count(string_input, boundary("word"))
    words_input <- unlist(str_split(string_input, boundary("word")))
    words_input <- tolower(words_input)
    word_output <- ifelse(words_count == 0, "",
                          ifelse(words_count == 1, guess_2nd_word(words_input),
                                 ifelse(words_count == 2, guess_3rd_word(words_input),
                                        ifelse(words_count == 3, guess_4th_word(words_input),
                                               ifelse(words_count == 4, guess_5th_word(words_input),
                                                      "Sorry! Too many words!")))))
    return(word_output)
}
