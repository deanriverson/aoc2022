# Advent of Code 2022

This repo contains solutions for [Advent of Code 2022][1]. I'm
back to doing the solutions in Dart this year. I'll almost
certainly do only the first few days before losing interest.
In other words, until the problems become too hard for my puny
little brain.

Running the solutions with the dart interpreter:

```
$> dart run               # run the latest problem of the latest day
$> dart run aoc2022 -d 2  # run day 2 problems
$> dart run aoc2022 -a    # run all problems
```

You can also compile to an executable:

```
$> dart compile exe ./bin/aoc2022.dart -o aoc.exe  # For Windows
$> .\aoc.exe -d 2a  # run day 2, part a
$> .\aoc.exe -a     # run all problems
```

Here is the complete usage info for the executable.

```
Usage: aoc -d <puzzle_name>
-d, --day     Puzzle name to run (default is to run last puzzle completed):
                    1a = run the first puzzle for day 1
                    2  = run both puzzles for day 2
                    7b = run the second puzzle for day 7
-a, --all     Run all puzzle solutions
-h, --help    Displays this usage information
```
