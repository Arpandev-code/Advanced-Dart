// String? name;
// void main(List<String> args) {
//   if (name case final name?) {
//     doSomething(name);
//   }
// }

// void doSomething(String name) {
//   print(name);
// }

enum AcessType { admin, user, owner, denide }

void main(List<String> args) {
  final result = getAccess();
  print(result);
}

AcessType getAccess() {
  bool hasAcess = true;
  bool isOwner = false;

  return switch ((hasAcess, isOwner)) {
    (true, true) => AcessType.admin,
    (true, false) => AcessType.user,
    (_, _) => AcessType.denide,
  };
}
