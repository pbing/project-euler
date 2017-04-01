;;; Project Euler, problem 17

;;; O(?)
;;; run time: ~0 seconds
(defun problem-017 (&optional (n 1000))
  (loop for i from 1 to n
     for letters = (remove-if-not #'alpha-char-p (format nil "~R" i))
     for count = (length letters)
     summing (if (or (< i 100) (zerop (rem i 100)))
		 count
		 (+ count 3))))		; add 3 letters for 'and'
