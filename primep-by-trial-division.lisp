;;;; Primality test by trial division
;;;; https://en.wikipedia.org/wiki/Primality_test

;;; Use (6k - 1) and (6k + 1) as possible prime numbers.
;;; https://en.wikipedia.org/wiki/Primality_test
(defun primep (n)
  "Is N prime?"
  (setf n (abs n))
  (or (or (= n 2) (= n 3) (= n 5) (= n 7))
      (and (>= n 11)
           (let ((r (rem n 6))) (or (= r 1) (= r 5)))
           (loop for i from 6 to (max 6 (isqrt n)) by 6
               never (or (zerop (rem n (1- i)))
                         (zerop (rem n (1+ i))))))))
