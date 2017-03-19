;;; Project Euler, problem 35

;;; O(???)
;;; run time: ??? s
(defun problem-035 (&optional (n 1000000))
  (let ((result 0))
    (if (> n 1) 
        (incf result))
    (loop for i from 3 below n by 2
        if (and (primep i) (all-rotated-primep i))
        do (incf result))
    result))

(defun all-rotated-primep (n)
  (cond 
   ((< n 10) t)
   ((< n 100) (and (primep n) 
                   (primep (+ (* 10 (rem n 10)) (truncate n 10)))))
   ((< n 1000) (and (primep n) 
                    (primep (+ (* 100 (rem n 10)) (truncate n 10)))
                    (primep (+ (* 10 (rem n 100)) (truncate n 100)))))
   ((< n 10000) (and (primep n) 
                     (primep (+ (* 1000 (rem n 10)) (truncate n 10)))
                     (primep (+ (* 100 (rem n 100)) (truncate n 100)))
                     (primep (+ (* 10 (rem n 1000)) (truncate n 1000)))))
   ((< n 100000) (and (primep n) 
                      (primep (+ (* 10000 (rem n 10)) (truncate n 10)))
                      (primep (+ (* 1000 (rem n 100)) (truncate n 100)))
                      (primep (+ (* 100 (rem n 1000)) (truncate n 1000)))
                      (primep (+ (* 10 (rem n 10000)) (truncate n 10000)))))
   ((< n 1000000) (and (primep n) 
                       (primep (+ (* 100000 (rem n 10)) (truncate n 10)))
                       (primep (+ (* 10000 (rem n 100)) (truncate n 100)))
                       (primep (+ (* 1000 (rem n 1000)) (truncate n 1000)))
                       (primep (+ (* 100 (rem n 10000)) (truncate n 10000)))
                       (primep (+ (* 10 (rem n 100000)) (truncate n 100000)))))
   ((< n 10000000) (and (primep n) 
                        (primep (+ (* 1000000 (rem n 10)) (truncate n 10)))
                        (primep (+ (* 100000 (rem n 100)) (truncate n 100)))
                        (primep (+ (* 10000 (rem n 1000)) (truncate n 1000)))
                        (primep (+ (* 1000 (rem n 10000)) (truncate n 10000)))
                        (primep (+ (* 100 (rem n 100000)) (truncate n 100000)))
                        (primep (+ (* 10 (rem n 1000000)) (truncate n 1000000)))))
   (t nil)))

#+sbcl
(sb-rt:deftest test-035
    (problem-035 100)
  13)
