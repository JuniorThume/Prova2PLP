

(defun randomList ()
  (let ((lst ()))
    (dotimes (i 10000)
       (setf lst (cons (random 1000) lst)))
   lst))

(defun swap (list i j)
    (setq aux (aref list i))
    (setf (aref list i) (aref list j))
    (setf (aref list j) aux)
)

(defun bubblesort (list)
    (do ((i (length list) (- i 1))) (= i 0)
        (do ((j 0 (+ j 1))) ((= j (- i 1)))
            (if (> (aref list j) (aref list (+ j 1)))
                (swap list j (+ j 1))
            )
        )
    )
)

(defvar myList(randomList))
(bubblesort myList)
;*** - IF: variable = has no value
(write myList)
