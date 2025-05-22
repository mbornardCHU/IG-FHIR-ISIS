// ====================================
// Exemple de rendez-vous Secrétariat
// ====================================

Alias: AppointmentOperatorExtURL = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-appointment-operator

Instance:   SecretariatAppointment01
InstanceOf: FRSecretariatAppointment
Title:      "Exemple – Rendez-vous ORL créé par le secrétariat"
Description: "Consultation ORL le 14/05/2025 de 09 h 00 à 09 h 30."
Usage:      #example

* status = #booked
* description = "Consultation ORL"
* start = "2025-05-14T09:00:00+02:00"
* end   = "2025-05-14T09:30:00+02:00"

// Participants (ordre arbitraire, pas de slicing requis)
* participant[0].actor    = Reference(Patient/patient-example)
* participant[0].required = #required
* participant[0].status   = #accepted

* participant[1].actor    = Reference(Practitioner/practitioner-example)
* participant[1].required = #required
* participant[1].status   = #accepted

* participant[2].actor    = Reference(Location/location-example)
* participant[2].required = #required
* participant[2].status   = #accepted

// Extension : secrétaire à l’origine du rendez-vous
* extension[appointmentOperator].url = AppointmentOperatorExtURL
* extension[appointmentOperator].valueReference = Reference(Organization/secretariat-example)