;;; Project Euler, problem 10

;;; O(N^1.36)?
;;; run time: 4 seconds
(defun problem-010 (&optional (n 2000000))
  (cond ((< n 2) 0)
	((= n 3) 1)
	(t (+ 2 (loop for i from 3 below n by 2 when (primep i) sum i)))))

#+sbcl
(sb-rt:deftest test-010
    (problem-010 10)
  17)