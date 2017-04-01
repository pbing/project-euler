;;; Project Euler, problem 92

;;; O(N)
;;; run time: 5 s
(defun problem-092 (&optional (n 10000000))
  (let ((result 0))
    (loop for i from 1 to n
        do (loop for j = i then (square-digits j)
               if (= j 89) 
               do (incf result)
               until (or (= j 1) (= j 89))))
    result))

(defun square-digits (n)
  (loop
      for d = (rem n 10)
      sum (+ (* d d))
      do (setf n (truncate n 10))
      until (zerop n)))
