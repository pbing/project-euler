;;; Project Euler, problem 18

(defparameter *triangle*
  #2A((75  0  0  0  0  0  0  0  0  0  0  0  0  0  0)
      (95 64  0  0  0  0  0  0  0  0  0  0  0  0  0)
      (17 47 82  0  0  0  0  0  0  0  0  0  0  0  0)
      (18 35 87 10  0  0  0  0  0  0  0  0  0  0  0)
      (20 04 82 47 65  0  0  0  0  0  0  0  0  0  0)
      (19 01 23 75 03 34  0  0  0  0  0  0  0  0  0)
      (88 02 77 73 07 63 67  0  0  0  0  0  0  0  0)
      (99 65 04 28 06 16 70 92  0  0  0  0  0  0  0)
      (41 41 26 56 83 40 80 70 33  0  0  0  0  0  0)
      (41 48 72 33 47 32 37 16 94 29  0  0  0  0  0)
      (53 71 44 65 25 43 91 52 97 51 14  0  0  0  0)
      (70 11 33 28 77 73 17 78 39 68 17 57  0  0  0)
      (91 71 52 38 17 14 91 43 58 50 27 29 48  0  0)
      (63 66 04 68 89 53 67 30 73 16 69 87 40 31  0)
      (04 62 98 27 23 09 70 98 73 93 38 53 60 04 23)))

;;; O(N^2)
;;; run time: ~0 seconds
(defun problem-018 (&optional (triangle *triangle*))
  (let ((dim (array-dimension triangle 0))
	;; copy triangle matrix, because it will be modified
	(tr (copy-array triangle)))
    (loop for i from (- dim 2) downto 0
       for k = (1+ i) do
       (loop for j from 0 to i do
	    (incf (aref tr i j) (max (aref tr k j) (aref tr k (1+ j))))))
    (aref tr 0 0)))
