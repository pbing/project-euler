;;; Project Euler, problem 100
;;; 
;;; X = B = blue discs
;;; Y = R = red discs
;;;
;;; B/(B+R) * (B-1)/(B+R-1) = 1/2  (1)
;;; B+R > 1E12                     (2)
;;; 
;;; Quadradic Diophantine equation
;;; B^2 - 2BR - R^2 - B + R = 0    (3)
;;; 
;;; Solved with http://www.alpertron.com.ar/QUAD.HTM
;;;
;;; X(0) = 1
;;; Y(0) = 0
;;; 
;;; X(n+1) = P X(n) + Q y(n) + K
;;; Y(n+1) = R X(n) + S Y(n) + L
;;; 
;;; P = 5
;;; Q = 2
;;; K = -2
;;; R = 2
;;; S = 1
;;; L = -1

;;; O(?)
;;; run time: ~0 sec
(defun problem-100 (&optional (n 1000000000000))
  (loop with p = 5 and q = 2 and k = -2
       and r = 2 and s = 1 and l = -1
       for x = 1 then (+ (* p x) (* q y) k)
       and y = 0 then (+ (* r x) (* s y) l)
       ;do (print (list x y))
       until (> (+ x y) n)
     finally (return (values x y))))

#+sbcl
(sb-rt:deftest test-100
    (problem-100 20)
  15 6)