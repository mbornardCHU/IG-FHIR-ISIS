Profile: ISISPractitioner
Parent: fr-core-practitioner
Id: ISIS-practitioner
Title: "My Practitioner Profile"
Description: "Profil pour les soignants, incluant un identifiant RPPS obligatoire pour associer un soignant à ses rendez-vous."
* identifier 1..* MS
* identifier.system = "https://esante.gouv.fr/produits-services/repertoire-rpps" (exactly) 
* identifier.value 1..1
* name 1..1
* name.family 1..1
* name.given 1..1
* telecom ^slicing.discriminator[0].type = #value
* telecom ^slicing.discriminator[0].path = "system"
* telecom ^slicing.discriminator[1].type = #value
* telecom ^slicing.discriminator[1].path = "use"
* telecom ^slicing.rules = #open

* telecom contains
    email 1..* and
    phonePro 1..* and
    other 0..*

* telecom[email].system = #email
* telecom[email].value 1..

* telecom[phonePro].system = #phone
* telecom[phonePro].use = #work
* telecom[phonePro].value 1..

* telecom[other].system 1..
* telecom[other].value 1..


Instance: PractitionerAntoineDupont
InstanceOf: ISIS-practitioner
Usage: #example
* identifier.system = "https://esante.gouv.fr/produits-services/repertoire-rpps"
* identifier.value = "11122334455"
* name.family = "Dupont"
* name.given = "Antoine"
* telecom[phonePro].system = #phone
* telecom[phonePro].use = #work
* telecom[phonePro].value = "+33561611611"
* telecom[email].system = #email
* telecom[email].value = "antoine.dupont@stadeToulousain.fr"


Instance: PractitionerRomainNtamack
InstanceOf: ISIS-practitioner
Usage: #example
* identifier.system = "https://esante.gouv.fr/produits-services/repertoire-rpps"
* identifier.value = "22233445566"
* name.family = "Ntamack"
* name.given = "Romain"
* telecom[phonePro].system = #phone
* telecom[phonePro].use = #work
* telecom[phonePro].value = "+33561611777"
* telecom[email].system = #email
* telecom[email].value = "romain.ntamack@stadeToulousain.fr"
