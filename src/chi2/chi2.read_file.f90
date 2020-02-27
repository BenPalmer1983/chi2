SUBROUTINE read_file(filename)
!#############################################################
CHARACTER(*), INTENT(IN) :: filename
!#############################################################
CHARACTER(LEN=1) :: row
INTEGER(KIND=StandardInteger) :: row_count
INTEGER(KIND=StandardInteger) :: ios
INTEGER(KIND=StandardInteger) :: n
!#############################################################

!# OPEN FILE FIRST TIME TO COUNT LINES IN FILE
row_count = 0
OPEN(UNIT=101,FILE=filename,status='old',action='read')
DO n=1, 1000000
  READ(101,"(A1)",IOSTAT=ios) row
  IF(ios /= 0)THEN
    EXIT
  END IF
  row_count = row_count + 1
END DO
CLOSE(101)

!# OPEN FILE SECOND TIME TO READ DATA
OPEN(UNIT=101,FILE=filename,status='old',action='read')
DO n=1, row_count
  IF(n .EQ. 1)THEN
    !# READ ROW AND COLUMN COUNT THEN ALLOCATE ARRAYS
    READ(101,*,IOSTAT=ios) rows, cols
    ALLOCATE(observed(1:rows, 1:cols))
    ALLOCATE(expected(1:rows, 1:cols))
    ALLOCATE(row_sums(1:rows))
    ALLOCATE(col_sums(1:cols))
    ALLOCATE(o_e(1:(rows * cols)))
  ELSE
    READ(101,*,IOSTAT=ios) observed(n-1,:)    
  END IF
END DO
CLOSE(101)

!#############################################################
END SUBROUTINE read_file

