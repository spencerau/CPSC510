from z3 import *


# Creates two symbolic integer variables, x and y.
# They are not ordinary Python ints — they’re placeholders that Z3 will reason about.
# Conceptually: x and y are unknown integers that the solver can assign values to.
x, y = Ints('x y')

# A solver holds a set of constraints (logical formulas) and can check whether they can all be satisfied at the same time.
s = Solver()

# Adds constraints to the solver:
# 	1.	x >= 0 → x must be nonnegative.
# 	2.	y > x → y must be strictly greater than x.
# 	3.	x + y == 10 → the sum must equal 10.
# So the problem we’ve posed is:
# “Find integers x and y such that x ≥ 0, y > x, and x + y = 10.”
s.add(x >= 0, y > x, x + y == 10)

# Asks the solver whether this system of constraints is satisfiable.
# prints out sat if there exists at least one assignment to x and y that makes all constraints true
print(s.check())

# Retrieves a model: one concrete assignment of values for the unknowns that satisfies the constraints
print(s.model())