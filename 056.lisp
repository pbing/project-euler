;;; Project Euler, problem 56

;;; O(N^2)
;;; run time: 0.3 sec
(defun problem-056 (&optional (n 100) (base 10))
  (flet ((sum-of-digits (n)
	   (loop for i = n then (truncate i base)
	      until (zerop i)
	      sum (rem i base))))
    (loop for a from 1 below n maximize
	 (loop for b from 1 below n maximize
	      (sum-of-digits (expt a b))))))

#+sbcl
(sb-rt:deftest test-056
    (problem-056)
  972)