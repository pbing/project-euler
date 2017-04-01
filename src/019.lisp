;;; Project Euler, problem 1

;;; run time: ~0 s
(defun problem-019 (&optional (year1 1901) (year2 2000))
  (let ((result 0))
    (loop for y from year1 to year2 do
	 (loop for m from 1 to 12 do
	      (multiple-value-bind (second minute hour date month year day daylight-p zone)
		  (decode-universal-time (encode-universal-time 0 0 12 1 m y))
		(declare (ignore second minute hour date month year daylight-p zone))
		(if (= day 6)
		    (incf result)))))
    result))
