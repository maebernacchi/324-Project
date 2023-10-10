# 324-Project
324 Individual project
## To access my project:
Upload the app.R, all_states.xlsx, and minty.css file into RStudio, then run the code!
# What is the Project purpose?
To show any discrepancies between the amount of money spent on students as time goes on, and to see how that affects the standardized test scores of 4th and 8th graders

# Data description + How was the data collected?
The data was collected from Kaggle at: https://www.kaggle.com/datasets/noriuk/us-education-datasets-unification-project
The data is almost completely quantitative, as we're working with years, averages, and monetary amounts, but there are two variables that are qualitative. THose variables would be the PRIMARY_KEY and the STATE.

PRIMARY_KEY: Includes year and state<br>
YEAR: The year the data was collected<br>
TOTAL_REVENUE: Total revenue for a state from all possible sources<br>
STATE_REVENUE: Total recenue made from within the state<br>
TOTAL_EXPENDITURE: How much was spent in total by the state<br>
INSTRUCTION_EXPENDITURE: How much was spent by the state on education instruction<br>
GRADES_4_G: Amount of students in 4th grade<br>
GRADES_8_G: Amount of students in 8th grade<br>
EXPEND_PER_STUDENT: How much money (in dollars) was spent by the state per student<br>
AVG_MATH_4_SCORE: Average score of a 4th grader on the math test out of 500<br>
AVG_MATH_8_SCORE: Average score of an 8th grader on the math test out of 500<br>
AVG_READING_4_SCORE: Average score of a 4th grader on the reading test out of 500<br>
AVG_READING_8_SCORE: Average score of an 8th grader on the reading test out of 500<br>

# Who are the users that this Shiny App was made for?
People who are interested in how public funds are being spent when it comes to early education

# What questions are you trying to answer?
What is the affect that spending per student has on the quality of education and are there any location-based discrepancies that can be seen in the data?

# What insights did you get from your data?
There is a significant upward trend between average scores and spending per student. This can be seen more in the West and Southeast, and less in the Midwest, Northeast, and Southwest. 

# What needs improvement? (Wish list)
A less in-your-face way to represent the data and a way to include users in the experience.



# Basic documentation:
This code was written in R and Shiny using the following libraries: 
shiny, magrittr, readxl, wordcloud, shinythemes, ggplot2, gridExtra, and bslib

# Describing the process and development to make your work reproducible.
A lot of cleaning was required of the data, which makes it not close to the original source data, which is why I am posting the data alongside my app and source code, as it will allow for the easier recreation of this work. The graphs are also all very similar with clear axis, but I do plan to further flesh out this project on my own time.

# Description of design decisions (encoding/mapping).
What: All of the data being represented is in the form of a scatterplot. 

How: Using similar axis, as well as recreating the same graph layout, added the ability of the user to see an upward trend in almost every graph.
Why: The scatterplot was the easiest way to represent the data without having to get into the scope of a three dimensional graph.
