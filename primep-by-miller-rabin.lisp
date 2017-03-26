;;;; Primality test by Miller-Rabin
;;;; https://en.wikipedia.org/wiki/Miller–Rabin_primality_test

;;; Implement with bases 2 and 3.
;;; Deterministic if n < 1,373,653.
;;;
;;; Run time is much slower.
;;; Example: (time (loop repeat 1000000 do (primep 10007)))
;;;
;;; n        trial            Miller-   heap alloc
;;;          division         Rabin
;;; -----------------------------------------------
;;; 11       0.046990         0.375089
;;; 23       0.048246         0.472256
;;; 53       0.050458         0.586807
;;; 101      0.051662         0.610384
;;; 211      0.064844         0.671158
;;; 503      0.195546         0.886546
;;; 1009     0.225225         0.931946
;;; 2003     0.261175         0.987693
;;; 5003     0.330764         1.071443
;;; 10007    0.404001         1.176433
;;; 20011    0.563469         1.221680
;;; 23581    0.608607         1.245706
;;; 23593    0.609785         1.297781   yes
;;; 50021    0.795351         2.452829   yes
;;; 100003   1.065865         5.593620   yes
;;; 200003   1.387693         7.252047   yes
;;; 500009   2.053946         7.426340   yes
;;; 1000003  2.861031         8.494976   yes
(defun miller-rabin-1 (n)
  "Helper function for PRIMEP.
   Decompose (n - 1) = d • 2^r"
  (loop
      with r = 0
      and d = (1- n)
      while (evenp d)
      do (incf r)
         (setf d (ash d -1))
      finally (return (values d r))))

(defun miller-rabin-2 (r x n)
  "Helper function for PRIMEP."
  (loop
      repeat (1- r)
      with n-1 = (1- n)
      do (setf x (mod (* x x) n))
         ;(format t "(2) r=~d x=~d~%" r x)
      if (= x 1)
      do (return nil)
      if (= x n-1)
      do (return t)
      finally (return nil)))

(defun primep (n)
  "Is N prime?
   Deterministic for N < 1,373,653."
  (setf n (abs n))
  (if (or (= n 2) (= n 3)) (return-from primep t))
  (if (evenp n) (return-from primep nil))
  (if (< n 2) (return-from primep nil))
  (multiple-value-bind (d r)
      (miller-rabin-1 n)
    (loop
        with n-1 = (1- n)
        for a from 2 to 3
        for x = (expt-mod a d n)
        ;do (format t "(1) a=~d d=~d r=~d x=~d~%" a d r x)
        always (or (= x 1)
                   (= x n-1)
                   (miller-rabin-2 r x n)))))
