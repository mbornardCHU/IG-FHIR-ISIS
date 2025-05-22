// ==============================
// Secrétariat – Profil Slot
// ==============================

Profile: FRSecretariatSlot
Parent:  FRCoreSlotProfile
Id:      fr-secretariat-slot
Title:   "FR Secretariat Slot"
Description: """
Créneau individuel publié par le secrétariat hospitalier ; il doit référencer
un planning (Schedule) du secrétariat et indiquer clairement la période
de disponibilité.
"""

//------------------------------------
// Contraintes cardinalitaires simples
//------------------------------------
* schedule 1..1 MS
* schedule only Reference(FRSecretariatSchedule)

* status 1..1 MS
* start  1..1 MS
* end    1..1 MS

//------------------------------------
// Invariant FHIRPath (facultatif mais utile)
//------------------------------------
* obeys slo-status-open

Invariant: slo-status-open
Description: "Le statut d’un créneau public doit être 'free' ou 'busy-tentative'."
Severity: #warning
Expression: "status = 'free' or status = 'busy-tentative'"