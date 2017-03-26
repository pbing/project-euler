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
;;; 11       0.046990         0.390501
;;; 23       0.048246         0.556835
;;; 53       0.050458         0.526484
;;; 101      0.051662         0.598897
;;; 211      0.064844         0.705093
;;; 503      0.195546         0.922159
;;; 1009     0.225225         0.905826
;;; 2003     0.261175         1.019346
;;; 5003     0.330764         1.109104
;;; 10007    0.404001         1.216735
;;; 20011    0.563469         1.269608
;;; 23581    0.608607         1.259902
;;; 23593    0.609785         1.315253   yes
;;; 50021    0.795351         2.578198   yes
;;; 100003   1.065865         5.787619   yes
;;; 200003   1.387693         7.426992   yes
;;; 500009   2.053946         8.270897   yes
;;; 1000003  2.861031         8.617238   yes
(defun primep (n)
  "Is N prime?"
  (setf n (abs n))
  (or (= n 2) (= n 3)
      (and (= 1 (expt-mod 2 (1- n) n))
           (= 1 (expt-mod 3 (1- n) n)))))
