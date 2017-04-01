;;; Project Euler, problem 97

;;; O(1)
;;; run time: ~0 sec
#+(or sbcl ccl)
(defun problem-097 ()
  (rem (1+ (* 28433 (expt 2 7830457))) (expt 10 10)))

#+allegro
(defun problem-097 ()
  #.(rem (1+ (* 28433 (expt-mod 2 7830457 (expt 10 10)))) (expt 10 10)))
