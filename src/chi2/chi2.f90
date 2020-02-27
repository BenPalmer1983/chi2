MODULE chi2

USE kinds

IMPLICIT NONE




INCLUDE "chi2.globals.f90"
INCLUDE "chi2.interfaces.f90"

CONTAINS

INCLUDE "chi2.run.f90"
INCLUDE "chi2.read_file.f90"
INCLUDE "chi2.calc.f90"
INCLUDE "chi2.p_calc.f90"
INCLUDE "chi2.output.f90"


END MODULE chi2