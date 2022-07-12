

(defvar dt1 0.01)
(defvar dt2 0.001)



(defvar file1 "resultado-massa-mola0.01.csv")
(defvar file2 "resultado-massa-mola0.001.csv")

;limpa os arquivos csv
(with-open-file (str file1
                :direction :output
                :if-exists :supersede
                :if-does-not-exist :create)
        (format str "")
)

;limpa os arquivos csv
(with-open-file (str file2
                :direction :output
                :if-exists :supersede
                :if-does-not-exist :create)
        (format str "")
)


(defun massa_mola(dt file)
    (defvar x -1.0)
    (defvar vx 0.0)


    ;não consegui criar vetores com o tam_vet como TMAX/dt, inseri o valor manualmente
    (setf vel (make-array '(100000)))
    (setf pos (make-array '(100000)))
    (defvar dx 0.0)
    (defvar dvx 0.0)
    (defvar u 0.0)  ; não consegui usar o "t" como variavel, usei o "u" no lugar
    (defvar m 1.0)  ; creio que seja uma letra reservada da linguagem
    (defvar k 1.0)
    (defvar aux 0)
    (defvar time 0)
    (defvar i 0)

    (setf i 0)
    
    (loop 
        (when (= i 99999) (return))

        (setf dvx (* (* (- 0 (/ k m)) x) dt))
        (setf vx (+ vx dvx))
        (setf dx (* vx dt))
        (setf x (+ x dx))

        (setf aux (+ i 1))
        (setf (aref pos aux) x)
        (setf (aref vel i) vx)

        (with-open-file (str file
        :direction :output 
        :if-does-not-exist :create 
        :if-exists :append)

        (format str "~d " (aref pos i))
        (format str "~d~% " (aref vel i))
        )

        (setf u (+ u dt))
        (setf i (+ i 1))
    )
    
)

(terpri)
(princ "Dt 0.01:")
(time
    (massa_mola dt1 file1)
)

(terpri)
(princ "Dt 0.001:")
(time
    (massa_mola dt2 file2)
)








