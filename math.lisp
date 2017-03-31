;;;; Project Euler, some auxiliary functions

(defun copy-array (array)
  "Copy an ARRAY."
  (let ((dims (array-dimensions array)))
    (adjust-array
     (make-array dims :element-type (array-element-type array) :displaced-to array)
     dims)))

(defun divisor-count (n)
  "Number of divisors of N."
  (declare (integer n))
  (loop
      for factors of-type integer = (factor n) then (delete factor factors)
      for factor of-type integer = (first factors)
      for result of-type integer = #1=(1+ (count factor factors)) then (* result #1#)
      until (null factor)
      finally (return result)))

(defun factor (n)
  "Return a list of factors of N."
  (declare (integer n))
  (if (> n 1)
      (loop
          with max-d of-type integer = (isqrt n)
	  for d of-type integer = 2 then (if (evenp d) (+ d 1) (+ d 2)) do
            (cond ((> d max-d) (return (list n))) ; n is prime
                  ((zerop (rem n d)) (return (cons d (factor (truncate n d)))))))))

(defun factorial (n)
  "Calculates N!"
  (declare (integer n))
  (loop
      for result of-type integer = 1 then (* result i)
      for i of-type integer from 2 to n
      finally (return result)))

(defun palindromep (n &key (base 10))
  "Is N a palindrom according to BASE?"
  (declare (integer n base))
  (let ((reversed (loop
                      for k of-type integer = n then (truncate k base) until (zerop k)
                      for r of-type integer = #1=(rem k base) then (+ (* base r) #1#)
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
  (declare (type (integer 0) base exponent modulus))
  "Return the modular exponentiation (BASE ** EXPONENT) mod MODULUS."
  (if (= modulus 1)
      (return-from expt-mod 0))
  (if (zerop exponent)
      (return-from expt-mod 1))
  (setf base (rem base modulus))
  (loop
      with result of-type (integer 0) = 1
      if (oddp exponent)
      do (setf result (rem (* result base) modulus))
      end
      do (setf exponent (ash exponent -1))
      until (zerop exponent)
      do (setf base (rem (* base base) modulus))
      finally (return result)))
