Program massa_mola
    !USE PORTLIB
    !Somar no max , a quantidade q irá faltar

    implicit none
    integer, parameter :: Largereal_K = selected_real_kind (18,307)
    real(kind=Largereal_K) :: comparador
    integer :: i,n,aux,contador,j,aleatorio,r, l
    real :: x,vx,dx,dvx,t,m,k,TMAX
    real :: ini,end
    real,dimension(2) :: dt
    real,dimension(3) :: tempo
    real :: vel
    real :: pos
    dt(1)= 1
    dt(2)= 1
   
    TMAX = 1000000.0
    contador=0
    ini=0.00
    end=0.00
    tempo=0.0
  
    i=0
    
    
    open(1,file='runtime_massaMola01.csv',status = 'old')
    open(2,file='runtime_massaMola001.csv',status='old')
    
    do i=1,2
    
        j=-1
        x = -1.0
        vx = 0.0
        m = 1.0
        k = 1.0
        t=0.0
        
        if(i==1) then
            
            do r=1,100
                comparador =TMAX*100.0
                CALL CPU_TIME(ini)
                call rseed()
                
                do l = 1,10000000   
                    dvx = -(k/m)*x*dt(i)
                    vx = vx+dvx
                    dx = vx*dt(i)
                    x = x+dx
                    pos=x
                    vel=vx
                    !print*,pos
                   !print*,vel
                    t = t+1
                        
                    if(t >= comparador) then
                        exit
                    end if

                end do
                
                CALL CPU_TIME(end)
                tempo = end - ini
                
                write(1,*) tempo*1000   !-Milissegundos
            end do
        
        else if (i==2) then
            
            do r=1,100
                comparador = TMAX*1000
                CALL CPU_TIME(ini)
                call rseed()

               do l = 1,100000000
                        
                    dvx = -(k/m)*x*dt(i)
                    vx = vx+dvx
                    dx = vx*dt(i)
                    x = x+dx
                    pos=x
                    vel=vx
                    t = t+1
                        
                    if(t >= comparador) then
                        exit
                    end if

                end do
                
                CALL CPU_TIME(end) 
                tempo = end - ini
                write(2,*) tempo*1000    !-Milissegundos
            
            end do
        
        end if
     
    end do
    close(1)
    close(2)

contains

    subroutine rseed()
        implicit none
        ! lista de valores para geração da semente
        integer, allocatable, dimension(:) :: seq
        ! quantidade de valores de seq
        ! e tempo no relógio interno
        integer :: n, time
        ! lê tempo no relógio interno do computador
        call system_clock(time)
        ! determina a quantidade de parâmetros necessários
        call random_seed(size=n)
        ! aloca dinamicamente o espaço para a lista
        allocate(seq(n))
        ! preenche a lista linearmente
        seq = mod(time,1231)+11*[(i,i=1,n)]
        ! carrega a sequência
        call random_seed(put=seq)
        ! libera a memória
        deallocate(seq)
    end subroutine

end program massa_mola