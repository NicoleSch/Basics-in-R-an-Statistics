#Excercise 4
library(tidyverse)

#Import data
dat <- read_csv("~/Documents/PhD/Basics in Statistics and R/Excercise01/data/raw/ebola.csv")
View(dat)

#Sort data
dat_before <- dat |> filter(Date < "2015-04-01") #Filter by dates before 31.03.2015

dat_countries <- dat_before |> filter(Country %in% c("Spain", "Sierra Leone", "Liberia"))

#Plot V0 points
plot_ebola_point_v0 <- ggplot(data = dat_countries, 
    mapping = aes(x = Date, y = Cum_conf_cases)) + 
          geom_point()
print(plot_ebola_point_v0)

#Plot V0 lines
plot_ebola_lines_V0 <- ggplot(data = dat_countries, 
       mapping = aes(x = Date, y = Cum_conf_cases)) + 
  geom_line(mapping = aes(group = Country))
print(plot_ebola_lines_V0)

#Plot V0 column
plot_ebola_column_V0 <- ggplot(data = dat_countries, 
       mapping = aes(x = Date, y = Cum_conf_cases)) + 
  geom_col(position = "stack")
print(plot_ebola_column_V0)

#Adding colors - Exercise 4C
#Point
plot_ebola_point_v01 <- ggplot(data = dat_countries, 
                          mapping = aes(x = Date, y = Cum_conf_cases)) +
                            geom_point(alpha = 0.8, colour = "black", fill = "navy", 
                              shape = 21, size = 1.5, stroke = 1.1)
print(plot_ebola_point_v01)

#Line
plot_ebola_line_v01 <- ggplot(data = dat_countries, 
                          mapping = aes(x = Date, y = Cum_conf_cases)) + 
                            geom_line(mapping = aes(group = Country), 
                            alpha = 0.7, colour = "navy", linetype = "solid", linewidth = 1.5)
print(plot_ebola_line_v01)

#Column
plot_ebola_col_v01 <- ggplot(data = dat_countries, 
                            mapping = aes(x = Date, y = Cum_conf_cases)) + 
                              geom_col(position = "stack", alpha = 0.7, fill = "navy", 
                                       linetype = "solid", linewidth = 0.5, width = 0.7)
print(plot_ebola_col_v01)

#Color by country - Excercise 4D
#Point
plot_ebola_point_v02 <- ggplot(data = dat_countries, 
                          mapping = aes(x = Date, y = Cum_conf_cases, fill = Country, colour = Country)) + 
                            geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5)
print(plot_ebola_point_v02)

#Line
plot_ebola_line_v02 <- ggplot(data = dat_countries, 
                        mapping = aes(x = Date, y = Cum_conf_cases)) +
                          geom_line(mapping = aes(group = Country, colour = Country), 
                          alpha = 0.7, linetype = "solid", linewidth = 1.5)
print(plot_ebola_line_v02)

#Column
plot_ebola_col_v02 <- ggplot(data = dat_countries, 
                        mapping = aes(x = Date, y = Cum_conf_cases, fill = Country, colour = Country)) +
                          geom_col(position = "stack", alpha = 0.7, 
                          linetype = "solid", linewidth = 0.5, width = 0.7)
print(plot_ebola_col_v02)


#Exercise 4E: labels and titles
#Point
plot_ebola_point_v03 <- ggplot(data = dat_countries, 
                          mapping = aes(x = Date, y = Cum_conf_cases, fill = Country, colour = Country)) + 
                            geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5) +
                              ggtitle(label = "Confirmed Ebola cases") +
                              xlab(label = "Time") +
                              ylab(label = "Cum. # of confirmed cases")
print(plot_ebola_point_v03)

#Excercise 4F: Changing Colors
plot_ebola_point_v04 <- ggplot(data = dat_countries, 
                          mapping = aes(x = Date, y = Cum_conf_cases, fill = Country, colour = Country)) + 
                          geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5) +
                            scale_fill_manual(name = "Country",
                              breaks = c("Liberia", "Sierra Leone", "Spain"),
                              values = c("red", "purple","navy"),
                              labels = c("Liberia", "Sierra Leone", "Spain")) +
                            scale_colour_manual(name = "Country",
                              breaks = c("Liberia", "Sierra Leone", "Spain"),
                              values = c("red", "purple", "navy"),
                              labels = c("Liberia", "Sierra Leone", "Spain")) +
                                  ggtitle(label = "Confirmed ebola cases") +
                                    xlab(label = "Time") +
                                    ylab(label = "Cum. # of confirmed cases")
print(plot_ebola_point_v04)

#Exercise 4G: changing scales
plot_ebola_point_v05 <- ggplot(data = dat_countries, 
                               mapping = aes(x = Date, y = Cum_conf_cases, fill = Country, colour = Country)) + 
  geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5) +
  scale_fill_manual(name = "Country",
                    breaks = c("Liberia", "Sierra Leone", "Spain"),
                    values = c("red", "purple","navy"),
                    labels = c("Liberia", "Sierra Leone", "Spain")) +
  scale_colour_manual(name = "Country",
                      breaks = c("Liberia", "Sierra Leone", "Spain"),
                      values = c("red", "purple", "navy"),
                      labels = c("Liberia", "Sierra Leone", "Spain")) +
  scale_x_date(breaks = as.Date(c("2014-08-29", "2014-10-01", "2014-12-01", "2015-02-01", 
                                  "2015-04-01")),
               labels = c("29 August", "1 October", "1 December", "1 February", "1 April"),
               limits = as.Date(c("2014-08-29", "2015-04-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 10000, by = 2000),
                     limits = c(0, 10000)) +
  ggtitle(label = "Confirmed ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases")
print(plot_ebola_point_v05)

#Exercise 4H - Change theme
plot_ebola_point_v06 <- ggplot(data = dat_countries, 
                               mapping = aes(x = Date, y = Cum_conf_cases, fill = Country, colour = Country)) + 
  geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5) +
  scale_fill_manual(name = "Country",
                    breaks = c("Liberia", "Sierra Leone", "Spain"),
                    values = c("red", "purple","navy"),
                    labels = c("Liberia", "Sierra Leone", "Spain")) +
  scale_colour_manual(name = "Country",
                      breaks = c("Liberia", "Sierra Leone", "Spain"),
                      values = c("red", "purple", "navy"),
                      labels = c("Liberia", "Sierra Leone", "Spain")) +
  scale_x_date(breaks = as.Date(c("2014-08-29", "2014-10-01", "2014-12-01", "2015-02-01", 
                                  "2015-04-01")),
               labels = c("29 August", "1 October", "1 December", "1 February", "1 April"),
               limits = as.Date(c("2014-08-29", "2015-04-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 10000, by = 2000),
                     limits = c(0, 10000)) +
  ggtitle(label = "Confirmed ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases") +
  theme_bw() + theme(legend.position="bottom")
print(plot_ebola_point_v06)

#Exercise 4I
plot_ebola_point_v06 <- ggplot(data = dat_countries, 
                               mapping = aes(x = Date, y = Cum_conf_cases, fill = Country, colour = Country)) + 
  geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5) +
  scale_fill_manual(name = "Country",
                    breaks = c("Liberia", "Sierra Leone", "Spain"),
                    values = c("red", "purple","navy"),
                    labels = c("Liberia", "Sierra Leone", "Spain")) +
  scale_colour_manual(name = "Country",
                      breaks = c("Liberia", "Sierra Leone", "Spain"),
                      values = c("red", "purple", "navy"),
                      labels = c("Liberia", "Sierra Leone", "Spain")) +
  scale_x_date(breaks = as.Date(c("2014-08-29", "2014-10-01", "2014-12-01", "2015-02-01", 
                                  "2015-04-01")),
               labels = c("29 August", "1 October", "1 December", "1 February", "1 April"),
               limits = as.Date(c("2014-08-29", "2015-04-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 10000, by = 2000),
                     limits = c(0, 10000)) +
  ggtitle(label = "Confirmed ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases") +
  theme_bw() + theme(legend.position="bottom") +
  facet_grid(cols = vars(Country))
print(plot_ebola_point_v06)

#Exercise 4J - grid
library(cowplot)
plot_ebola_line_grid <- plot_grid(plotlist = list(plot_ebola_point_v01, plot_ebola_point_v02, plot_ebola_point_v03, 
                                                  plot_ebola_point_v04, plot_ebola_point_v05, plot_ebola_point_v06),
                                  labels = c("V1", "V2", "V3", "V4", "V5", "V6"), label_size = 12, nrow = 2)
print(plot_ebola_line_grid)



