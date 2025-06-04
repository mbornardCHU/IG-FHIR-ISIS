// ===================================
// Exemple de Slot (Secrétariat)
// ===================================

Instance:   SecretariatSlot02
InstanceOf: FRSecretariatSlot
Title:      "Exemple – Prise de sang disponible"
Description: "Créneau prise de sang le 14/06/2025 de 09 h 00 à 09 h 30, publié par le secrétariat."
Usage:      #example

* schedule = Reference(SecretariatSchedule01)  // planning défini dans l’exemple Schedule
* status   = #free
* start    = "2025-06-14T09:00:00+02:00"
* end      = "2025-06-14T09:30:00+02:00"