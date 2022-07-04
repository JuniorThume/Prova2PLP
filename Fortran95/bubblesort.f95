Program bubble
implicit none

integer, dimension(20) :: vet
integer :: i,n,aux,troca,j

do j=0,20
    vet(j)=20-j

end do

n=20
troca=1
print*,vet
do while(troca/=0)
    troca = 0
    do i=0,20
        
        if (vet(i) > vet(i+1)) then
           
            aux = vet(i)
            vet(i) = vet(i+1)
            vet(i+1) = aux
            troca = 1
        end if

    end do
end do
print*,vet
end program bubble