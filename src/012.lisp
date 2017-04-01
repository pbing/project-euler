;;; Project Euler, problem 12

;;; O(?)
;;; run time: ~0.1 sec
(defun problem-012 (&optional (n 500))
  (flet ((triangle (n)
	   (* 1/2 n (1+ n))))

    (loop for i from 1
       for j = (triangle i) do
       (if (> (divisor-count j) n)
	   (return j)))))
