;;; Project Euler, problem 30

;;; O(2^N)
;;; run time: 0.2 s
(defun problem-030 (&optional (n 5))
  (flet ((upper-bound (p)
	   "Return the upper bound of the number with digits of power to P."
	   (loop for i from 1
	      for ub = (* i (expt 9 p))
	      until (> (expt 10 i) ub)
	      finally (return ub)))
	 (sum-of-digit-powers (n p)
	   "Return the sum of powers P of the digits of the number N."
	   (loop for i = n then (truncate i 10)
	      while (not (zerop i)) sum (expt (rem i 10) p))))
    (loop for i from 2 to (upper-bound n)
       when (= i (sum-of-digit-powers i n)) sum i)))

#+sbcl
(sb-rt:deftest test-030
    (problem-030 4)
  #.(+ 1634 8208 9474))