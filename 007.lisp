;;; Project Euler, problem 7

;;; O(?)
;;; run time: ~0 second
(defun problem-007 (&optional (n 10001))
  (cond ((= n 0) nil)
	((= n 1) 2)
	(t   (loop with j = 1
		for num from 3 by 2
		do (if (primep num) (incf j))
		until (= j n)
		finally (return num)))))

#+sbcl
(sb-rt:deftest test-007
    (problem-007 6)
  13)
 