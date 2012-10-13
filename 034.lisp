;;; Project Euler, problem 34

;;; O(?)
;;; run time: ~1.3 sec
(defun problem-034 ()
  ;; cache factorials of digits 0-9
  (let ((factorials (make-array 10 :initial-contents (loop for i from 0 to 9 collect (factorial i)))))
    (flet ((upper-bound ()
	     "Return the upper bound."
	     (loop for i from 1
		for ub = (* i (factorial 9))
		until (> (expt 10 i) ub)
		finally (return ub)))

	   (sum-of-digit-factorials (n)
	     "Return the sum of factorials of the digits of the number N."  
	     (loop for i = n then (truncate i 10)
		while (not (zerop i)) sum (aref factorials (rem i 10)))))

      (loop for i from 10 to (upper-bound) ; exclude single digits, because they are not sums
	 when (= i (sum-of-digit-factorials i)) sum i))))

#+sbcl
(sb-rt:deftest test-034
    (problem-034)
  40730)
