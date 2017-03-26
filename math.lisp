;;;; Project Euler, some auxiliary functions

(defun copy-array (array)
  "Copy an ARRAY."
  (let ((dims (array-dimensions array)))
    (adjust-array
     (make-array dims :element-type (array-element-type array) :displaced-to array)
     dims)))

(defun divisor-count (n)
  "Number of divisors of N."
  (loop for factors = (factor n) then (delete factor factors)
     for factor = (first factors)
     for result = #1=(1+ (count factor factors)) then (* result #1#)
     until (null factor)
     finally (return result)))

(defun factor (n)
 "Return a list of factors of N."
 (if (> n 1)
   (loop with max-d = (isqrt n)
	  for d = 2 then (if (evenp d) (+ d 1) (+ d 2)) do
	  (cond ((> d max-d) (return (list n))) ; n is prime
		((zerop (rem n d)) (return (cons d (factor (truncate n d)))))))))

(defun factorial (n)
  "Calculates N!"
  (loop for result = 1 then (* result i)
     for i from 2 to n
     finally (return result)))

(defun palindromep (n &key (base 10))
  "Is N a palindrom according to BASE?"
  (let ((reversed (loop for k = n then (truncate k base) until (zerop k)
		     for r = #1=(rem k base) then (+ (* base r) #1#)
		     finally (return r))))
    (= n reversed)))

;;; http://groups.google.com.ai/group/comp.lang.lisp/msg/6bb75f006221fd4c
(defun permutations (items)
  "Return a list of all permutations of list ITEMS."
  (let ((result '()))
    (if items
	(dolist (item items result)
	  (dolist (permutation (permutations (remove item items)))
	    (push (cons item permutation) result)))
	'(nil))))

;;; https://en.wikipedia.org/wiki/Modular_exponentiation
;;; https://github.com/Publitechs/cl-utilities/blob/master/expt-mod.lisp
(defun expt-mod (base exponent modulus)
  "Return the modular exponentiation (BASE ** EXPONENT) mod MODULUS."
  (if (= modulus 1)
      (return-from expt-mod 0))
  (if (zerop exponent)
      (return-from expt-mod 1))
  (setf base (mod base modulus))
  (loop with result = 1
      if (oddp exponent)
      do (setf result (mod (* result base) modulus))
      end
      do (setf exponent (ash exponent -1))
      until (zerop exponent)
      do (setf base (mod (* base base) modulus))
      finally (return result)))
