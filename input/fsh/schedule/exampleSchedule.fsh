// ===================================
// Exemple de Schedule (Secrétariat)
// ===================================

Instance:   SecretariatSchedule01
InstanceOf: FRSecretariatSchedule
Title:      "Exemple – Planning ORL (secrétariat)"
Description: "Créneaux hebdomadaires du Dr Martin en salle ORL 1."
Usage:      #example

* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value  = "schedule-orl-dr-martin"

* serviceCategory.coding[0]
  * system  = "http://terminology.hl7.org/CodeSystem/service-category"
  * code    = #17          // « General Practice » (exemple générique)

* comment = "Créneaux ouverts par le secrétariat pour consultation ORL."

// Acteurs
* actor[0] = Reference(Practitioner/practitioner-example)
* actor[1] = Reference(Location/location-example)

// Période couverte par le planning
* planningHorizon.start = "2025-05-12T08:00:00+02:00"
* planningHorizon.end   = "2025-05-16T18:00:00+02:00"