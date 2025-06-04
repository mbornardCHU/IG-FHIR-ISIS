Profile: ISISPractitionerRole
Parent: fr-core-practitioner-role
Id: ISIS-practitioner-role
Title: "ISIS Practitioner Role Profile"
Description: "Profil pour le rôle des soignants, permettant de lier un numéro RPPS et d'afficher les rendez-vous associés."
* identifier 1..* MS
* identifier.system = "https://esante.gouv.fr/produits-services/repertoire-rpps" (exactly) 
* identifier.value 1..1
* practitioner 1..1
* code 1..1
* organization 1..1 MS
* availableTime 0..0 // la disponibilité est gérée par le service de prise de rendez-vous (les edts)
* notAvailable 0..0
* availableTime 0..0
//* code from http://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-practitioner-role (preferred)

Instance: PractitionerRoleAntoineDupont
InstanceOf: ISIS-practitioner-role
Usage: #example
* identifier.system = "https://esante.gouv.fr/produits-services/repertoire-rpps"
* identifier.value = "11122334455"
* practitioner = Reference(Practitioner/PractitionerAntoineDupont)
* code = https://mos.esante.gouv.fr/NOS/TRE_R21-Fonction/FHIR/TRE-R21-Fonction#FON-24 "Médecin de santé publique"
* organization = Reference(Organization/OrganizationExample1)

Instance: PractitionerRoleRomainNtamack
InstanceOf: ISIS-practitioner-role
Usage: #example
* identifier.system = "https://esante.gouv.fr/produits-services/repertoire-rpps"
* identifier.value = "22233445566"
* practitioner = Reference(Practitioner/PractitionerRomainNtamack)
* code = https://mos.esante.gouv.fr/NOS/TRE_R85-RolePriseCharge/FHIR/TRE-R85-RolePriseCharge#353 "Membre de l'équipe de soins"
* organization = Reference(Organization/OrganizationExample2)
