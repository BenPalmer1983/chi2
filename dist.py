import random
import numpy as np
import time
import matplotlib.pyplot as plt


def poz(z):
  z_max = 6.0
  if(z == 0):
    x = 0
  else:    
    y = 0.5 * abs(z)
    if (y >= (z_max * 0.5)):
      x = 1.0;
    elif(y < 1.0):
      w = y * y;
      x = ((((((((0.000124818987 * w - 0.001075204047) * w + 0.005198775019) * w -
          0.019198292004) * w + 0.059054035642) * w - 0.151968751364) * w + 0.319152932694) * w -
          0.531923007300) * w + 0.797884560593) * y * 2.0
    else:
      y -= 2.0;
      x = (((((((((((((-0.000045255659 * y + 0.000152529290) * y - 0.000019538132) * y -
          0.000676904986) * y + 0.001390604284) * y - 0.000794620820) * y - 0.002034254874) * y +
          0.006549791214) * y - 0.010557625006) * y + 0.011630447319) * y - 0.009279453341) * y +
          0.005353579108) * y - 0.002141268741) * y + 0.000535310849) * y + 0.999936657524

  if(z > 0.0):
    return ((x + 1.0) * 0.5)
  return ((1.0 - x) * 0.5)


def ex(x):
  if(x < -20.0):
    return 0.0
  return np.exp(x)

def is_even(x):
  if(x%2 == 0):
    return True
  return False


def pochisq(x, df):
  #var a, y, s;
  #var e, c, z;
  #var even;
  #var LOG_SQRT_PI = 0.5723649429247000870717135;
  #var I_SQRT_PI = 0.5641895835477562869480795;

  LOG_SQRT_PI = 0.5723649429247000870717135
  I_SQRT_PI = 0.5641895835477562869480795

  if (x <= 0.0 or df < 1):
    return 1.0;
  
  a = 0.5 * x
  
  if (df > 1):
    y = ex(-a)
  even = is_even(df)

  if(even):
    s = y 
  else:
    s = (2.0 * poz(-np.sqrt(x)))
 
  if (df > 2):
    x = 0.5 * (df - 1.0)
    if(even):
      z = 1.0
    else:
      z = 0.5

    if (a > 20.0):
      if(even):
        e = 0.0 
      else:  
        e = LOG_SQRT_PI
      c = np.log(a)

      while (z <= x):
        e = np.log(z) + e
        s += ex(c * z - a - e)
        z += 1.0
      return s
    else:
      if(even):
        e = 1.0 
      else:  
        e = (I_SQRT_PI / np.sqrt(a))
      c = 0.0
      while (z <= x):
        e = e * (a / z)
        c = c + e
        z += 1.0      
      return c * y + s
  else:
    return s;


p = pochisq(13.277, 4)
print(p)
