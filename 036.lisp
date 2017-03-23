;;; Project Euler, problem 36

;;; FIXME: PDF Artikel

;;; O(N)
;;; run time: 0.1 s
(defun problem-036 (&optional (n 1000000))
  (loop for i from 1 below n by 2 ; binary palindromes start and end with '1'
     when (and (palindromep i :base 10) (palindromep i :base 2))
     sum i))

#+sbcl
(sb-rt:deftest test-036
    (problem-036)
  872187)