;;; Project Euler, problem 22

;;; O(N)
;;; run time: ~0 s
(defun problem-022 (&optional (filename #p"names.txt"))
  (let* ((line (with-open-file (stream filename) (read-line stream)))
	 (snames (sort (split-sequence:split-sequence #\, (delete #\" line))
		       #'string<)))
    (loop for name in snames
       for i from 1
       sum (* i (string-code name)))))

(defun string-code (string)
  "Return the coded value of STRING. 'A'=1, 'B'=2, ..."
  (loop for c across string
       sum (- (char-int c) #.(char-int #\@))))
