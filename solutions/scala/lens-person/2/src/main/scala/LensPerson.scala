import java.time.LocalDate
import java.time.temporal.ChronoField
import monocle.syntax.all._

object LensPerson {
  case class Person(_name: Name, _born: Born, _address: Address)

  case class Name(_foreNames: String /*Space separated*/ , _surName: String)

  // Value of java.time.LocalDate.toEpochDay
  type EpochDay = Long

  case class Born(_bornAt: Address, _bornOn: EpochDay)

  case class Address(_street: String, _houseNumber: Int,
    _place: String /*Village / city*/ , _country: String)

  // Valid values of Gregorian are those for which 'java.time.LocalDate.of'
  // returns a valid LocalDate.
  case class Gregorian(_year: Int, _month: Int, _dayOfMonth: Int)

  // Implement these.

  val bornStreet: Born => String = b => b._bornAt._street

  def personStreet(p: Person) = p.focus(_._address._street)

  val setCurrentStreet: String => Person => Person = newStreet => person =>
    personStreet(person).replace(newStreet)

  val setBirthMonth: Int => Person => Person = newBirthMonth => person =>
    person.focus(_._born._bornOn).modify(LocalDate.ofEpochDay(_).
      `with`(ChronoField.MONTH_OF_YEAR, newBirthMonth).toEpochDay)

  // Transform both birth and current street names.
  val renameStreets: (String => String) => Person => Person = f => p =>
    personStreet(p.focus(_._born._bornAt._street).modify(f)).modify(f)
}
