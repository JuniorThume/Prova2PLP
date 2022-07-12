
(defvar i 0)

(defun listaEmbaralhada ()
  (let ((lista ()))
    (dotimes (i 1000)
       (setf lista (cons (random 1000) lista))) lista)
)

(defun bubblesort (lista)
 
    (do (( i 0 (+ i 1))) (( = i 1000 ))
        (do (( j 0 (+ j 1))) (( = j 999))
           (if (>= (nth j lista) (nth i lista))
                (progn
                (setq aux (nth i lista))
                (setf (nth i lista) (nth j lista))
                (setf (nth j lista) aux)
                 )
            )
        )
    )
)

(defvar minhaLista(listaEmbaralhada))

(time
    (loop
        
        (if (= i 1) (return))
    
        (setq minhaLista(listaEmbaralhada))

        ;(terpri)
        ;(princ "Valores não ordenados: ")
        ;(write minhaLista)
        ;(terpri)
        ;(princ "Valores ordenados: ")

        (bubblesort minhaLista)

        (setf i (+ i 1))
    )
)



