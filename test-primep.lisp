;;;; Test primality algorithms

(in-package :cl-user)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun primep-by-trial-division (n) nil)
  (load "primep-by-trial-division")
  (setf (fdefinition 'primep-by-trial-division) #'primep)

  (defun primep-by-fermat (n) nil)
  (load "primep-by-fermat")
  (setf (fdefinition 'primep-by-fermat) #'primep)

  (defun primep-by-miller-rabin (n) nil)
  (load "primep-by-miller-rabin")
  (setf (fdefinition 'primep-by-miller-rabin) #'primep))

(defun do-test-primep-by-fermat (&optional (max 2000003))
  (loop
      for n from 3 to max by 2
      while (eq (primep-by-trial-division n)
                (primep-by-fermat n))
      finally (return n)))

(defun do-test-primep-by-miller-rabin (&optional (max 2000003))
  (loop
      for n from 3 to max by 2
      while (eq (primep-by-trial-division n)
                (primep-by-miller-rabin n))
      finally (return n)))
