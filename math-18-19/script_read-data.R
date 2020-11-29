library(tidyverse)

palMATH = c("#009E73", "#abd9e9", "#b2182b")  #CBA - matching colorbrewer RdBu
mathcats = c("A1","A2","A3","B1","B2","C1","C2","C3")

ratings = read.csv(here::here("data_math_1819.csv"), header = TRUE, stringsAsFactors = FALSE) %>%
  mutate(
    Course = str_trim(Course),
    Year = str_trim(Year),
    Paper = str_trim(Paper),
    Paper = str_replace(Paper, "December", "Dec"),
    Paper = str_replace(Paper, "August", "Aug"),
    #    Course = if_else(Course=="A-Level",if_else(Paper=="FP3","A-Level FP3", "A-Level C1-C4"),Course),
    Course = if_else(Course=="A-Level", paste("A-Level",Paper), Course),
    Paper = if_else(Course=="TMUA", paste0("P",parse_number(Paper)), Paper),
    Course = if_else(Course=="TMUA", paste("TMUA",Paper), Course),
    MATH = fct_relevel(fct_expand(as.factor(str_trim(MATH)), mathcats), mathcats),
    MATH_Group = as.factor(str_sub(MATH,1,1))
  )

papertotals = ratings %>%
  group_by(Course,Year,Paper) %>%
  summarise(
    total_marks_for_paper = sum(Marks)
  )

MATH_Group_proportions = ratings %>%
  group_by(Course,Year,Paper,MATH_Group) %>%
  summarise(
    total_marks_for_Group = sum(Marks)
  ) %>%
  # add in the missing "0%" entries
  complete(nesting(Course,Year,Paper),MATH_Group, fill = list(total_marks_for_Group = 0)) %>%
  left_join(papertotals) %>%
  mutate (
    prop_marks = total_marks_for_Group / total_marks_for_paper,
    Exam = paste(Year, Paper)
  ) %>%
  arrange(desc(MATH_Group)) %>%
  ungroup() 


# Helper function that will format an HDI around the mean
formathdi <- function(bestobj, param, places) {
  return(paste0( format(round(bestobj[param,"mean"], places), nsmall = places),
                 " (",
                 bestobj[param,"HDI%"],
                 "% HDI [",
                 format(round(bestobj[param,"HDIlo"], places), nsmall = places),
                 ", ",
                 format(round(bestobj[param,"HDIup"], places), nsmall = places),
                 "])"))
}