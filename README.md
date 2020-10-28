# JS Linter build with Ruby (OOP)

* The purpose of this project is to display mastery in all the topics learned in the Ruby module by making a linter of choice, in this case I worked on a Linter to check specificly JavaScript files for common errors

# This linter checks for the following style rules:
- Semicolons at the end of each line when that line isn't opening or closing a block of code
- Space around operators, (+ - * / %) it takes in account when the file uses the same operator twice, like ++ or += or in arrow functions =>
- CamelCase, it checks that when declaring a variable the user starts with a lowecase letter
- Indentation, this one checks for two spaces of indentation once the user opens a curly brace and if inside that it finds another open curly brace then increments the indentation to 4 and so on, substracting two each time a curly brace closes
- Space after arguments chechs that after each comma there is a space


# Instalation:
Copy the linter folder anywhere in your computer, it is recommended to copy it near the files you want to lint, and making sure that you have a ruby version instaled also either globally or in the directory you are going to put the linter.

# Instructions
Once you have the folder of the linter copied according to the previous parragraph, you have two options:
- To copy the files you want to check to the "to_check" folder inside the main folder, then run the linter with "ruby main.rb"; the program will show you the complete current path you are in and you just need to specify the to chek folder.
- To specify the complete path of the folder where you have the files you want to check, after that the program will show you ONLY the .js files in that folder, then type the name of the file and it will run and tell you if you have errors or not

# Examples
Inside the folder "to_check" you'll find two files, one called testCorrect.js that shouln't return any errors and another one called testErrors.js with the same code only with two errors of each type just so you can see the difference

# Project Structure

```bash 
├── README.md
├── bin
│   └── main.rb
├── lib
│    └──style_rules.rb
├── to_check
│    ├── testCorrect.js
│    └── testErrors.js
```

# Prerequisites
-  Text editor
-  Github profile
-  Git and Ruby.

# Author

👤 **Jorge Torres**

- Github: [@Yors-git](https://github.com/Yors-git)

- Twitter: [@Yors_82](https://twitter.com/Yors_82)

- LinkedIn: [Jorge Torres](https://www.linkedin.com/in/jorge-torres-8b87571a8/)


## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- GitHub
- Theodinproject.com
- My Stand Up Team for the advices

