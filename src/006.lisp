;;; Project Euler, problem 6


;;; sum-of-squares: n*(n+1)*(2n+1)/6
;;;
;;; sum: n*(n+1)/2
;;; square of sum: n^2

;;; O(1)
;;; run time: ~0 seconds
(defun problem-006 (&optional (n 100))
  (let ((sum-of-squares (/ (* n (1+ n) (1+ (* 2 n))) 6))
	(square-of-sum  (expt (/ (* n (1+ n)) 2) 2)))
    (- square-of-sum sum-of-squares)))
