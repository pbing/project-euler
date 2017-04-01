;;; Project Euler, problem 2

;;; O(N)
(defun problem-002 (&optional (n 4000000))
  (loop for a = 1 then b 
       and b = 1 then (+ a b)
       until (> b n)
       when (evenp b) sum b))
