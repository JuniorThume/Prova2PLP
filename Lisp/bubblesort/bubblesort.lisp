
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
;(defvar tempoDecorrido 0)
;(defvar tempoDoLoop 0)
;(defvar tempoMedio 0)

(defvar i 0)

;limpa o arquivo csv
;(with-open-file (str "runtime-bubblesort.csv"
;                :direction :output
;                :if-exists :supersede
;                :if-does-not-exist :create)
;        (format str "")
;)

(time
    (loop
    
    (setq minhaLista(listaEmbaralhada))
    ;(terpri)
    ;(terpri)
    ;(princ "Valores não ordenados: ")
    ;(write minhaLista)
    ;(terpri)
    ;(princ "Valores ordenados: ")

    (bubblesort minhaLista)

    ;(write minhaLista)
    ;(terpri)

    ;(princ "Tempo de execução: ")
    ;(setq tempoDecorrido (get-internal-run-time))
    ;(terpri)
    ;(setq tempoDoLoop (- tempoDecorrido tempoDoLoop))
    ;(write tempoDoLoop)

    ;(with-open-file (str "runtime-bubblesort.csv"
    ;            :direction :output
    ;            :if-exists :append
    ;            :if-does-not-exist :create)
    ;    (format str "~d~%" tempoDoLoop)
    ;)

    (if (= i 100)
        (return)
    )
    (setf i (+ i 1))
    )
)



