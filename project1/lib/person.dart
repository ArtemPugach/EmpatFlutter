class Person {
  String _firstName;
  String _lastName;

  Person({required String firstName, required String lastName})
      : _firstName = firstName,
        _lastName = lastName;

  String get firstName => _firstName;
  String get lastName => _lastName;

  set firstName(String value) => _firstName = value;
  set lastName(String value) => _lastName = value;

  String get fullName => "$_firstName $_lastName";
}
