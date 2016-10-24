# Othello
Othello board game developed in Ruby.

The current master branch contains the game in its most basic form and can be played
by two players on any platform that supports Ruby using a shell. 

The idea is to use Gosu (https://www.libgosu.org/) as its frontend in the future as well
as implementing MiniMax with alpha-beta prunning so one person can play against the program.

In your local repo issue "ruby main.rb" to start the game.

If you issue "rdoc" inside your local repo, it will generate a "doc" directory with all
the generated documentation by RDoc browsable through "index.html".

The folder "test" contains the unit tests of the classes. Once inside it, you can issue
"ruby" plus the name of the file and will run MiniTest for that class.
