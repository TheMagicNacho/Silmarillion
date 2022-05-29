⠀⠀⠀⠀⠀⠀⢀⣀⣀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢰⡄⠀⠀⣠⣾⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⡇⠐⠾⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⡇⠀⢠⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠐⣿⣾⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⣠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢹⣿⣿⣿⣿⣿⣿⣿⣏⠀⠀⣄⠀⢻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀
⠀⢸⠈⠉⣿⣿⣿⣿⣿⣿⡄⠀⢸⣤⣼⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀
⠀⠸⡆⠀⣿⣿⣿⣿⣿⣿⣿⠀⠀⢏⠙⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀
⠀⠀⠇⢀⣿⣿⣿⣿⣿⣿⣿⣧⡀⠸⡀⣿⣿⣿⢆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⢣⠻⣟⠉⢻⣆⠀⠀⠀⠀⠀
⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣷⣿⣶⣾⣷⣶⣦⡀⠀⠀
⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦

░█▀▀░▀█▀░█░░░█▄█░█▀█░█▀▄░▀█▀░█░░░█░░░▀█▀░█▀█░█▀█
░▀▀█░░█░░█░░░█░█░█▀█░█▀▄░░█░░█░░░█░░░░█░░█░█░█░█
░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀

# Silmarillion
Game story engine for creating and managing text based adventures.

[![Go Report Card](https://goreportcard.com/badge/github.com/theMagicnacho/silmarillion)](https://goreportcard.com/report/github.com/theMagicnacho/silmarillion)


# GitIgnore
We are .gitignore-ing the following files/directories:
    - /bin
        - This is where the game executable is located. You can compile it yourself using the make server-build command.
    - .env
        - This is where the environment variables are stored.
        - You will need to write your own version of this file and it MUST look like this:
        ```
        SERVER_PORT=8000
        
        ```
