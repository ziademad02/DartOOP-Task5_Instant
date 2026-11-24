import 'doctor.dart';
import 'person.dart';

class Patient extends Person {
  String? _patientId;
  Doctor? _doctor;

  Patient.guest({required super.name, required super.age,required this._patientId});

  set patientId(String value) {
    if (value.isNotEmpty) {
      _patientId = value;
    } else {
      print("there is no value in Pathient Id");
    }
  }

  String? get patientId => _patientId;

  bookAppointment(Doctor d) {
    _doctor = d;
  }

  @override
  displayInfo() {
    print("Patient Name: $name");
    print("Patient Age: $age");
    print("Patient ID: $_patientId");
    print("Assigned Doctor: $_doctor!.name");
  }
}
