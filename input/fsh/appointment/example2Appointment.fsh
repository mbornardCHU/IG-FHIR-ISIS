// ====================================
// Exemple de rendez-vous Secrétariat
// ====================================

Alias: AppointmentOperatorExtURL = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-appointment-operator

Instance:   SecretariatAppointment02
InstanceOf: FRSecretariatAppointment
Title:      "Exemple – Rendez-vous Prise de sang créé par le secrétariat"
Description: "Prise de sang le 14/06/2025 de 09 h 00 à 09 h 30."

* status = #proposed
* description = "Prise de sang"
* start = "2025-06-14T09:00:00+02:00"
* end   = "2025-06-14T09:30:00+02:00"

// Participants
* participant[0].actor    = Reference(Patient/patient-example)
* participant[0].required = #required
* participant[0].status   = #accepted

* participant[1].actor    = Reference(Practitioner/practitioner-example)
* participant[1].required = #required
* participant[1].status   = #accepted

* participant[2].actor    = Reference(Location/location-example)
* participant[2].required = #required
* participant[2].status   = #accepted