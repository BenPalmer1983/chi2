#!/bin/bash
f95 -fopenmp -O3 -ffast-math \
-lgomp \
src/kinds/kinds.f90 \
src/chi2/chi2.f90 \
src/main/main.f90 \
-o chi2.x

