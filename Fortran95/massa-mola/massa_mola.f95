Program massa_mola
    !USE PORTLIB
    !Somar no max , a quantidade q irá faltar

    implicit none
    integer, parameter :: Largereal_K = selected_real_kind (1,307)
    real(kind=Largereal_K) :: tempo
    integer :: i,n,aux,contador,j,aleatorio,r
    real :: x,vx,dx,dvx,t,m,k,TMAX
    real :: ini,end,media
    real :: dt,teste
    real, dimension(1000000) :: vel_01
    real, dimension(1000000) :: pos_01

    real, dimension(10000000) :: vel_001
    real, dimension(10000000) :: pos_001

    real, dimension(100000000) :: vel_00001
    real, dimension(100000000) :: pos_00001
    
    TMAX = 1000000.0
    contador=0
    ini=0.00
    end=0.00
    tempo=0.0
    media=0.0
    i=0
    
    

    


    do i=0,2
        
        j=-1
        x = -1.0
        vx = 0.0
        m = 1.0
        k = 1.0
        t=0.0
        

        if(i ==0 ) then
            CALL CPU_TIME(ini)
            call rseed()
                dt=1.01
                do while(contador==0)
                    
                    dvx = -(k/m)*x*dt
                    vx = vx+dvx
                    dx = vx*dt
                    x = x+dx
                    j = j+1
                    pos_01(j)=x
                    vel_01(j)=vx
                    t = t+dt
                    
                    if(t >= TMAX) then
                        contador = contador+1
                        exit
                    end if

                    
                
                end do
            
            CALL CPU_TIME(end)  
            
            tempo = end - ini
            print*,"1"
            print "(f6.4)", tempo ! Segundos
            media = media +tempo
        

        else if(i == 1) then
            
            CALL CPU_TIME(ini)
            call rseed()
                dt=1.01
                do while(contador==0)
                    
                    dvx = -(k/m)*x*dt
                    vx = vx+dvx
                    dx = vx*dt
                    x = x+dx
                    j = j+1
                    pos_001(j)=x
                    vel_001(j)=vx
                    t = t+dt
                    
                    if(t >= TMAX) then
                        contador = contador+1
                        exit
                    end if

                    
                
                end do
            
            CALL CPU_TIME(end)  


            tempo = end - ini
            print*,"3"
            print "(f6.4)", tempo ! Segundos
            media = media +tempo

        else if(i == 2) then

            CALL CPU_TIME(ini)
            call rseed()
                dt=1.01
                do while(contador==0)
                    
                    dvx = -(k/m)*x*dt
                    vx = vx+dvx
                    dx = vx*dt
                    x = x+dx
                    j = j+1
                    pos_00001(j)=x
                    vel_00001(j)=vx
                    t = t+dt
                    
                    if(t >= TMAX) then
                        contador = contador+1
                        exit
                    end if

                    
                
                end do
            
            CALL CPU_TIME(end)  
            
            
            tempo = end - ini
            print*,"2"
            print "(f6.4)", tempo ! Segundos
            media = media +tempo
        
        end if
        
       
    end do
    print*,'Media do tempo ', media/3

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