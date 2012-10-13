;;; Project Euler, problem 1
;;;
;;; sum(a,1,N) = a*N*(N+1)/2
;;; a=3: 3,6,...,3*N
;;; a=5: 5,10,...,5*N

;;; O(1)
(defun problem-001 (&optional (x 1000))
  (let ((n (1- x)))
    (flet ((sum (a)
	     (let ((i (truncate n a)))
	       (* 1/2 a i (1+ i)))))
      (- (+ (sum 3) (sum 5))
	 (sum (lcm 3 5))))))	     ; subtract double counted values 

#+sbcl
(sb-rt:deftest test-001
    (problem-001 10)
  23)