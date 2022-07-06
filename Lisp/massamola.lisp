
(defvar TMAX 100.0)
(defvar dt 0.001)
(defvar x -1.0)
(defvar vx 0.0)
(defvar tam_vet (/ TMAX dt))
(setf vel (make-array '(tam_vet)))
(setf pos (make-array '(tam_vet)))
(defvar dx 0.0)
(defvar dvx 0.0)
(defvar t 0.0)
(defvar m 1.0)
(defvar k 1.0)
(defvar aux 0)
(defvar time 0)


(defun massa_mola()

    (loop for i from t to (< t TMAX)
        (setf t (+ t dt))
        (setf dvx (* (* (- (/ k m)) x) dt))
        (setf vx (+ vx dvx))
        (setf dx (* vx dt))
        (setf x (+ x dx))

        (setf aux (+ i 1))
        (setf (aref pos aux) x)
        (setf (aref vel i) vx)
        
    )

    (with-open-file (output "tempo.txt" 
        :direction :output 
        :if-does-not-exist :create 
        :if-exists :append)

        (format output  )
    )
    
)

(setf time (get-internal-run-time))