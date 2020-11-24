A new way of thinking about graphics
What is ggplot
ggplot2 is a system for declaratively creating graphics, based on The Grammar of Graphics.

You provide the data, tell ggplot2 how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details.

Installation
It is in cran, so it is easy:
  
  ### Install ggplot2 package --------------------
install.packages("ggplot2", dependencies = TRUE)
Remember than in your script the install.packages() command should allways be commented and at the beginning of the script.

### Packages
# install.packages("ggplot2", dependencies = TRUE)

library(ggplot2)
Cheatsheet
There is an official cheatsheet here: https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf

Cheatsheet

Usage
All ggplot2 plots begin with a call to ggplot(), supplying default data and aesthethic mappings, specified by aes(). You then add layers, scales, coords and facets with +. To save a plot to disk, use ggsave().

For plotting a ggplot2 plot it is necessary to have the data into a dataframe in long format.

Producing a plot with ggplot2, we must give three things:
  
  A data frame containing our data.
How the columns of the data frame can be translated into positions, colors, sizes, and shapes of graphical elements (“aesthetics”).
The actual graphical elements to display (“geometric objects”).
Let’s make our first ggplot.

### Plot relationship between sepal length and width ----------
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()


The call to ggplot() and aes() sets up the basics of the data and variables forthe data frame.

aes() defines the “aesthetics”, which is how columns of the data frame map to graphical attributes such as x and y position, color, size, etc. Arguments to aes() may refer to columns of the data frame directly.

We then literally add layers of graphics (“geoms”) to this.

Further aesthetics can be used. Any aesthetic can be either numeric or categorical, an appropriate scale will be used.

### Plot relationship between sepal length and width
### related to Species and Petal.Length -----------------------
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, 
                 color = Species, size = Petal.Length)) +
  geom_point()


We can also use different geometries.

### Plot relationship between sepal length and width
### related to Species ----------------------------
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, 
                 color = Species)) +
  geom_smooth() +
  geom_point()
## `geom_smooth()` using method = 'loess' and formula 'y ~ x'


### boxplot of sepal width for each species ----------------------
g <- ggplot(iris, aes(x = Species, y = Sepal.Width, 
                      fill = Species))

g + geom_boxplot()


g + geom_boxplot() +
  geom_jitter()


Other layers of information
Different layers of information in ggplot
Different layers of information in ggplot

Besides data, aesthetics and geometries you can add different layers of information. For example, the previous plot can be draw with a different theme.

### boxplot of sepal width for each species --------------------
g +
  geom_boxplot() +
  geom_jitter() +
  theme_bw()


To save your plots
To save a particular plot from a R script you can use the command ggsave().

But for a RMarkdown document it is better if in the first setup R chunk you include a fig.path parameter with the direction where to save all the plots from the document.

knitr::opts_chunk$set(fig.path  = 'results/Fig_')
More features
The best way to see more features is to look for them in google when needed. Some interesting ones might be:
  
  The ggplot2 reference web, with all the posibilities. Please, click on the different posibilities to get to the help page with examples. https://ggplot2.tidyverse.org/reference/
  
  The R Graph Gallery is a very complete gallery of basic graphs. Each one of them is explained and with code examples. https://www.r-graph-gallery.com/
  
  Statistical tools for high-throughput data analysis (STHDA). A web with good introduccions to different graph types in R. http://www.sthda.com/english/wiki/data-visualization

Other packages for particular plots. http://www.ggplot2-exts.org/gallery/
  
  The book “R for Data Science” chapters for:
  data visualization. https://r4ds.had.co.nz/data-visualisation.html
graphics for comunication. https://r4ds.had.co.nz/graphics-for-communication.html
The web “From Data to Viz” https://www.data-to-viz.com/ is a very good place to find the right graph for each type of data. Do not miss the Story link for each data type. It has also a collection of caveats to have in mind to avoid the most common mistakes when choosing the right graph for representign your data https://www.data-to-viz.com/caveats.html.

References
https://ggplot2.tidyverse.org/
  https://ggplot2.tidyverse.org/reference/
  http://bloggotype.blogspot.com/2016/08/holiday-notes2-grammar-of-graphics.html
https://monashdatafluency.github.io/r-intro-2/plotting-with-ggplot2.html
Exercises
In a new Rmarkdown document, copy and answer the following questions:
  
  create a ggplot with the trees data using
Girth as x
Height as y
Volume as size and color
Try different geometries
geom_point()
geom_line()
geom_smooth()
geom_smooth(method = "lm")
Other geometries from https://ggplot2.tidyverse.org/reference/
  ¿Which is the best combination to represent the data?

Look at the R Graph Gallery https://www.r-graph-gallery.com/ and choose a fancy plot you like. Copy paste the code from the example and do some modifications. Change the data, the theme or any other part of it.
