Program bubble
    implicit none

    integer, dimension(20) :: vet
    integer :: i,n,aux,troca,j,aleatorio
    real :: x

    call rseed()

    do j=1,20
        ! gera um número aleatório
        call random_number(x)
        ! imprime na tela o número gerado
        aleatorio=x*1000+1
        vet(j)= aleatorio
    end do

    n=20
    troca=1
    print*,vet
    do while(troca/=0)
        troca = 0
        do i=1,20
            
            if (vet(i) > vet(i+1)) then
            
                aux = vet(i)
                vet(i) = vet(i+1)
                vet(i+1) = aux
                troca = 1
            end if

        end do
    end do
    print*,vet

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