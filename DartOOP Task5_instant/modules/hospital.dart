
import 'doctor.dart';
import 'patient.dart';

class Hospital {
  List<Doctor> doctors = [];
  List<Patient> patients = [];

  // Add Doctor
  void addDoctor(Doctor d) {
    doctors.add(d);
    print("Doctor added successfully");
  }

  // Add Patient
  void addPatient(Patient p) {
    if (p.patientId == null || p.patientId!.trim().isEmpty) {
      print("Invalid Patient ID");
      return;
    }

    for (var patient in patients) {
      if (patient.patientId == p.patientId) {
        print("Patient ID already exists");
        return;
      }
    }

    patients.add(p);
    print("Patient added successfully");
  }

  void displayDoctors() {
    if (doctors.isEmpty) {
      print("No doctors available");
      return;
    }

    for (var doctor in doctors) {
      doctor.displayInfo();
      print("----------------");
    }
  }

  void displayPatients() {
    if (patients.isEmpty) {
      print("No patients available");
      return;
    }
    for (var patient in patients) {
      patient.displayInfo();
      print("...................");
    }
  }

  void bookAppointment(String patientId, String doctorName) {
    Patient? selectedPatient;
    Doctor? selectedDoctor;

    for (var patient in patients) {
      if (patient.patientId == patientId) {
        selectedPatient = patient;
        break;
      }
    }

    for (var doctor in doctors) {
      if (doctor.name.toLowerCase() ==
          doctorName.toLowerCase()) {
        selectedDoctor = doctor;
        break;
      }
    }

    if (selectedPatient == null) {
      print("Patient ID not found");
      return;
    }

    if (selectedDoctor == null) {
      print("Doctor name not found");
      return;
    }

    selectedPatient.bookAppointment(selectedDoctor);

    print("Appointment booked successfully");
  }
}
