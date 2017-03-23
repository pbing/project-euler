;;; Project Euler, problem 79

(defparameter *keylog*
  '((3 1 9) (6 8 0) (1 8 0) (6 9 0) (1 2 9) (6 2 0) (7 6 2) (6 8 9) (7 6 2) (3 1 8)
    (3 6 8) (7 1 0) (7 2 0) (7 1 0) (6 2 9) (1 6 8) (1 6 0) (6 8 9) (7 1 6) (7 3 1)
    (7 3 6) (7 2 9) (3 1 6) (7 2 9) (7 2 9) (7 1 0) (7 6 9) (2 9 0) (7 1 9) (6 8 0)
    (3 1 8) (3 8 9) (1 6 2) (2 8 9) (1 6 2) (7 1 8) (7 2 9) (3 1 9) (7 9 0) (6 8 0)
    (8 9 0) (3 6 2) (3 1 9) (7 6 0) (3 1 6) (7 2 9) (3 8 0) (3 1 9) (7 2 8) (7 1 6)))

;;; brute-force
;;; O(?)
;;; run time: 30 s
(defun problem-079 (&optional (keylog *keylog*))
  (labels ((digits (n &optional (base 10))
	     "Get list of digits of number N according to BASE."
	     (nreverse (loop collect (rem n base)
			     do (setf n (truncate n base))
			     until (zerop n))))

	   (digit-order-p (digits keylog)
	     "Compare order of DIGITS according to REF."
	     (loop for key-digits in keylog
		   always (loop for k in key-digits
				for pos = (position k digits) then (position k digits :start pos)
				always pos))))
    (loop with keylog-1 = (remove-duplicates keylog)
	  for i from 0
	  for d = (digits i)
	  until (digit-order-p d keylog-1)
	  finally (return i))))

#+sbcl
(sb-rt:deftest test-079
    (problem-079 '((3 1 7) (5 3 2) (1 7 8)))
  531278)
