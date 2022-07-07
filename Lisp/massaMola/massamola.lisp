
(defvar TMAX 100.0)
(defvar dt 0.001)
(defvar x -1.0)
(defvar vx 0.0)

;(defvar tam_vet 100000)
;(setf tam_vet (/ TMAX dt))
;não consegui criar vetores com o tam_vet como TMAX/dt

(setf vel (make-array '(100)))
(setf pos (make-array '(100)))
(defvar dx 0.0)
(defvar dvx 0.0)
(defvar u 0.0)
(defvar m 1.0)
(defvar k 1.0)
(defvar aux 0)
(defvar time 0)
(defvar i 0)


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

        (setf i (+ i 1))

        (when (>= u TMAX) (return 0))
        
    )

    (with-open-file (output "resultados-massa-mola.txt" 
        :direction :output 
        :if-does-not-exist :create 
        :if-exists :append)

        ;(print '(Exemplo de saida) output)
    )
    
)

(massa_mola)

(setf time (get-internal-run-time))
    
(with-open-file (output "runtime-massa-mola.txt" 
    :direction :output 
    :if-does-not-exist :create 
    :if-exists :append)

    ;(format output time)
)

