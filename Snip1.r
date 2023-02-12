#This code snipet will produce a bar chart with overlaid data points.
#Requirements:
#1. A data set from which you pull the x- and y-axis values
#2. A summarized data set.
	#Do this by:
	
	#A. library(Rmisc)
	#B. fp_df_sum <- summarySE(fp_df, measurevar = "Protein", groupvars = "Canine")
	
	#These produce data that looks like this:
	
	#  Canine  N  Protein       sd        se       ci
#1  Dingo 31 829.5043 454.1877  81.57452 166.5974
#2    GSD 25 814.6905 520.1714 104.03427 214.7162
	
ggplot(fp_df_sum, aes(x=Canine, y=Protein, fill=Canine)) +												#Calls ggplot, indicates data set, sets x and y, colors the bars by 'Canine'
	geom_bar(position=position_dodge(), stat="identity", color="black", width=0.7) +					#bar graph, uses the designated data set as is, outlines the bars in black, sets bar width
	geom_errorbar(aes(ymin=Protein-se, ymax=Protein+se), width=.2, position=position_dodge(.9)) +		#error bars, sets the upper and lower limit, sets width
	geom_point(data= fp_df, aes(y = Protein, x = Canine)) +												#points overlaid, data set, x and y
	xlab("Canid") +																						#label for the x-axis
	ylab("Extracted protein (µl/ ml)") +																#label for the y-axis
	theme(legend.position = "none") +																	#gets rid of the legend... don't need one
	scale_fill_manual(values = c("#FF6600", "#00FFFF")) +												#sets color of the bars. hexadecimal color codes found at: http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
	theme(text = element_text(size = 24)) +																#Scales all text
	scale_y_continuous(expand = c(0, 0), limits = c(0, 2225))											#sets the y-axis to start at zero and sets its range.