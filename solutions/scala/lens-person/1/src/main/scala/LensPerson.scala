import java.time.LocalDate
import java.time.temporal.{ChronoField, TemporalField}

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

  val bornStreet: Born => String = _._bornAt._street

  val setCurrentStreet: String => Person => Person = newStreet => person =>
    person.copy(
      _address = person._address.copy(
        _street = newStreet))

  val setBirthMonth: Int => Person => Person = newBirthMonth => person =>
    person.copy(_born = person._born.copy(
      _bornOn = LocalDate.ofEpochDay(person._born._bornOn).`with`(ChronoField.MONTH_OF_YEAR, newBirthMonth)
        .toEpochDay
    ))

  // Transform both birth and current street names.
  val renameStreets: (String => String) => Person => Person = f => p =>
    p.copy(_born = p._born.copy(_bornAt = p._born._bornAt.copy(_street = f(p._born._bornAt._street))))
      .copy(_address = p._address.copy(_street = f(p._address._street)))
}
