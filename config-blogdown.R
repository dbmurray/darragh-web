blogdown::new_site(theme = "CaiJimmy/hugo-theme-stack")
file.edit(".gitignore")
blogdown::new_post(title = "Hi Hugo", 
                   ext = '.Rmarkdown', 
                   subdir = "post")
