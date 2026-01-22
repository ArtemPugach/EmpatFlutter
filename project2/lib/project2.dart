mixin HelloMixin {
  void hello() {
    print("Привіт!");
  }
}

class User with HelloMixin {
  String name;
  int age;

  User(this.name, this.age) {
    assert(age >= 0, "Вік не може бути від'ємним");
  }

  User.withDefault({this.name = "Анонім", this.age = 18});

  factory User.factory(String data) {
    var parts = data.split(":");
    return User(parts[0], int.parse(parts[1]));
  }
}

Function createCounter() {
  int count = 0;
  return () => ++count;
}

void runProject2() {
  String? nickname;
  nickname ??= "NoName";
  print("Нік: $nickname");

  var counter = createCounter();
  print(counter());
  print(counter());

  List<String> list = ["Apple", "Orange"];
  Set<int> set = {1, 2, 2, 3};
  Map<String, int> map = {"math": 90, "biology": 100};

  print(list);
  print(set);
  print(map);

  var u1 = User("Artem", 19);
  u1.hello();

  var u2 = User.withDefault();
  print("${u2.name}, ${u2.age}");

  var u3 = User.factory("Max:20");
  print("${u3.name}, ${u3.age}");
}
