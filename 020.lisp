;;; Project Euler, problem 20

;;; O(?)
;;; run time: ~0 seconds
(defun problem-020 (&optional (n 100))
  (labels ((sum (n)
	     (if (zerop n)
		 0
		 (+ (rem n 10) (sum (truncate n 10))))))
    (sum (factorial n))))

#+sbcl
(sb-rt:deftest test-020
    (problem-020)
  648)