;;;; Tests for SB-RT

(use-package :sb-rt)

(deftest test-001
    (problem-001 10)
  23)

(deftest test-002
    (problem-002)
  4613732)

(deftest test-003
    (problem-003 13195)
  29)

(deftest test-004
    (problem-004 2)
  9009 91 99)

(deftest test-005
    (problem-005 10)
  2520)

(deftest test-006
    (problem-006 10)
  2640)

(deftest test-007
    (problem-007 6)
  13)
 
(deftest test-008
    (problem-008)
  40824)
 
(deftest test-009
    (multiple-value-bind (solutions triplets)
	(problem-009 (+ 3 4 5))
      (first solutions))
  #.(* 3 4 5))

(deftest test-010
    (problem-010 10)
  17)

(deftest test-011
    (problem-011)
  70600674)

(deftest test-012
    (problem-012 5)
  28)

(deftest test-013
    (values (problem-013))
  5537376230)

(deftest test-014
    (problem-014 4)
  3 8)

(deftest test-015
    (problem-015 2)
  6)

(deftest test-016
    (problem-016 15)
  26)

(deftest test-017
    (problem-017 5)
  19)

(deftest test-018
    (problem-018 #2A((3 0 0 0)
		     (7 4 0 0)
		     (2 4 6 0)
		     (8 5 9 3)))
  23)

(deftest test-019
    (problem-019)
  171)

(deftest test-020
    (problem-020)
  648)

(deftest test-021
    (problem-021 300)
  504)

(deftest test-022
    (problem-022)
  871198282)

(deftest test-024
    (problem-024 '(0 1 2) 4)
  120)

(deftest test-025
    (problem-025 3)
  12)

(deftest test-027
    (problem-027)
  -59231)

(deftest test-030
    (problem-030 4)
  #.(+ 1634 8208 9474))

(deftest test-031
    (problem-031)
  73682)

(deftest test-034
    (problem-034)
  40730)

(deftest test-035
    (problem-035 100)
  13)

(deftest test-036
    (problem-036)
  872187)

(deftest test-041
    (problem-041 4)
  4231)

(deftest test-048
    (problem-048 10)
  0405071317)

(deftest test-056
    (problem-056)
  972)

(deftest test-059
    (problem-059)
  107359)

(deftest test-067
    (problem-067)
  7273)

(deftest test-079
    (problem-079 '((3 1 7) (5 3 2) (1 7 8)))
  531278)

(deftest test-092
    (problem-092 1000)
  857)

(deftest test-097
    (problem-097)
  8739992577)

(deftest test-100
    (problem-100 20)
  15 6)

(deftest test-108
    (problem-108 (1- 3))
  4)

(deftest test-187
    (problem-187 30)
  10)

(deftest test-204
    (problem-204 (expt 10 8) 5)
  1105)

(deftest test-255
    (problem-255 5)
  3.210288888888889d0)
