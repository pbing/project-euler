;;; Top Level file for Allegro Common Lisp

(defsystem :euler ()
  (:serial
   "split-sequence/split-sequence"
   (:parallel
    "math"
    "001"
    "002"
    "003"
    "004"
    "005"
    "006"
    "007"
    "008"
    "009"
    "010"
    "011"
    "012"
    "013"
    "014"
    "015"
    "016"
    "017"
    "018"
    "019"
    "020"
    "021"
    "022"
    "024"
    "025"
    "030"
    "034"
    "036"
    "041"
    "048"
    "056"
    "059"
    "067"
    "079"
    "097"
    "100"
    "108"
    "187"
    "204"
    "255")))

(load-system :euler :compile t)

(require :tester)
(use-package :util.test)

(with-tests (:name "ALL-TESTS")
  (test 23                  (problem-001 10))
  (test 4613732             (problem-002))
  (test 29                  (problem-003 13195))
  (test '(9009 91 99)       (problem-004 2) :multiple-values t)
  (test 2520                (problem-005 10))
  (test 2640                (problem-006 10))
  (test 13                  (problem-007 6))
  (test 40824               (problem-008))
  (test (* 3 4 5)           (multiple-value-bind (solutions triplets)
                                (problem-009 (+ 3 4 5))
                              (first solutions)))
  (test 17                  (problem-010 10))
  (test 70600674            (problem-011))
  (test 28                  (problem-012 5))
  (test 5537376230          (values (problem-013)))
  (test '(3 8)              (problem-014 4) :multiple-values t)
  (test 6                   (problem-015 2))
  (test 26                  (problem-016 15))
  (test 19                  (problem-017 5))
  (test 23                  (problem-018 #2A((3 0 0 0)
                                             (7 4 0 0)
                                             (2 4 6 0)
                                             (8 5 9 3))))
  (test 171                 (problem-019))
  (test 648                 (problem-020))
  (test 504                 (problem-021 300))
  (test 871198282           (problem-022))
  (test 120                 (problem-024 '(0 1 2) 4))
  (test 12                  (problem-025 3))
  (test (+ 1634 8208 9474)  (problem-030 4))
  (test 40730               (problem-034))
  (test 872187              (problem-036))
  (test 4231                (problem-041 4))
  (test 0405071317          (problem-048 10))
  (test 972                 (problem-056))
  (test 107359              (problem-059))
  (test 7273                (problem-067))
  (test 531278              (problem-079 '((3 1 7) (5 3 2) (1 7 8))))
  (test 8739992577          (problem-097))
  (test 4                   (problem-108 (1- 3)))
  (test 10                  (problem-187 30))
  (test 1105                (problem-204 (expt 10 8) 5))
  (test 3.210288888888889d0 (problem-255 5)))
