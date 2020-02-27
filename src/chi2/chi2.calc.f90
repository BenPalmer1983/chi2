SUBROUTINE calc()
!#############################################################
INTEGER(KIND=StandardInteger) :: n = 0
INTEGER(KIND=StandardInteger) :: row = 0
INTEGER(KIND=StandardInteger) :: col = 0
!#############################################################

!# DEGREES OF FREEDOM
degrees_of_freedom = (rows - 1) * (cols - 1)

!# CALCULATE SUMS
DO row = 1, rows
  row_sums(row) = SUM(observed(row,:))
END DO

DO col = 1, cols
  col_sums(col) = SUM(observed(:,col))
END DO

total = SUM(observed(:,:))

!# EXPECTED VALUES
DO row = 1, rows
  DO col = 1, cols
    expected(row, col) = (row_sums(row) * col_sums(col)) / total
  END DO
END DO

! CALCULATE CHI SQUARED
DO row = 1, rows
  DO col = 1, cols
    n = n + 1
    o_e(n) = abs(observed(row, col) - expected(row, col))
    
    !# CALCULATE CHI SQUARED
    chi_squared = chi_squared + (o_e(n) * o_e(n)) / expected(row, col)
  END DO
END DO


END SUBROUTINE calc