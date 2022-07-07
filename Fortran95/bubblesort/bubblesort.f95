Program bubble
    !USE PORTLIB
    implicit none
    integer :: i,n,aux,troca,j,aleatorio,k
    integer, dimension(1000) :: vet
    real :: x,ini,end,media,tempo
    n=1000
    ini=0.00
    end=0.00
    tempo=0.0
    media=0.0

    open(1,file='runtime_bubbleSort.txt',status = 'old')

    do k = 1, 1000
        
        troca=1

        CALL CPU_TIME(ini)
        call rseed()
        
        do j=1,n
    
            call random_number(x)
            aleatorio=x*10000+1
            vet(j)= aleatorio
        end do

        do while(troca/=0)
            troca = 0
            do i=1,n
                
                if (vet(i) > vet(i+1)) then
                    aux = vet(i)
                    vet(i) = vet(i+1)
                    vet(i+1) = aux
                    troca = 1
                
                end if
            end do
        end do
    
        CALL CPU_TIME(end)
        !print*,'end -> ',end
        !print*,'ini -> ',ini
        tempo = end-ini !Segundos
       ! print*,k,' end-ini ->',end-ini

        write(1,"(f6.4)") tempo
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