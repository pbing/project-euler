;;;; Primality test by Fermat's little theorem
;;;; https://en.wikipedia.org/wiki/Fermat_primality_test

;;; Implement with bases 2 and 3 for probalistic prime detection.
;;; Possible false positives with Carmichael numbers (561, 1105, 1729, 2465, 2821, 6601, 8911, ...).
;;;
;;; Run time is much slower.
;;; Example: (time (loop repeat 1000000 do (primep 10007)))
;;;
;;; n        trial            Fermat's   heap alloc
;;;          division         theorem
;;; -----------------------------------------------
;;; 11       0.039512         0.302840
;;; 23       0.040081         0.395443
;;; 53       0.068255         0.457087
;;; 101      0.070454         0.516409
;;; 211      0.091532         0.612502
;;; 503      0.117989         0.732396
;;; 1009     0.172554         0.767320
;;; 2003     0.206969         0.894909
;;; 5003     0.291683         0.981669
;;; 10007    0.394445         1.074605
;;; 20011    0.546965         1.128503
;;; 23581    0.604932         1.123106
;;; 23593    0.586457         1.163150   yes
;;; 50021    0.836240         1.926716   yes
;;; 100003   1.152733         5.130280   yes
;;; 200003   1.608948         6.589002   yes
;;; 500009   2.528622         7.100448   yes
;;; 1000003  3.532821         7.532901   yes
(defun primep (n)
  "Is N prime?"
  (setf n (abs n))
  (or (= n 2) (= n 3)
      (and (= 1 (expt-mod 2 (1- n) n))
           (= 1 (expt-mod 3 (1- n) n)))))
