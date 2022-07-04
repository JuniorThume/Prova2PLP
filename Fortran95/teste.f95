program aleatorios
    implicit none

    integer :: i,n ! variável auxiliar
    real :: x    ! armazena o número pseudo-aleatório

    call rseed()

    do i=1,10
        ! gera um número aleatório
        call random_number(x)
        ! imprime na tela o número gerado
        n=x*1000+1
        print *,n
    end do

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
end program