

(defvar cont 0)
(defvar dentro 0)
(defvar fora 0)
(defvar sorteio 0.0)
(defvar x 0.0)
(defvar y 0.0)
(defvar ponto 0.0)
(defvar valor_pi 0.0)
(defvar tempoDecorrido 0)
(defvar tempoDoLoop 0)
(defvar outroCont 0)

;limpa o arquivo csv
(with-open-file (str "runtime-montecarlo.csv"
                :direction :output
                :if-exists :supersede
                :if-does-not-exist :create)
        (format str "")
)
;limpa o arquivo csv
(with-open-file (str "resultados-montecarlo.csv"
                :direction :output
                :if-exists :supersede
                :if-does-not-exist :create)
        (format str "")
)

;(time
    ;(loop
        (loop 

            (setf *random-state* (make-random-state t))
            (setf sorteio (random 1.0))

            (setf x (- (* 2 sorteio ) 1))
            

            (setf *random-state* (make-random-state t))
            (setf sorteio (random 1.0))

            (setf y (- (* 2 sorteio ) 1))


            (setf ponto (+ (* x x) (* y y)))

            (if (<= ponto 1)
                (setf dentro (+ dentro 1))    
            )
            (if (> ponto 1)
                (setf fora (+ fora 1))
            )

            (setf cont (+ cont 1))
            (if (= cont 1000000) (return))
        )

        (setf fora (- fora 1.0)); denominador fica em 100001

        (setf valor_pi (/ (* 4 dentro) (+ dentro fora)))


        (setq tempoDecorrido (get-internal-run-time))
        (setq tempoDoLoop (- tempoDecorrido tempoDoLoop))

        (with-open-file (str "runtime-montecarlo.csv"
                        :direction :output
                        :if-exists :append
                        :if-does-not-exist :create)
                (format str "~d~%" tempoDoLoop)
        )
        (with-open-file (str "resultados-montecarlo.csv"
                        :direction :output
                        :if-exists :append
                        :if-does-not-exist :create)
                (format str "~d~%" valor_pi)
        )

        ;(setf outroCont (+ outroCont 1))
        ;(if (= outroCont 1000) (return))

    ;)
;)
