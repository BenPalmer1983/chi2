SUBROUTINE output()
!#############################################################
INTEGER(KIND=StandardInteger) :: row = 0
!#############################################################

!# OPEN FILE FIRST TIME TO COUNT LINES IN FILE
OPEN(UNIT=101,FILE="output.txt")
WRITE(101,*) "##########################################################"
WRITE(101,*) ""
WRITE(101,*) "DEGREES OF FREEDOM:", degrees_of_freedom
WRITE(101,*) ""
WRITE(101,*) "OBSERVED:"
WRITE(101,*) ""
DO row =1, rows
  WRITE(101,*) observed(row,:)
END DO
WRITE(101,*) ""
WRITE(101,*) "EXPECTED:"
WRITE(101,*) ""
DO row =1, rows
  WRITE(101,*) expected(row,:)
END DO
WRITE(101,*) ""

WRITE(101,*) "CHI SQUARED:       ", chi_squared
WRITE(101,*) "P(CHI SQUARED):    ", p_chi_squared
WRITE(101,*) ""


WRITE(101,*) "##########################################################"
CLOSE(101)



!#############################################################
END SUBROUTINE output