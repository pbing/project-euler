;;; Project Euler
;;; http://projecteuler.net/

;(in-package #:cl-user)

(defsystem :euler
  :depends-on (:split-sequence
               #+sbcl :sb-rt
               #+ccl :ptester)
  :components ((:file "math")
               (:file "001")
               (:file "002")
               (:file "003")
               (:file "004")
               (:file "005")
               (:file "006")
               (:file "007")
               (:file "008")
               (:file "009")
               (:file "010")
               (:file "011")
               (:file "012")
               (:file "013")
               (:file "014")
               (:file "015")
               (:file "016")
               (:file "017")
               (:file "018")
               (:file "019")
               (:file "020")
               (:file "021")
               (:file "022")
               (:file "024")
               (:file "025")
               (:file "027")
               (:file "030")
               (:file "031")
               (:file "034")
               (:file "035")
               (:file "036")
               (:file "041")
               (:file "048")
               (:file "056")
               (:file "059")
               (:file "067")
               (:file "079")
               (:file "092")
               (:file "097")
               (:file "100")
               (:file "108")
               (:file "187")
               (:file "204")
               (:file "255")
               #+(or allegro ccl) (:file "problem-tests")))

;;; for test do: (asdf:test-system :euler)
(defmethod perform ((o test-op) (s (eql (find-system :euler))))
  #+sbcl (funcall (intern "DO-TESTS" "SB-RT"))
  #+(or allegro ccl) (funcall (intern "DO-TESTS"))
  t)

;;; Local Variables:
;;; mode: Lisp
;;; End:
