Extension: FRCoreObservationLevelOfExertionExtension
Id: fr-core-observation-level-of-exertion
Title: "FR Core Observation Level Of Exertion Extension"
Description: "Extension française définie dans le contexte du profil Vital Signs Resprate. Cette extension permet de préciser le niveau d'exercice du patient durant la mesure de la fréquence respiratoire (au repos, pendant l'effort, après l'effort).\r\nFrench extension defined in the context of the Vital Signs Resprate profile. This extension is used to define the level of exertion ( at rest, during exertion, post exertion) during the respiratory rate measure"
* ^context.type = #element
* ^context.expression = "Observation"
* value[x] only CodeableConcept // TODO : binding à définir