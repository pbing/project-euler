;;; Project Euler, problem 41

;;; Could be improved:
;;;
;;; N=1               not prime
;;; N=2  1+2=3        divisible by 3
;;; N=3  1+2+3=6      divisible by 3
;;; N=5  1+2+...+5=15 divisible by 3
;;; N=6  1+2+...+6=21 divisible by 3
;;; N=8  1+2+...+8=36 divisible by 3
;;; N=9  1+2+...+9=45 divisible by 3
;;;
;;; Only numbers with four or seven digits are valid pandigitals.

;;; O(?)
;;; run time: 0.1 s
(defun problem-041 (&optional (n 9))
  (labels ((permute (digits result)
	     "Return a list of pandigital primes with given digits."
	     (if (null (rest digits))
		 (let ((n (+ (* 10 result) (first digits))))
		   (and (primep n) (list n)))
		 (loop for i in digits nconc
		      (permute (remove i digits) (+ (* 10 result) i))))))
    (loop for i from 1 to n 
       for digits = (loop for d from 1 to i collect d)
       for p = (permute digits 0)
       when p maximize (reduce #'max p))))
