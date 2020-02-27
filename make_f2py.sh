#!/bin/bash

python3 -m numpy.f2py --quiet --f90flags="-fopenmp -O3 -ffast-math" \
-lgomp \
-c \
src/kinds/kinds.f90 \
src/chi2/chi2.f90 \
-m f_chi2


# Test
python3 chi2test.py
