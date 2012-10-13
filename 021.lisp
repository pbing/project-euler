;;; Project Euler, problem 21

;;; O(N)
;;; run time: ~0 seconds
(defun problem-021 (&optional (n 10000))
  ;; O(√N)
  ;; Add one because we start from number 2.
  (flet ((sum-proper-divisors-p (n)
	   (1+ (loop for i from 2 to (isqrt n)
		  for r = (rem n i)  
		  if (zerop r) sum (+ i (truncate n i))))))

    (loop for i from 1 below n
       for a = (sum-proper-divisors-p i)
       if (and (> a i) 
	       (= i (sum-proper-divisors-p a)))
       sum (+ i a))))

#+sbcl
(sb-rt:deftest test-021
    (problem-021 300)
  504)