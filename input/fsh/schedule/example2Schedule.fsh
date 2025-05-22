// ===================================
// Exemple de Schedule (Secrétariat)
// ===================================

Instance:   SecretariatSchedule02
InstanceOf: FRSecretariatSchedule
Title:      "Exemple – Planning Prise de sang (secrétariat)"
Description: "Créneaux hebdomadaires du Dr Claude en salle 4."
Usage:      #example

* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value  = "schedule-prise-de-sang-dr-claude"

* serviceCategory.coding[0]
  * system  = "http://terminology.hl7.org/CodeSystem/service-category"
  * code    = #17  // « General Practice » (exemple générique)

* comment = "Créneaux ouverts par le secrétariat pour prise de sang."

// Acteurs
* actor[0] = Reference(Practitioner/practitioner-example)
* actor[1] = Reference(Location/location-example)

// Période couverte par le planning
* planningHorizon.start = "2025-06-12T08:00:00+02:00"
* planningHorizon.end   = "2025-06-16T18:00:00+02:00"