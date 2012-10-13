;;; Project Euler, problem 15

;;; Recursive solution
;;; O(2^N)
;;; run time: several hours
#+(or)
(defun problem-015 (&optional (n 20))
  (labels ((paths (r c)
	     (if (or (zerop r) (zerop c))
		 1
		 (+ (paths (1- r) c) (paths r (1- c))))))
    (paths n n)))

;;; Iterative solution, memoizing results (i-1,j) and (i,j-1)
;;; O(N^2)
;;; run time: ~0 sec
#+(or)
(defun problem-015 (&optional (n 20))
  (let ((paths (make-array (list (1+ n) (1+ n)) :element-type 'integer)))
    ;; index must start from 0, because of memoizing
    (loop for i from 0 to n do
	 (loop for j from 0 to n do
	      (if (or (zerop i) (zerop j))
		  (setf (aref paths i j) 1)
		  (setf (aref paths i j) (+ (aref paths (1- i) j) (aref paths i (1- j)))))))
    (aref paths n n)))

;;; Combinatorial solution
;;;  For an nxm grid, the total combinations are (n+m)!/(n!*m!)
;;; O(1)
;;; run time: ~0 sec
(defun problem-015 (&optional (n 20))
  (values (truncate (factorial (* 2 n)) (expt (factorial n) 2))))

#+sbcl
(sb-rt:deftest test-015
    (problem-015 2)
  6)
