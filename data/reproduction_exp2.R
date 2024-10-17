##################################################################

# Reproducing original experiment from Salzmann et al. (2022)

if(!require(lme4)){
  install.packages("lme4", type = "source")
  library(lme4)
}


df <- read.csv(file="exp8.csv", head = TRUE)
head(df)

df_glmm <- subset(df, df$question==2)
head(df_glmm)

df_glmm$phrase <- as.factor(df_glmm$phrase)
df_glmm$mov <- as.factor(df_glmm$mov)
df_glmm$argadj <- as.factor(df_glmm$argadj)

df_glmm$argadj  = relevel(df_glmm$argadj , ref = "argument") # set argument as baseline

contrasts(df_glmm$phrase)
contrasts(df_glmm$argadj)
contrasts(df_glmm$mov)


#Original model 1 
m_1 <- glmer(value ~ phrase * mov * argadj + (1|item), data = df_glmm, family = binomial)
summary(m_1)


#Original model 2
df_glmm$mov  = relevel(df_glmm$mov , ref = "moved") # set moved as baseline

m_2 <- glmer(value ~ phrase * mov * argadj + (1|item), data = df_glmm, family = binomial)
summary(m_2)

df_glmm$mov  = relevel(df_glmm$mov , ref = "in situ") # set in situ again as baseline

##################################################################

# Fitting the same GLMMs with data from LLM


df <- read.csv(file="gpt35Turbo_results_iter4_temp0_zero.csv", head = TRUE)
head(df)

df_glmm <- subset(df, df$question_no=="Q2")
head(df_glmm)

df_glmm$phrase <- as.factor(df_glmm$phrase)
df_glmm$mov <- as.factor(df_glmm$mov)
df_glmm$argadj <- as.factor(df_glmm$argadj)

df_glmm$argadj  = relevel(df_glmm$argadj , ref = "argument") # set argument as baseline

contrasts(df_glmm$phrase)
contrasts(df_glmm$argadj)
contrasts(df_glmm$mov)


#LLM model 3 
m_3 <- glmer(value ~ phrase * mov * argadj + (1|item), data = df_glmm, family = binomial)
summary(m_3)


#LLM model 4
df_glmm$mov  = relevel(df_glmm$mov , ref = "moved") # set moved as baseline

m_4 <- glmer(value ~ phrase * mov * argadj + (1|item), data = df_glmm, family = binomial)
summary(m_4)

df_glmm$mov  = relevel(df_glmm$mov , ref = "in situ") # set in situ again as baseline

##################################################################