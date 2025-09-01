module hamming
  implicit none
contains
  function compute(strand1, strand2, distance)
      character(*) :: strand1, strand2
      integer :: distance, n
      logical :: compute
      distance = 0
      compute = len(strand1) == len(strand2)
      if (compute) then
          do n = 1, len(strand1)
              if (strand1(n:n) /= strand2(n:n)) distance = distance + 1
          end do
      end if
  end function compute
end module hamming
