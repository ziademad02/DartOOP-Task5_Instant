import 'person.dart';

class Doctor extends Person {
  final String specialization;
  Doctor({required super.name,required super.age,required this.specialization});

  @override
  displayInfo() {
    print("the name of doctor= $name");
    print("the name of doctor= $age");
    print("the name of doctor= $specialization");
  }

  
}
