# Projet FHIR : Ressources PatientINS et PatientProfile

## Objectif du Projet

L'objectif de ce Projet était d'étudier et de personnaliser deux ressources FHIR liées à l'identité des patients :
- `PatientINS`, qui repose sur l'identité nationale de santé (INS)
- Un profil FHIR personnalisé `PatientProfile`, adapté à notre cas d'usage

## Ressources étudiées

### 1. PatientINS

Cette ressource est basée sur le profil **FR-Patient** de l'ANS (Agence du Numérique en Santé), enrichi des contraintes de l'identifiant national de santé (INS).

#### Modifications apportées

- Suppression de tous les éléments associés aux profils de test suivants :
  - [INS-NIR-TEST]
  - [INS-NIR-DEMO]

Ces profils sont uniquement utilisés pour les environnements de test et de démonstration. Ils ne sont pas pertinents dans le cadre d’un déploiement en production ou d’une utilisation réelle avec des données patient valides.

#### Création du profil personnalisé : INS-NIR-Limace

Nous avons défini un profil INS spécifique nommé **INS-NIR-Limace**, destiné à l'identification des limaces dans un contexte fictif ou expérimental.  
Ce profil ajoute une nouvelle valeur possible pour le champ `gender` : **limace**.


### Contraintes sur PatientProfile

1. Contraindre la présence et le format du **numéro de téléphone mobile** (au format français international).
2. Rendre obligatoire la **langue préférée du patient**.


// Contraintes sur le numéro de téléphone
* telecom.value ^pattern = "\\+33[0-9]{9}" // Numéro français international avec 9 chiffres après +33
* telecom.value ^short = "Doit commencer par +33 suivi de 9 chiffres (ex. +33612345678)"
* telecom.system 1..1
* telecom.system = #phone

// Contraintes sur la langue préférée
* communication 1..* // Au moins une entrée obligatoire
* communication.language 1..1 // Le langage doit être spécifié
* communication.language from http://hl7.org/fhir/ValueSet/language (required)
* communication.language.coding 1..1
* communication.language.coding.system = "urn:ietf:bcp:47"
* communication.language.coding.code = #fr
* communication.language.coding.display = "French"
* communication.language.coding ^short = "Langue obligatoirement définie sur 'fr' pour le français"