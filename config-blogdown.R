blogdown::new_site(theme = "CaiJimmy/hugo-theme-stack")
file.edit(".gitignore")
blogdown::new_post(title = "The importance of exploratory data analysis: Exploring the first B2VB challenge", 
                   ext = '.Rmarkdown', 
                   subdir = "post")
blogdown::serve_site()
