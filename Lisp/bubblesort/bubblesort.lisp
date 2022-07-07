

(defun listaEmbaralhada ()
  (let ((lista ()))
    (dotimes (i 10000)
       (setf lst (cons (random 10000) lista)))
   lst))

(defun swap (lista i j)
    (setq aux (aref lista i))
    (setf (aref lista i) (aref lista j))
    (setf (aref lista j) aux)
)

(defun bubblesort (lista)
    (do ((i (length lista) (- i 1))) (= i 0)
        (do ((j 0 (+ j 1))) ((= j (- i 1)))
            (if (> (aref lista j) (aref lista (+ j 1)))
                (swap lista j (+ j 1))
            )
        )
    )
)

(defvar minhaLista(listaEmbaralhada))
(bubblesort minhaLista)

(write minhaLista)
