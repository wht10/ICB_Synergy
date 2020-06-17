if (!require("pacman")) install.packages("pacman")
pacman::p_load("tidyverse", "survival","survminer","readr")

library(tidyverse)
library(survival)
library(survminer)
library(readr)

urlfile <- "https://raw.githubusercontent.com/wht10/ICB_Synergy/master/ICB_Synergy_Data.csv"
if(!exists("dat"))
  dat <- read_csv(url(urlfile))

dat <- dat %>% mutate(treatment = as.factor(treatment)) %>%  
  mutate(geno = as.factor(geno))

res.cox <- coxph(Surv(days_pi,censored) ~ geno + treatment + geno:treatment, data = dat)
summary(res.cox)

res.cox <- coxph(Surv(days_pi,censored) ~ geno + treatment, data = dat)
summary(res.cox)

res.cox <- coxph(Surv(days_pi,censored) ~ geno:treatment, data = dat)
summary(res.cox)

http://www.sthda.com/english/wiki/cox-proportional-hazards-model
http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.459.4496&rep=rep1&type=pdf
