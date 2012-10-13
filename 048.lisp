;;; Project Euler, problem 48

;;; O(N)
;;; run time: ~0 sec
(defun problem-048 (&optional (n 1000))
  (loop for i from 1 to n
        for j = 1 then (rem (+ j (expt i i)) (expt 10 10))
       finally (return j)))

#+sbcl
(sb-rt:deftest test-048
    (problem-048 10)
  0405071317)