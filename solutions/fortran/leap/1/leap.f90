module leap
  implicit none

contains

  logical function divides(n, k)
    integer :: n
    integer :: k

    divides = mod(n, k) .eq. 0
  end function

  logical function is_leap_year(year)
    integer :: year

    is_leap_year = divides(year, 400) .or. (divides(year, 4) .and. (.not. divides(year, 100)))
  end function

end module

