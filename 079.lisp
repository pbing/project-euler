;;; Project Euler, problem 79

(defparameter *keylog*
  '(319 680 180 690 129 620 762 689 762 318
    368 710 720 710 629 168 160 689 716 731
    736 729 316 729 729 710 769 290 719 680
    318 389 162 289 162 718 729 319 790 680
    890 362 319 760 316 729 380 319 728 716))

;;; brute-force
;;; O(?)
;;; run time: 48 s
(defun problem-079 (&optional (keylog *keylog*))
  (labels ((digits (n &optional (base 10))
	     "Get list of digits of number N according to BASE."
	     (nreverse (loop collect (rem n base)
			     do (setf n (truncate n base))
			     until (zerop n))))

	   (digit-order-p (digits keylog)
	     "Compare order of DIGITS according to REF."
	     (loop for key in keylog
		   for key-digits = (digits key)
		   always (loop for k in key-digits
				for pos = (position k digits) then (position k digits :start pos)
				always pos))))
    (loop for i from 0
	  for d = (digits i)
	  until (digit-order-p d keylog) ; 48 s run time
         ;until (digit-order-p d (remove-duplicates keylog)) ; FIXME: doesn't finish
	  finally (return i))))

#+sbcl
(sb-rt:deftest test-079
    (problem-079 '(317 532 178))
  531278)
