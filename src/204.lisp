;;; Project Euler, problem 204

;;; H(0,i) = 0
;;; H(x,0) = 1
;;; H(x,i) = H(x/pi,i) + H(x,i-1)
;;; Hamming(x,n) = H(x,π(n))
;;; 
;;; run-time: 0.2 sec
(defun problem-204 (&optional (x (expt 10 9)) (n 100))
  (let* ((primes-list (nconc (list 1 2) (loop for i from 3 to n by 2 when (primep i) collect i)))
	 (primes-count (length primes-list))
	 (primes-array (make-array primes-count :initial-contents primes-list)))
    (labels ((hamming (x i)
	       (cond ((zerop x) 0)
		     ((zerop i) 1)
		     (t (+ (hamming (truncate x (aref primes-array i)) i) 
			   (hamming x (1- i)))))))
      (hamming x (1- primes-count)))))
