A small program (and python module) to calculate chi2 and p(chi2)


USES FUNCTION FROM:
https://www.mathsisfun.com/data/images/chi-square.js



How to compile
====================

From the chi2 directory

gfortran -O3 -ffast-math src/kinds/kinds.f90 src/chi2/chi2.f90 src/main/main.f90 -o chi2.x


How to run
====================

Create an input file
The first line must contain the number of rows and colums (integers, separated by a space)
The matrix of observed values is then written one row per line, each value separated by a space
No blank lines

Example of a 2 row 6 column matrix:

2 6
48 36 29 31 15 4
19 35 33 11 21 28

Run the program:

chi2.x matrix.txt

(where chi2.x is the executable and matrix is the text file containing the matrix data)

The results will be written to a file called output.txt


Python3 and F2PY
====================

There is also the option to compile the program using f2py and import it as a module to Python3.  Only use if familiar with f2py and Python3.
