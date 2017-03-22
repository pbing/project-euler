;;; Define system for Allegro Common Lisp
;;;
;;; Usage:
;;;;    :cl allegro-system.lisp
;;;;    (load-system :euler :compile t)
;;;;    (do-tests)

(defsystem :euler (:default-package "CL-USER")
  (:definitions
      "split-sequence/split-sequence"
      (:module-group problems
                     (:parallel
                      "math"
                      "001"
                      "002"
                      "003"
                      "004"
                      "005"
                      "006"
                      "007"
                      "008"
                      "009"
                      "010"
                      "011"
                      "012"
                      "013"
                      "014"
                      "015"
                      "016"
                      "017"
                      "018"
                      "019"
                      "020"
                      "021"
                      "022"
                      "024"
                      "025"
                      "027"
                      "030"
                      "031"
                      "034"
                      "035"
                      "036"
                      "041"
                      "048"
                      "056"
                      "059"
                      "067"
                      "079"
                      "092"
                      "097"
                      "100"
                      "108"
                      "187"
                      "204"
                      "255")))
  (:serial
      :problems
      "allegro-tests"))
