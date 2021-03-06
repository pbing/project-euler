;;; Project Euler, problem 31

;;; O(2^N)
;;; run time: ~0.03 s
(defun problem-031 (&optional (amount 200) (coins '(200 100 50 20 10 5 2 1)))
  (if (null coins) (return-from problem-031 0))
  (let ((result 0)
        (coin (first coins)))
    (loop for i upto amount by coin
        if (> amount i)
        do (incf result (problem-031 (- amount i) (rest coins)))
        else
        do (incf result))
    result))
