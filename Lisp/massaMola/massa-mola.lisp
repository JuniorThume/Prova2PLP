
(defvar TMAX 100000.0)
(defvar dt 0.01)
(defvar x -1.0)
(defvar vx 0.0)

;não consegui criar vetores com o tam_vet como TMAX/dt

(setf vel (make-array '(10000000)))
(setf pos (make-array '(10000000)))
(defvar dx 0.0)
(defvar dvx 0.0)
(defvar u 0.0)  ; não consegui usar o "t" como variavel, usei o "u" no lugar
(defvar m 1.0)  ; creio que seja uma letra reservada da linguagem
(defvar k 1.0)
(defvar aux 0)
(defvar time 0)
(defvar i 0)


;limpa o arquivo csv
(with-open-file (str "resultados-massa-mola.csv"
                :direction :output
                :if-exists :supersede
                :if-does-not-exist :create)
        (format str "")
)


(defun massa_mola()

    (loop 
        (setf u (+ u dt))
        (setf dvx (* (* (- 0 (/ k m)) x) dt))
        (setf vx (+ vx dvx))
        (setf dx (* vx dt))
        (setf x (+ x dx))

        (setf aux (+ i 1))
        (setf (aref pos aux) x)
        (setf (aref vel i) vx)

        (with-open-file (output "resultados-massa-mola.csv" 
        :direction :output 
        :if-does-not-exist :create 
        :if-exists :append)

        (format output "~d " (aref pos i))
        (format output "~d~% " (aref vel i))
        )

        (when (= i 999999) (return))

        (setf i (+ i 1))

        
        
    )
    
)
(time
    (massa_mola)
)





