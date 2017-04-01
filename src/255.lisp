;;; Project Euler, problem 255

;;; O(10^(N/2)))
;;; N   RESULT                TIME
;;; 5   3.210288888888889d0   0.000 seconds
;;; 6   3.3431844444444443d0  0.003 seconds
;;; 7   3.6100002222222223d0  0.009 seconds
;;; 8   3.7087867d0           0.028 seconds
;;; 9   3.876890238888889d0   0.098 seconds
;;; 10  3.9456584347777777d0  0.325 seconds
;;; 11  4.208493198777778d0   1.147 seconds
;;; 12  4.203828823848889d0   3.634 seconds
;;; 13  4.444678338509111d0   12.761 seconds   
;;; 14  4.447401118025322d0   40.535 seconds
(defun problem-255 (&optional (d 14))
  (let ((x0 (if (oddp d)
		(* 2 (expt 10 (/ (- d 1) 2)))
		(* 7 (expt 10 (/ (- d 2) 2)))))
	(n1 (expt 10 (1- d)))
	(n2 (expt 10 d))
	upper-bound)
    (/ (loop for iterations = 0
	  for n = n1 then (1+ upper-bound)
	  while (< n n2)
	  do (loop for xn-1 = 0 then xn
		for xn = x0 then (truncate (+ xn (ceiling n xn)) 2) ; iteration step
		and u = (1- n2) then (min (* xn (ceiling n xn)) u)  ; here is the magic
		until (= xn-1 xn)
		do (incf iterations)
		finally (setf upper-bound u))
	  summing (* iterations (1+ (- upper-bound n))))
       (float (- n2 n1) 0d0))))

;;; Naïve algorithm, O(10^N)
;;; N   RESULT                TIME
;;; 5   3.210288888888889d0   0.075 seconds
;;; 6   3.3431844444444443d0  0.744 seconds
;;; 7   3.6100007777777776d0  7.601 seconds
;;; ...
;;; 14  ???                   2.5 years (estimated)
#+(or)(defun problem-255 (&optional (n 14))
  (let ((n1 (expt 10 (1- n)))
	(n2 (expt 10 n)))
    (/ (loop for i from n1 below n2
	  sum (multiple-value-bind (result iterations) (heron i)
		(declare (ignore result))
		iterations))
       (float (- n2 n1) 0d0))))

#+(or)(defun heron (n)
  "Calculate rounded square root of N."
  (let* ((d (truncate (1+ (log n 10))))
	 (x0 (if (oddp d)
		 (* 2 (expt 10 (/ (- d 1) 2)))
		 (* 7 (expt 10 (/ (- d 2) 2))))))
    (loop for xn = (truncate (+ x0 (ceiling n x0)) 2)
       summing 1 into iterations
;       do (print (list x0 xn))
       until (= x0 xn)
       do (setf x0 xn)
       finally (return (values xn iterations)))))

#+(or)(defun test-heron (&optional (n 5))
  (loop for i from (expt 10 (1- n)) below (expt 10 n)
     for h = (heron i)
     for s = (round (sqrt (float i 0d0)))
     if (/= h s)
     collect (list i h s)))
