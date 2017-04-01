;;; Project Euler, problem 25

;;; O(N)
;;; run-time: ~0 seconds
#+(or)(defun problem-025 (&optional (n 1000))
  (let ((n (expt 10 (1- n))))
    (loop for i from 2
       for a = 1 then b
       and b = 1 then (+ a b)
       until (> b n)
       finally (return i))))

;;; Phi = (1+√5)/2
;;; Phi^i/√5 > 10^(n-1)
;;; i > ((n-1)*log(10) + log(5)/2)/log(Phi) 

;;; O(1)
;;; run-time: ~0 seconds
(defun problem-025 (&optional (n 1000))
  (let ((phi (/ (1+ (sqrt 5d0)) 2)))
    (multiple-value-bind (result rest)
      (ceiling (/ (+ (* (1- n) (log 10d0)) (/ (log 5d0) 2)) (log phi)))
      (declare (ignore rest))
      result)))
