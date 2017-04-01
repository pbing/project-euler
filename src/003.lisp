;;; Project Euler, problem 3

;;; O(?)
(defun problem-003 (&optional (x 600851475143))
  (first (last (factor x))))
