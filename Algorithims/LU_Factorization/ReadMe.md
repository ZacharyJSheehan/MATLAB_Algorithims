# L U Factorization
the user begins by creating a Matrix [A].
if [A] is not a square matrix, the algorithim will display an error.
the built in algorithim begins through a while loop that will run until all columns of the matrix have been analyzed.
the algorithim is capable of pivoting, so it will begin by scanning each row, and determining what is the largest, absolute value in any row. 
the algorithim then proceeds with a gauss elimination procedure, and stores what ever factor each row was multiplied by, in order to create the L matrix.
once the U matrix is complete, the L matrix will be as well, and thus the P matrix can be computed.
there is one final error check, by comparing the L U matrix to the original. if they do not match, then LU decomposition is not possible, and an error is displayed.
