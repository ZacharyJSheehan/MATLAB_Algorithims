# Special Matrix
this algorithim takes a value n, and m, and creates a matrix [A] of size n x m.
the value of each element in the first row of matrix [A] is the number of the column
the value of each element in the first column is the number of the row
the rest of the elemnts each has a vale equal to the sum of the element above it and the element to the left
the program begins by checking that there is two, and only two inputs.
then, an array of size n,m is created, with all zeros.
the first row and column are then filled with the specified criteria.
then, for each row, the algorithim computes the desired value, by going from one column, filling each row, then to the next column.
