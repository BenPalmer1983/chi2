SUBROUTINE run(filename)
!#############################################################
CHARACTER(*), INTENT(IN) :: filename
!#############################################################

CALL read_file(filename)
CALL calc()
CALL p_calc()
CALL output()

!#############################################################
END SUBROUTINE run

