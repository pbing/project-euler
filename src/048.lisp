;;; Project Euler, problem 48

;;; O(N)
;;; run time: 0.1 s
(defun problem-048 (&optional (n 1000))
  (loop for i from 1 to n
        for j = 1 then (rem (+ j (expt i i)) (expt 10 10))
       finally (return j)))
