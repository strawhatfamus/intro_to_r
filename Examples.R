library(data.table)
install.packages("data.table")
library(dplyr)

suicides <- read("ggplot/suicides.rdata")

#plain
bare <- ggplot(suicides)

#adding plot aesthetic
aesthetic <- ggplot(suicides, aes(x=year, y=deaths))

#adding points
scatter <- ggplot(suicides,aes(x=year, y=deaths)) + 
  geom_point()

#split "means" by color
color_by_means <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
  geom_point()

#facet by state
state_fact <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
  geom_point +
  facet_wrap(~state, scales="free") #because different state has different populations, this way the scale of the data is rearranged

#facet by state line 
state_fact <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
  geom_line(size=3) +  #argumen inside changes the layout 
  facet_wrap(~state, scales="free")

#barplot
state_fact <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
  geom_bar(aes(fill=means), state="identity") + #state="identity" provides a non-histogram bar graph. 
  face_wrap(~state, scales="free")