source("C:/Users/DB/Documents/libs.R")

df <- valeursfoncieres_2020
rm(df)
rm(vf_2020)

vf_new %>%
  filter(`Code departement`== '38') -> isere

isere <- isere[,-c(18:24)]

isere %>%
  filter(`Surface reelle bati`>'0') -> isere

Typelocal <- isere %>%
  count(`Type local`) %>% 
  mutate(perc = (n / 8986)*100)

TypeVente2 <- isere %>%
  count(`Nature mutation`) %>% 
  mutate(perc = (n / sum(n))*100)

write.csv(x = isere, file = 'C:/Users/DB/Documents/isere.csv')

library(readr)
isere <- read_csv("isere.csv")
View(isere)


?write.csv()

isere <- isere %>%
  filter(`Nature mutation`=="Vente en l'état futur d'achèvement" | `Nature mutation` == "Vente")

isere <- isere[,-c(1, 12)]

rm(isere)

library(readr)
valeursfoncieres_2020 <- read_delim("C:/Users/DB/Downloads/valeursfoncieres-2020.txt", 
                                    delim = "|", escape_double = FALSE, trim_ws = TRUE)
View(valeursfoncieres_2020)

df %>%
  select(`No disposition`)%>%
  factor()
factor(df$`Code type local`)

colnames(isere)


