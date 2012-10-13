;;; Project Euler, problem 5

;;; O(N)
;;; run time: ~0 seconds
(defun problem-005 (&optional (n 20))
  (loop for i from 1 to n
     for j = 1 then  (lcm i j)
     finally (return j)))

 #+sbcl
(sb-rt:deftest test-005
    (problem-005 10)
  2520)
