import 'dart:io';

import 'modules/doctor.dart';
import 'modules/hospital.dart';
import 'modules/patient.dart';

void main() {
  Hospital hospital = Hospital();
  bool running = true;

  while (running) {
    print("\n===== Hospital Management System =====");
    print("1. Add Doctor");
    print("2. Add Patient");
    print("3. Display Doctors");
    print("4. Display Patients");
    print("5. Book Appointment");
    print("6. Exit");
    print("\nChoose an option: ");

    String? choice = stdin.readLineSync();
    switch (choice) {
      case "1":
        print("Enter Doctor Name: ");
        String name = stdin.readLineSync()?.trim() ?? "";

        if (name.isEmpty) {
          print("Doctor name cannot be empty");
          break;
        }
        print("Enter Doctor Age: ");
        int? age = int.tryParse(stdin.readLineSync() ?? "");
        if (age == null || age <= 0) {
          print("Invalid Doctor Age");
          break;
        }
        print("Enter Specialization: ");
        String specialization = stdin.readLineSync()?.trim() ?? "";
        if (specialization.isEmpty) {
          print("Specialization cannot be empty");
          break;
        }
        Doctor doctor = Doctor(name: name,age: age,  specialization: specialization);
        hospital.addDoctor(doctor);
        break;

      case "2":
        print("Enter Patient Name: ");
        String name = stdin.readLineSync()?.trim() ?? "";

        if (name.isEmpty) {
          print("Patient name cannot be empty");
          break;
        }

        print("Enter Patient Age: ");
        int? age = int.tryParse(stdin.readLineSync() ?? "");

        if (age == null || age <= 0) {
          print("Invalid Patient Age");
          break;
        }
        print("Enter Patient ID: ");
        String id = stdin.readLineSync()?.trim() ?? "";
        if (id.isEmpty) {
          print("Patient ID cannot be empty");
          break;
        }

        Patient patient = Patient.guest(name: name, age: age, patientId: id);

        hospital.addPatient(patient);
        break;

      case "3":
        hospital.displayDoctors();
        break;

      case "4":
        hospital.displayPatients();
        break;

      case "5":
        print("Enter Patient ID: ");
        String patientId = stdin.readLineSync()?.trim() ?? "";

        print("Enter Doctor Name: ");
        String doctorName = stdin.readLineSync()?.trim() ?? "";

        if (patientId.isEmpty || doctorName.isEmpty) {
          print("Patient ID and Doctor Name cannot be empty");
          break;
        }

        hospital.bookAppointment(patientId, doctorName);
        break;

      case "6":
        running = false;
        print("Thank you for using Hospital Management System");
        break;
      default:
        print("Invalid choice, please try again");
    }
  }
}
