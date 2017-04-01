;;; Project Euler, problem 9
;;;
;;; a^2 + b^2 = c^2
;;; a = m^2-n^2
;;; b = 2mn
;;; c = m^2+n^2
;;; m>n

;;; O(N)
(defun problem-009 (&optional (x 1000))
  (let (result)
    (loop for n from 1 below (truncate (sqrt (/ x 2))) do ; because when n=m and b=x: x=2n^2
	 (loop for m from (1+ n)
	    for l = (* 2 m (+ m n))
	    do (cond ((> l x) (return))
		     ((= l x) (push (list (- (* m m) (* n n))
					  (* 2 m n)
					  (+ (* m m) (* n n)))
				    result)))))
    (values (mapcar (lambda (x) (reduce #'* x)) result)	 ; all solutions a*b*c
	    (mapcar (lambda (x) (sort x #'<)) result)))) ; all triplets (a b c)
