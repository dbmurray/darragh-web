blogdown::new_site(theme = "CaiJimmy/hugo-theme-stack")
file.edit(".gitignore")
blogdown::new_post(title = "A Reminder on the Importance of Exploratory Data Analysis: My First B2VB Entry", 
                   ext = '.Rmarkdown', 
                   subdir = "post")
blogdown::serve_site()
