module bob
  implicit none
contains
  function hey(statement)
    character(100) :: hey
    character(len=*), intent(in) :: statement
    logical :: is_shouting, is_question, is_forceful_question, has_letters, is_blank

    is_question = scan(trim(statement), "?", .true.) == len(trim(statement))
    is_shouting = verify(statement, "ABCDEFGHIJKLMNOPQRSTUVWXYZ,0123456789 %^+-*/@#$()!") == 0
    is_forceful_question = verify(statement, "ABCDEFGHIJKLMNOPQRSTUVWXYZ ,?") == 0
    has_letters = scan(statement, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz") > 0
    is_blank = trim(statement) == ""

    if (is_blank) then
      hey = "Fine. Be that way!"
    elseif (is_forceful_question .and. is_question) then
      hey = "Calm down, I know what I'm doing!"
    elseif (is_shouting .and. has_letters) then
      hey = "Whoa, chill out!"
    elseif (is_question) then
      hey = "Sure."
    else
      hey = "Whatever."
    end if
  end function hey
end module bob
