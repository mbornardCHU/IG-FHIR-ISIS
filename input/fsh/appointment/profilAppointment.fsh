// ==============================
//  Secrétariat – Profil Appointment (sans slicing)
// ==============================


Profile: FRSecretariatAppointment
Parent:  FRCoreAppointmentProfile
Id:      fr-secretariat-appointment
Title:   "FR Secretariat Appointment"
Description: """
Rendez-vous créé par le secrétariat hospitalier ; il doit comporter
au moins un patient, un praticien et une salle de l’hôpital.
"""

//------------------------------------
// Contraintes cardinalitaires simples
//------------------------------------
* status 1..1 MS
* start  1..1 MS
* end    1..1 MS
* participant 3..* MS   // pas de slicing


//------------------------------------
// Invariants FHIRPath
//------------------------------------
* obeys sec-one-patient       // ≥1 Patient
* obeys sec-one-practitioner  // ≥1 Practitioner
* obeys sec-one-location      // ≥1 Location

Invariant: sec-one-patient
Description: "Au moins un participant doit référencer un Patient."
Severity: #error
Expression: "participant.actor.resolve().ofType(Patient).exists()"

Invariant: sec-one-practitioner
Description: "Au moins un participant doit référencer un Practitioner."
Severity: #error
Expression: "participant.actor.resolve().ofType(Practitioner).exists()"

Invariant: sec-one-location
Description: "Au moins un participant doit référencer une Location."
Severity: #error
Expression: "participant.actor.resolve().ofType(Location).exists()"