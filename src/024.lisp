;;; Project Euler, problem 24

;;; O(N!)
;;; run-time: 25 seconds
;;;
;;; AllegroCLexpress:
;;; Error: An explicit gc call caused a need for 10223616 more bytes of heap. 
;;;        This request cannot be satisfied because you have hit the 
;;;        Allegro CL Free Express heap limit.  
(defun problem-024 (&optional (digits '(0 1 2 3 4 5 6 7 8 9)) (n 1000000))
  (flet ((list-numeric (list)
	     (loop with result = 0
		for i in list do
		(setf result (+ (* result 10) i))
		finally (return result))))
    (let* ((p (permutations digits))
	   (s (sort (loop for i in p collect (list-numeric i)) #'<)))
      (elt s (1- n)))))
