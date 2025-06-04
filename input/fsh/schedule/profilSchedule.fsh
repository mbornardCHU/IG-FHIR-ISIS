// ==============================
// Secrétariat – Profil Schedule
// ==============================

Profile: FRSecretariatSchedule
Parent:  FRCoreScheduleProfile
Id:      fr-secretariat-schedule
Title:   "FR Secretariat Schedule"
Description: """
Planning publié par le secrétariat hospitalier ; il doit comporter
au moins un praticien et une salle (= Location) associés.
"""

//------------------------------------
// Contraintes cardinalitaires simples
//------------------------------------
* actor 2..* MS
* planningHorizon 1..1 MS
* planningHorizon.start 1..1
* planningHorizon.end   1..1

//------------------------------------
// Invariants FHIRPath (aucun slicing)
//------------------------------------
* obeys sch-one-practitioner
* obeys sch-one-location

Invariant: sch-one-practitioner
Description: "Au moins un acteur doit être un Practitioner."
Severity: #error
Expression: "actor.resolve().ofType(Practitioner).exists()"

Invariant: sch-one-location
Description: "Au moins un acteur doit être une Location."
Severity: #error
Expression: "actor.resolve().ofType(Location).exists()"