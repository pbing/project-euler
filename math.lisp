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

;;; Use (6k - 1) and (6k + 1) as possible prime numbers.
#+(or)(defun primep (n)
  "Is N prime?"
  (setf n (abs n))
  (or (or (= n 2) (= n 3) (= n 5) (= n 7))
      (and (>= n 11)
           (let ((r (rem n 6))) (or (= r 1) (= r 5)))
           (loop for i from 6 to (max 6 (isqrt n)) by 6
               never (or (zerop (rem n (1- i)))
                         (zerop (rem n (1+ i))))))))

;;; User Miller-Rabin with base 2 and 3 for prime test (n < 1,373,653)
;;; Use Fermat's little theorem with base 2 and 3 for probalistic prime detection.
;;; Possible false positives with Carmichael numbers (561, 1105, 1729, 2465, 2821, 6601, 8911, ...).
;;;
;;; Run time is much slower.
;;; Example: (time (loop repeat 1000000 do (primep 10007)))
;;;
;;; n        6(k-1), 6(k+1)   Fermat's   heap alloc
;;; -----------------------------------------------
;;; 11       0.046990         0.375089
;;; 23       0.048246         0.472256
;;; 53       0.050458         0.586807
;;; 101      0.051662         0.610384
;;; 211      0.064844         0.671158
;;; 503      0.195546         0.886546
;;; 1009     0.225225         0.931946
;;; 2003     0.261175         0.987693
;;; 5003     0.330764         1.071443
;;; 10007    0.404001         1.176433
;;; 20011    0.563469         1.221680
;;; 23581    0.608607         1.245706
;;; 23593    0.609785         1.297781  yes
;;; 50021    0.795351         2.452829  yes
;;; 100003   1.065865         5.593620  yes
;;; 200003   1.387693         7.252047  yes
;;; 500009   2.053946         7.426340  yes
;;; 1000003  2.861031         8.494976  yes
(defun miller-rabin-1 (n)
  "Helper function for PRIMEP.
   Decompose (n - 1) = d • 2^r"
  (loop
      with r = 0
      and d = (1- n)
      while (evenp d)
      do (incf r)
         (setf d (ash d -1))
      finally (return (values d r))))

(defun miller-rabin-2 (r x n)
  "Helper function for PRIMEP."
  (loop
      repeat (1- r)
      with n-1 = (1- n)
      do (setf x (mod (* x x) n))
         ;(format t "(2) r=~d x=~d~%" r x)
      if (= x 1)
      do (return nil)
      if (= x n-1)
      do (return t)
      finally (return nil)))

(defun primep (n)
  "Is N prime?"
  (setf n (abs n))
  (unless (< n 1373653) (warn "(PRIMEP N) should be less than 1373653."))
  (if (or (= n 2) (= n 3)) (return-from primep t))
  (if (evenp n) (return-from primep nil))
  (if (< n 2) (return-from primep nil))
  (multiple-value-bind (d r)
      (miller-rabin-1 n)
    (loop
        with n-1 = (1- n)
        for a from 2 to 3
        for x = (expt-mod a d n)
        ;do (format t "(1) a=~d d=~d r=~d x=~d~%" a d r x)
        always (or (= x 1)
                   (= x n-1)
                   (miller-rabin-2 r x n)))))

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
  (declare (fixnum base exponent modulus))
  (if (= modulus 1)
      (return-from expt-mod 0))
  (setf base (mod base modulus))
  (loop with result fixnum = 1
      until (zerop exponent)
      if (oddp exponent) do
        (setf result (mod (* result base) modulus))
      do (setf exponent (ash exponent -1))
         (setf base (mod (* base base) modulus))
      finally (return result)))
