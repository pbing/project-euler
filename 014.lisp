;;; Project Euler, problem 14

;;; O(N)
;;; run time: 3 sec
(defun problem-014 (&optional (n 1000000))
  (flet ((collatz (i)
	   "Count the terms of the Collatz sequence starting with N."
	   (loop for n = i then (if (evenp n) (truncate n 2) (1+ (* 3 n)))
	      summing 1
	      until (= n 1))))
    (let (result
	  (max 0))
      (loop for i from 1 below n
	 for j = (collatz i) do
	   (if (> j max)
	       (setf result i  max j)))
      (values result max))))

#+sbcl
(sb-rt:deftest test-014
    (problem-014 4)
  3 8)
