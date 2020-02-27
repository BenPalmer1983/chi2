!# USES FUNCTION FROM 
!# https://www.mathsisfun.com/data/images/chi-square.js



SUBROUTINE p_calc()
!#############################################################
REAL(kind=DoubleReal) ::              x = 0.0D0
INTEGER(KIND=StandardInteger) ::      df = 0
REAL(kind=DoubleReal) ::              a = 0.0D0
REAL(kind=DoubleReal) ::              y = 0.0D0
REAL(kind=DoubleReal) ::              s = 0.0D0
REAL(kind=DoubleReal) ::              e = 0.0D0
REAL(kind=DoubleReal) ::              c = 0.0D0
REAL(kind=DoubleReal) ::              z = 0.0D0
LOGICAL ::                            even
!#############################################################
! GLOBALS:
! log_sqrt_pi
! i_sqrt_pi
! degrees_of_freedom
! chi_squared
! big_x

x = chi_squared
df = degrees_of_freedom

IF(x .LE. 0.0D0 .OR. df .LT. 1)THEN
  p_chi_squared = 1.0D0
ELSE
  a = 0.5D0 * x
    
  IF(df .GT. 1)THEN
    y = ex(-a)
  END IF
  
  even = is_even(df)

  IF(even)THEN
    s = y 
  ELSE
    s = (2.0D0 * poz(-SQRT(x)))
  END IF

  IF (df .GT. 2) THEN
    x = 0.5D0 * (df - 1.0D0)
    IF (even) THEN
      z = 1.0D0
    ELSE
      z = 0.5D0
    END IF

    IF (a .GT. 20.0D0) THEN
      IF(even) THEN
        e = 0.0D0 
      ELSE  
        e = log_sqrt_pi
      END IF
      c = LOG(a)

      DO WHILE (z .LE. x)
        e = LOG(z) + e
        s = s + ex(c * z - a - e)
        z = z + 1.0D0
      END DO
      p_chi_squared =  s
    ELSE
      IF(even)THEN
        e = 1.0D0 
      ELSE 
        e = (i_sqrt_pi / SQRT(a))
      END IF
      c = 0.0D0
      DO WHILE (z <= x)
        e = e * (a / z)
        c = c + e
        z = z + 1.0D0 
      END DO
      p_chi_squared = c * y + s
    END IF
  ELSE
    p_chi_squared = s
  END IF
END IF

END SUBROUTINE p_calc


FUNCTION poz(z) RESULT (r)
!#############################################################
REAL(kind=DoubleReal) :: z
REAL(kind=DoubleReal) :: r
!#############################################################
REAL(kind=DoubleReal) :: z_max = 6.0D0
REAL(kind=DoubleReal) :: x = 0.0D0
REAL(kind=DoubleReal) :: w = 0.0D0
REAL(kind=DoubleReal) :: y = 0.0D0
!#############################################################
z_max = 6.0D0
IF(z .EQ. 0.0D0)THEN
  x = 0.0D0
ELSE  
  y = 0.5D0 * ABS(z)
  IF (y .GE. (z_max * 0.5D0)) THEN
      x = 1.0D0
  ELSE IF (y .LT. 1.0D0) THEN
    w = y * y
    x = ((((((((0.000124818987D0 * w - 0.001075204047D0) * w + 0.005198775019D0) * w - &
        0.019198292004D0) * w + 0.059054035642D0) * w - 0.151968751364D0) * w + 0.319152932694D0) * w - &
        0.531923007300D0) * w + 0.797884560593D0) * y * 2.0D0
  ELSE
    y = y - 2.0D0
    x = (((((((((((((-0.000045255659D0 * y + 0.000152529290D0) * y - 0.000019538132D0) * y - &
        0.000676904986D0) * y + 0.001390604284D0) * y - 0.000794620820D0) * y - 0.002034254874D0) * y + &
        0.006549791214D0) * y - 0.010557625006D0) * y + 0.011630447319D0) * y - 0.009279453341D0) * y + &
        0.005353579108D0) * y - 0.002141268741D0) * y + 0.000535310849D0) * y + 0.999936657524D0
  END IF
  IF (z .GT. 0.0D0) THEN
    r = ((x + 1.0D0) * 0.5D0)
  ELSE
    r = ((1.0D0 - x) * 0.5D0)
  END IF
END IF
END FUNCTION poz  
    
  
  
  
FUNCTION ex(x) RESULT (y)
!#############################################################
REAL(kind=DoubleReal) :: x
REAL(kind=DoubleReal) :: y
!#############################################################
IF (x .LT. -big_x) THEN  
  y = 0.0D0
ELSE
  y = EXP(x)
END IF
END FUNCTION ex




FUNCTION is_even(n) RESULT (is_x_even)
!#############################################################
INTEGER(KIND=StandardInteger) :: n
LOGICAL :: is_x_even
!#############################################################
is_x_even = .FALSE.
IF(MOD(n,2) .EQ. 0)THEN
  is_x_even = .TRUE.
END IF
END FUNCTION is_even
  
  
  
  