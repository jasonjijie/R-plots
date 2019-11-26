## 1. basic ggplots parts

attach(mtcars)
plot(wt,mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)





## 2. Color factors:
#col.axis: The color of axis
#col.main: The title color
#col.lab: The color of t

## 3. graphic character design
opar <- par(no.readonly = TRUE) 
par(lty=2, pch=17)
plot(dose, drugA, type='b')
par(opar)






##Symbol:
# pch: Shape of symbol
# cex: The size for the symbol. (0.5==zoom out 50% of default)
# lty: The type of the line
# lwd: The width of line (default value is 1.0, lwd=2 (Expand 2 times than before))
plot(dose,drugA,type="b", lty=3, pch=15, cex=2)

## Example: 
plot(dose, drugA,type="b", lty=3,lwd=3, pch =15, cex=2)



## 4. The rainbow color:
n <- 10
mycolors <- rainbow(n)
pie(rep(1,n), labels = mycolors, col=mycolors)


mygrays <- gray(0:n/n)
pie(rep(1,n), labels=mygrays,col=mygrays)





## 5. Text:
#cex.lab: 'The scaling axis label'
#cex axis: Scaling the font in the axis label
#cex.main: The scaling factor of the title
#cex.sub: The scaling factor of the subtitle
#font.lab: The axis or yaxis font style
#font.axis: The font sytle in the axis
par(font.lab=3, cex.lab=1.5, font.main=4, cex.main=2)





## 6. 
#pin():Width and long
#down+left+up+right
par(pin=c(4,3), mai=c(1,0.5,1,0.2))





## Practice:
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

# Use the new setting:
opar <- par(no.readonly = TRUE)
par(pin=c(2,3))
par(lwd=2, cex=1.5)
par(cex.axis=0.75, font.axis=3)
plot(dose,drugA,type = "b", pch=19, lty=2,col="red")

plot(dose,drugB,type= "b", pch=19, col="blue", bg="green")

#recovering the setting
par(opar)







## 1. Add text, custom axes and legends
#main: Title
#sub: Subtitle
#xlab:
#ylab:
#xlim: The range of xaxis
#ylim
plot(dose, drugA, type="b",col="red",lty=2, pch=2,lwd =2,
     main="Clinical Trials for DrugA",
     sub="This is hypothetical data",
     xlab="Dosage", ylab="Drug Response",
     xlim=c(0,60), ylim=c(0,70))





## 7. title()
title(main="main title", sub="sub-title", xlab="x-axis label", ylab ="y-axis label")

title(main="my Title", col.main="red", 
      sub="My Sub-title",col.sub="blue",
      xlab="My X label", ylab="My y label", 
      col.lab="green", cex.lab=0.75)





## 8. Reference line: 
abline(h=yvalues, v=xvalues)
abline(h=c(1,5,7))
abline(v=seq(1,10,2), lty=2, col="blue")





## 9. Legend(location,title,legend....)
#location: bottomleft,left,topleft,top,topright,right,center
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)
opar <- par(no.readonly = TRUE)
par(lwd=2, cex=1.5, font.lab=2)

plot(dose,lty=1,col="red", ylim=c(0,60),
     main="Drug A vs. Drug B", 
     xlab="Drug Dosage", ylab="Drug Response")
     
lines(dose,drugB, type="b", pch=17, lty=2, col="blue")
      

abline(h=c(30), lwd=1.5, lty=2, col="gray")



##Bcause there have two lines:
legend("topleft", inset = .05, title="Drug Type", c("A","B"),
       lty = c(1,2), pch=c(15,17), col=c("red", "blue"))



##or you can express the location of legend place by (x,y)
legend(x=4,y=7,c(name1,name2),.....)
par(opar)




###############################################################################
#                                                                             #
#                                                                             #
#                                                                             #
#                                                                             #
###############################################################################


#ggplot2 package
install.packages("ggplot2")
library(ggplot2)
qplot(x,y,data=, color=, shape=, size=, alpha=, geom=, method=, formula=, 
      facets=, xlim=, ylim=, xlab=, ylab=, main=, sub=)

#alpha: 0 means transparent and 1 means not transparent
#color: associated with the variable different levels, 'fill':associated with the boxplot
#facets: Specify a condition variable to create a fence map, Expression such as rowvar ~colvar
#geom: To define the graphic shape, include some 'points', 'smooth', 'boxplot', 'line', 'histogram', 'density', 'bar' and 'jitter'
#If you want to add some simple regression line, you need: geom='smooth', method="lm", formula=y~x
##please remember use the x and y in the expression formular rather than varoiable name!
#xlab and ylab: To labeling the x axis and y axis
#main/sub: Design the title and subtitle

#Example1: Box plots
mtcars$cylinder <- as.factor(mtcars$cyl)
qplot (cylinder, mpg, data=mtcars, geom=c("boxplot", "jitter"), fill=cylinder, 
       main = "Box plots with superimpose", xlab="Number of Cylinders", ylab="Miles per Gallon")




#Example2: Regression plots
library(ggplot2)
transmission  <- factor(mtcars$am, levels = c(0,1), 
                        labels = c("Automatic", "Manual"))

qplot(wt, mpg, data=mtcars, color=transmission, shape=transmission,
      geom=c("point", "smooth"),
      method="lm", formula=y~x,
      xlab="Weight",
      ylab="Miles Per Gallon",
      main="Regression Example")

#Example3: Facet plots 
mtcars$cyl <- factor(mtcars$cyl, levels = c(4,6,8), labels = c("4 cylinders", "6 cylinders", "8 cylinders"))
mtcars$am <- factor(mtcars$am, levels = c(0,1), 
                    labels = c("Automatic", "Manual"))

qplot(wt, mpg, data=mtcars, facets = am~cyl, size=hp)


#Example4: (lattice package)
install.packages("lattice")
library(ggplot2)
library(lattice)
data(singer, package = "lattice")
qplot(height, data=singer,geom=c("density"), 
      facets = voice.part~., fill=voice.part)

