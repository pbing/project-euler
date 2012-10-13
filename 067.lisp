;;; Project Euler, problem 67

(defun triangle-from-file (file n)
  (let ((tr (make-array (list n n) :initial-element 0)))
    (with-open-file (stream file)
      (loop for i from 0 below n do
	   (loop for j from 0 to i do
	      (setf (aref tr i j) (read stream)))))
    tr))

;;; O(N^2)
;;; run time: ~0.01 seconds
(defun problem-067 (&optional (file #p"triangle.txt") (n 100))
  (problem-018 (triangle-from-file file n)))

#+sbcl
(sb-rt:deftest test-067
    (problem-067)
  7273)
