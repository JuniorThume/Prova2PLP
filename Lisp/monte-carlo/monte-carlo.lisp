

(defvar cont 0)
(defvar dentro 0)
(defvar fora 0)
(defvar sorteio 0.0)
(defvar x 0.0)
(defvar y 0.0)
(defvar ponto 0.0)
(defvar aux1 0.0)
(defvar aux2 0.0)
(defvar valor_pi 0.0)

(loop 

    (setf sorteio (random 1.0))
    (write sorteio)
    (terpri)

    (setf x (- (* 2 sorteio ) 1))

    (setf sorteio (random 1.0))
    (write sorteio)
    (terpri)
    
    (setf y (- (* 2 sorteio ) 1))


    (setf ponto (+ (* x x) (* y y)))

    (if (<= ponto 1)
        (setf dentro (+ dentro 1))    
    )
    (if (> ponto 1)
        (setf fora (+ fora 1))
    )

    (if (= cont 10000) (return))
    (setf cont (+ cont 1))
)

(setf aux1 (* 4 dentro))

(setf aux2 (+ dentro fora))

(setf valor_pi (/ aux1 aux2))

(princ "Valor simulado de pi: ")
(write valor_pi)