// ===================================
// Exemple de Slot (Secrétariat)
// ===================================

Instance:   SecretariatSlot01
InstanceOf: FRSecretariatSlot
Title:      "Exemple – Créneau ORL disponible"
Description: "Créneau ORL le 14/05/2025 de 09 h 00 à 09 h 30, publié par le secrétariat."
Usage:      #example

* schedule = Reference(SecretariatSchedule01)  // planning défini dans l’exemple Schedule
* status   = #free
* start    = "2025-05-14T09:00:00+02:00"
* end      = "2025-05-14T09:30:00+02:00"