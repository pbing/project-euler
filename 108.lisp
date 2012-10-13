;;; Project Euler, problem 108
;;;
;;; http://www.matheboard.de/archive/369514/thread.html
;;; http://de.wikipedia.org/wiki/Teileranzahlfunktion	     

;;; O(?)
;;; run time: 1 minute
(defun problem-108 (&optional (x 1000))
  (loop for n from 0
     for d = (ceiling (divisor-count (* n n)) 2)
     until (> d x)
     finally (return n)))

#+sbcl
(sb-rt:deftest test-108
    (problem-108 (1- 3))
  4)