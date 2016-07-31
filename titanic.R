# Load the cleaned data into dataframe titanic. 
titanic <- read.csv("titanic_clean.csv", header = TRUE, sep = ",")
str(titanic)

# The last passanger had missing information in all fields, except for the age variable, therefore was excluded from the dataset. 
tail(titanic)
titanic <- titanic[-1310,]

# Use ggplot() to plot the distribution of sexes within the classes of the ship. 
require(ggplot2)
ggplot(titanic,aes(x=factor(pclass),fill=factor(sex)))+
  geom_bar(position="dodge")

# Use ggplot() to estimate your chances of survival from the distribution of sexes within the classes of the ship. 
ggplot(titanic,aes(x=factor(pclass),fill=factor(sex)))+
  geom_bar(position="dodge")+
  facet_grid(". ~ survived")

# Position jitter (use below)
posn.j <- position_jitter(0.5, 0)

# Use ggplot() to estimate your chances of survival based on your age from the distribution of sexes within the classes of the ship. 
ggplot(titanic,aes(x=factor(pclass),y=age,col=factor(sex)))+
  geom_jitter(size=3,alpha=0.5,position=posn.j)+
  facet_grid(". ~ survived")
