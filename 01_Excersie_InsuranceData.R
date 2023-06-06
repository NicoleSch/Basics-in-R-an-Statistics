#Exercise 5

#Read data
insurance <- read.csv("data/raw/insurance_with_date.csv")
insurance <- insurance %>% mutate(children = as.factor(children))

head(insurance)

#Density plot
densityplot <- ggplot( insurance , aes(x = bmi, colour = sex, fill = sex ) ) + 
  geom_density( alpha = 0.4 ) +
  theme(text = element_text(size=20), legend.position = "bottom") +
  xlab( expression(paste( "BMI (kg/", m^2,")")) ) + 
  scale_colour_manual(name = "" , values=c("female"="navy",
                                           "male"="red"), labels = c("Female", "Male")) +
  scale_fill_manual(name = "", values=c("female"="navy",
                                        "male"="red"), labels = c("Female", "Male")) 
print(densityplot)

#Histogram
histogram <- ggplot( insurance ) + 
  geom_histogram( aes(x = charges, y = after_stat(density), colour = sex, fill = sex ),
                  alpha = 0.4, bins = 100 ) +
  geom_density( aes(x = charges, colour = sex), linewidth = 1.5 ) +
  theme(text = element_text(size=20), legend.position = "top") +
  xlab( "Charges in Dollar" ) + 
  scale_colour_manual(name = "" , values=c("female"="navy",
                                           "male"="red"), labels = c("Female", "Male")) +
  scale_fill_manual(name = "", values=c("female"="navy",
                                        "male"="red"), labels = c("Female", "Male"))  +
  geom_vline(aes(xintercept = median(charges)), color = "red", linewidth = 1)
print(histogram)

#Exercise 5B
quantiles <- ggplot( insurance , aes(x = age, y = bmi, color =smoker) ) + 
  geom_point(  ) +
  geom_quantile(  ) +
  theme(text = element_text(size=20), legend.position = "top") +
  xlab( "Age (years)" ) + ylab( expression(paste( "BMI (kg/", m^2,")")) ) + 
  scale_colour_manual(name = "" , values=c("no"="navy",
                                           "yes"="red"), labels = c("No", "Yes")) +
  scale_fill_manual(name = "" , values=c("no"="navy",
                                         "yes"="red"), labels = c("No", "Yes"))
print(quantiles)

#Exercise 5C
ggplot( insurance , aes(x = smoker, y = charges ) ) + 
  ylab( "Charges ($)" ) +
  geom_violin(  )

ggplot( insurance , aes(x = smoker, y = charges ) ) + 
  geom_boxplot(  ) + 
  ylab( "Charges ($)" ) + 
  coord_flip()