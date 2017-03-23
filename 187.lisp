;;; Project Euler, problem 187

;;; O(?)
;;; run time: 51 min
#+(or)(defun problem-187 (&optional (n (expt 10 8)))
  (loop for i from 2 below n
     when (= (length (factor i)) 2) sum 1))

;;; O(?)
;;; run time: 11 s
(defun problem-187 (&optional (n (expt 10 8)))
  (let* ((m (truncate n 2))	     ; smallest prime is 2 and p1*p2<n
	 (sieve (make-array m :element-type 'bit :initial-element 0)))
    ;; prime sieve
    (loop for i from 2 to (isqrt m) do
	 (loop  for j from (* 2 i) below m by i
	    do (setf (aref sieve j) 1)))
    ;; calculate semi primes (i: first prime, j: second prime)
    (loop for i from 2 below m
       when (zerop (aref sieve i)) sum
       (loop for j from i below (ceiling n i)
	  when (and (zerop (aref sieve j))
		    (< (* i j) n))
	  sum 1))))

#+sbcl
(sb-rt:deftest test-187
    (problem-187 30)
  10)