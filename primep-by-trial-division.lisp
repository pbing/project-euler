;;;; Primality test by trial division
;;;; https://en.wikipedia.org/wiki/Primality_test

;;; Use (6k - 1) and (6k + 1) as possible prime numbers.
;;; https://en.wikipedia.org/wiki/Primality_test
(defun primep (n)
  "Is N prime?"
  (setf n (abs n))
  (if (<= n 1) (return-from primep nil))
  (if (<= n 3) (return-from primep t))
  (if (or (evenp n) (= (rem n 3) 0)) (return-from primep nil))
  (loop
      for i from 5 by 6
      while (<= (* i i) n)
      never (or (zerop (rem n i))
                (zerop (rem n (+ i 2))))))
