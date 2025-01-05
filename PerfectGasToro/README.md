The folder contains an implementation of the exact Riemann solver
for a perfect gas and borrowed from E. Toro "Riemann solvers
and Numerical Methods for Fluid Dynamics"

Input data (exact.ini) file format:
- line  1: The length of the region
- line  2: The position of the initial discontinuity
- line  3: The number of points (subintervals) in the region
- line  4: Cp/Cv
- line  5: The final time
- line  6: The value of the left state density
- line  7: The value of the left state velocity
- line  8: The value of the left state pressure
- line  9: The value of the right state density
- line 10: The value of the right state velocity
- line 11: The value of the right state pressure
- line 12: A normalizing constant (1.0)

Output data (exact.out) file format:
- column 1: the position of a cell center (the center of the region subinterval)
- column 2: the value of density in a cell
- column 3: the value of velocity in a cell
- column 4: the value of pressure in a cell
- column 5: the value of total energy in a cell

