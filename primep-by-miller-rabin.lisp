;;;; Primality test by Miller-Rabin
;;;; https://en.wikipedia.org/wiki/Miller–Rabin_primality_test

;;; Implement with bases 2 and 3.
;;; Deterministic if n < 1,373,653.
;;;
;;; Run time is much slower.
;;; Example: (time (loop repeat 1000000 do (primep 10007)))
;;;
;;; n        trial            Miller-    heap alloc
;;;          division         Rabin
;;; -----------------------------------------------
;;; 11       0.039512         0.327429
;;; 23       0.040081         0.416254
;;; 53       0.068255         0.470811
;;; 101      0.070454         0.528745
;;; 211      0.091532         0.636625
;;; 503      0.117989         0.758431
;;; 1009     0.172554         0.702859
;;; 2003     0.206969         0.888172
;;; 5003     0.291683         1.014136
;;; 10007    0.394445         1.080135
;;; 20011    0.546965         1.154431
;;; 23581    0.604932         1.116078
;;; 23593    0.586457         1.128160   yes
;;; 50021    0.836240         1.891264   yes
;;; 100003   1.152733         4.990946   yes
;;; 200003   1.608948         6.287040   yes
;;; 500009   2.528622         6.388019   yes
;;; 1000003  3.532821         7.417297   yes
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
      do (setf x (rem (* x x) n))
         ;(format t "(2) r=~d x=~d~%" r x)
      if (= x 1)
      do (return nil)
      if (= x n-1)
      do (return t)
      finally (return nil)))

(defun primep (n)
  "Is N prime?
   Deterministic for N < 1,373,653."
  (declare (integer n))
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
