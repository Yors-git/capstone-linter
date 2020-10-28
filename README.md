# JS Linter build with Ruby (OOP)

* The purpose of this project is to display mastery in all the topics learned in the Ruby module by making a linter of choice, in this case I worked on a Linter to check specific JavaScript files for common errors

# This linter checks for the following style rules:
- Semicolons at the end of each line when that line isn't opening or closing a block of code
- Space around operators, (+ - * / %) it takes in account when the file uses the same operator twice, like ++ or += or in arrow functions =>
- CamelCase, it checks that when declaring a variable the user starts with a lowercase letter
- Indentation, this one checks for two spaces of indentation once the user opens a curly brace and if inside that it finds another open curly brace then increments the indentation to 4 and so on, substracting two each time a curly brace closes
- Space after arguments checks that after each comma there is a space


# Instalation:
Copy the linter folder anywhere in your computer, it is recommended to copy it near the files you want to lint, and making sure that you have a ruby version instaled also either globally or in the directory you are going to put the linter.

# Instructions
Once you have the folder of the linter copied according to the previous parragraph, you have two options:
- To copy the files you want to check to the "to_check" folder inside the main folder, then run the linter with "ruby bin/main.rb"; the program will show you the complete current path you are in and you just need to specify the to chek folder.
- To specify the complete path of the folder where you have the files you want to check, after that the program will show you ONLY the .js files in that folder, then type the name of the file and it will run and tell you if you have errors or not

# Examples
Inside the folder "to_check" you'll find two files, one called testCorrect.js that shouln't return any errors and another one called testErrors.js with the same code only with two errors of each type just so you can see the difference, the errors are the following:

- Missing semicolon in line 3
- Missing semicolon in line 9
- Missing space before = sign in line 13 column 12
- Missing space after * sign in line 20 column 36
- Variables should not start with uppercase, check line 6
- Variables should not start with uppercase, check line 26
- Incorrect indentation, please check line 20
- Incorrect indentation, please check line 33
- Missing space after argument in line 23 column 20
- Missing space after argument in line 33 column 44

# Good code example:
```bash
let newVar =  0;
const generateRandomColors = (num) => {
  let arr = [];
  for(let i = 0; i < num; i ++ ){
    arr.push(randomColor());
  }
  return arr;
} 
```

# Bad code example:
```bash
let NewVar =  0
const generateRandomColors = (num) => {
 let arr = [];
  for(let i= 0; i < num; i ++ ){
    arr.push(randomColor());
  }
  return arr;
} 
```

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

