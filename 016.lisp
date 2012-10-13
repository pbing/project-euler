;;; Project Euler, problem 16

;;; O(?)
;;; run time: ~0 seconds
(defun problem-016 (&optional (n 1000))
  (labels ((sum (n)
	     (if (zerop n)
		 0
		 (+ (rem n 10) (sum (truncate n 10))))))
    (sum (expt 2 n))))

#+sbcl
(sb-rt:deftest test-016
    (problem-016 15)
  26)