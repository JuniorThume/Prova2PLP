Program bubble
    !USE PORTLIB
    implicit none
    real :: sorteio,x,y,ponto,valor_pi,aux1,aux2,ini,end,tempo
    integer :: dentro,fora,i,k
    dentro = 0
    fora = 0

    
   
    open(1,file='runtime_monteCarlo.txt',status = 'old')
    
    call rseed()
    do k = 0, 100
        CALL CPU_TIME(ini)
        do i = 0, 1000000 

            call random_number(sorteio)
            x=2*sorteio-1
            call random_number(sorteio)
            y=2*sorteio-1

            ponto = x*x + y*y

            if(ponto <=1) then
                dentro = dentro+1

            else
                fora=fora+1

            end if

        end do
        aux1=4*dentro
        aux2 = dentro+fora
        valor_pi = aux1/aux2
        
        CALL CPU_TIME(end)
        tempo = end-ini
        
        write(1,*) tempo*1000
    
    end do
    close(1)

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

end program bubble