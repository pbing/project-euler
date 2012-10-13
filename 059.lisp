;;; Project Euler, problem 59

(defun read-cipher (cipher-file)
  "Read cipher from CIPHER-FILE and return a vector of integers. The
file contains only a single line."
  (with-open-file (stream cipher-file)
    (read-from-string (concatenate 'string "#(" (substitute #\Space #\, (read-line stream)) ")"))))

(defun decode (encoded pass-code)
  "Decode the vector ENCODED with the vector PASS-CODE."
  (let ((e-length (length encoded))
	(p-length (length pass-code)))
    (loop with decoded-text = (make-string e-length)
       for i from 0 below e-length
       for e = (aref encoded i)
       for p = (aref pass-code (rem i p-length))
       do (setf (aref decoded-text i) (code-char (logxor e p)))
       finally (return decoded-text))))

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;; Simple algorithm 
; ;;;; Write all possible solutions into a file and grep for the most
; ;;;; common English word:
; ;;;;
; ;;;; $ grep -i ' the ' decoded.txt
; ;;;;
; ;;;; Find the password phrase and calculate the answer.
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;;; run time: 3 sec
; (defun write-all-decoded-solutions (&optional (cipher-file #p"cipher1.txt") (decoded-file #p"decoded.txt"))
;   "This procedure writes all decoded solutions of CIPHER-FILE to DECODED-FILE."
;   (let ((cipher (read-cipher cipher-file)))
;     (with-open-file (stream decoded-file :direction :output :if-exists :supersede)
;       (loop for i from #1=(char-code #\a) to #2=(char-code #\z) do
; 	   (loop for j from #1# to #2# do
; 		(loop for k from #1# to #2# 
; 		   for pass-code = (vector i j k)
; 		   for pass-phrase = (map 'string #'code-char pass-code)
; 		   for decoded = (decode cipher pass-code)
; 		   do (format stream "~&~S ~A: ~S~%" pass-phrase pass-code decoded)))))))
; 
; (defun problem-059 (&optional (cipher-file #p"cipher1.txt") (pass-phrase "god"))
;   (let ((cipher (read-cipher cipher-file))
; 	(pass-code (map 'vector #'char-code pass-phrase)))
;     (loop for n across (decode cipher pass-code) summing (char-code n))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Heuristic algorithm
;;;; Test every solution for the occurrence of the most common English words.
;;;; http://en.wikipedia.org/wiki/Most_common_words_in_English
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split (string)
  "Split STRING into a list of alpha-char tokens."
  (split-sequence:split-sequence-if-not #'alpha-char-p string :remove-empty-subseqs t))

(defun all-words-p (words list)
  "Return T if all WORDS in LIST have been found. Case is ignored."
  (loop for w in words always (find w list :test #'string-equal)))

(defun heuristic-decode (cipher common-words)
  "Try all possible combinations on CIPHER and return the pass-code
vector and the decoded message. The message is valid, when all of
COMMON-WORDS are in the decoded text."
  (loop for i from #1=(char-code #\a) to #2=(char-code #\z) do
       (loop for j from #1# to #2# do
	    (loop for k from #1# to #2# 
	       for pass-code = (vector i j k)
	       for decoded = (decode cipher pass-code)
	       for word-list = (split decoded)
	       do (if (all-words-p common-words word-list)
		      (return-from heuristic-decode (values (vector i j k)
							    decoded)))))))

;;; run time: 2 sec
(defun problem-059 (&optional (cipher-file #p"cipher1.txt") (common-words '("the" "to" "of")))
  (multiple-value-bind (pass-code decoded)
      (heuristic-decode (read-cipher cipher-file) common-words)
    (declare (ignore pass-code))
    (loop for n across decoded summing (char-code n))))

#+sbcl
(sb-rt:deftest test-059
    (problem-059)
  107359)