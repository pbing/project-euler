;;; Project Euler, problem 4

;;; O(2^N)
;;; run time: 0.02 seconds
(defun problem-004 (&optional (digits 3))
  (let ((start (expt 10 (1- digits)))
	(limit (1- (expt 10 digits)))
	fac1 fac2)
    (loop with max = 0
       for i from limit downto start do
	 (loop for j from limit downto start
	    for product = (* i j)
	    when (and (> product max) (palindromep product))
	    do (setf max product fac1 j fac2 i))
       finally (return (values max fac1 fac2)))))
