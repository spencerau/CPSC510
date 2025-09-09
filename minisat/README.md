# Example 1

## Input

```text
p cnf 2 2
1 2 0
-1 -2 0
```

### Explanation

`p cnf 2 2`

Problem in conjunctive normal form with 2 variables and 2 clauses.

Clauses (each clause is a disjunction (OR); clauses are combined with AND); delimited by 0 (same as \n newline)

`1 2 0`
Clause 1: (x1 OR x2)

`-1 -2 0`
Clause 2: (NOT x1 OR NOT x2)


## Output

```text
SAT
-1 2 0
```

### Explanation

`SAT` means the formula is satisfiable (there exists an assignment of each variable that makes each clause true)

`-1 2 0`
One such assignment is: x1 = false, x2 = true (the -1 means x1 is false, the 2 means x2 is true; 0 is just a delimiter)


# Example 2 (2x2 Sudoku)

A 2x2 Sudoku grid can be represented as:
<table>
  <tr><td>a</td><td>b</td></tr>
  <tr><td>c</td><td>d</td></tr>
</table>

Each cell can hold one of two values: 1 or 2.
That means you need 8 propositional variables total: 2 options per cell × 4 cells.

Variable Mapping:
- Cell a (row 1, col 1):
    - 1: “a = 1”
    - 2: “a = 2”
- Cell b (row 1, col 2):
    - 3: “b = 1”
    - 4: “b = 2”
- Cell c (row 2, col 1):
    - 5: “c = 1”
    - 6: “c = 2”
- Cell d (row 2, col 2):
    - 7: “d = 1”
    - 8: “d = 2”

## Input

```text
p cnf 8 16
c Each cell has exactly one value
1 2 0
-1 -2 0
3 4 0
-3 -4 0
5 6 0
-5 -6 0
7 8 0
-7 -8 0
c Each row contains both values
1 3 0
2 4 0
5 7 0
6 8 0
c Each column contains both values
1 5 0
2 6 0
3 7 0
4 8 0
```

### Explanation
`p cnf 8 16`
Problem in conjunctive normal form with 8 variables and 16 clauses.

#### lines are comments (ignored by the solver)

`1 2 0`   : at least one must be true<br>
`-1 -2 0` : not both at once<br>
`3 4 0`   : at least one must be true<br>
`-3 -4 0` : not both at once<br>
`5 6 0`   : at least one must be true<br>
`-5 -6 0` : not both at once<br>
`7 8 0`   : at least one must be true<br>
`-7 -8 0` : not both at once<br>

#### Each row contains both values

`1 3 0` : some cell in row 1 is "1"<br>
`2 4 0` : some cell in row 1 is "2"<br>
`5 7 0` : some cell in row 2 is "1"<br>
`6 8 0` : some cell in row 2 is "2"<br>

#### Each column contains both values

`1 5 0` : some cell in column 1 is "1"<br>
`2 6 0` : some cell in column 1 is "2"<br>
`3 7 0` : some cell in column 2 is "1"<br>
`4 8 0` : some cell in column 2 is "2"<br>

## Output

```text
SAT
1 -2 -3 4 -5 6 7 -8 0
```

### Explanation
`SAT` means the formula is satisfiable (there exists an assignment of each variable that makes each clause true)

`1 -2 -3 4 -5 6 7 -8 0`

One such assignment is:

<table>
  <tr>
    <td>
      <table>
        <tr><td>a</td><td>b</td></tr>
        <tr><td>c</td><td>d</td></tr>
      </table>
    </td>
    <td>=</td>
    <td>
      <table>
        <tr><td>1</td><td>2</td></tr>
        <tr><td>2</td><td>1</td></tr>
      </table>
    </td>
  </tr>
</table>

where:
- 1 and -2 refer to a
- -3 and 4 refer to b
- -5 and 6 refer to c
- 7 and -8 refer to d