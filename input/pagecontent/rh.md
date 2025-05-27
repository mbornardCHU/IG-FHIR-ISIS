# Guide de Conception et d'Implémentation des Profils FHIR

Ce document décrit les choix effectués pour la conception des profils FHIR `ISIS-Practitioner` et `MyPractitionerRole`, ainsi que les instructions pour leur implémentation dans un système de gestion des soignants et des rendez-vous.

## Contexte

Dans le cadre d’un projet de gestion des soignants et de leurs rendez-vous, nous avons créé deux profils FHIR pour répondre aux besoins spécifiques :

- **ISIS-Practitioner** : Profil pour représenter les soignants avec un identifiant RPPS obligatoire.
- **MyPractitionerRole** : Profil pour définir le rôle d’un soignant dans une organisation, lié à un identifiant RPPS.

Ces profils sont basés sur les standards FHIR R4 et s’appuient sur le package français `hl7.fhir.fr.core` pour garantir leur conformité avec les exigences françaises.

## Choix de Conception

### 1. Pourquoi ces profils ?

#### 1.1. Utilisation du package `hl7.fhir.fr.core`

- Nous avons choisi de baser nos profils sur les profils français `fr-core-practitioner` et `fr-core-practitioner-role` du package `hl7.fhir.fr.core` (version 1.1.0) pour assurer la conformité avec les standards nationaux, notamment pour l’utilisation des identifiants RPPS et des terminologies françaises.
- Ces profils parent fournissent une base solide pour représenter les professionnels de santé en France, incluant des contraintes spécifiques comme les systèmes d’identification et les ValueSets nationaux.

#### 1.2 Liens entre `Practitioner` et `PractitionerRole`


Dans notre modèle, un **Practitioner** (personne physique) peut avoir plusieurs **PractitionerRole** au cours de sa carrière :
<div style="text-align: center;">
  <img src="./exLienPrac.png" alt="Historique des rôles d’Antoine Dupont" style="display: block; margin: 0 auto; width: 600px;">
</div>

<p>On y voit son ancien poste d’interne, puis son rôle de chirurgien cardiologue et enfin de chef de service.</p>

<p>Ensuite, vue d’ensemble de la relation :</p>

<div style="text-align: center;">
  <img src="./lienPrac.png" alt="Relation Practitioner → PractitionerRole" style="display: block; margin: 0 auto; width: 600px;">
</div>

#### 1.3. Identifiant RPPS Obligatoire

- Les deux profils exigent un identifiant RPPS (`identifier` avec `system = "https://esante.gouv.fr/produits-services/repertoire-rpps"`) pour permettre une identification unique des soignants.
  - **Raison** : Le RPPS est le standard national pour identifier les professionnels de santé en France, garantissant l’interopérabilité avec d’autres systèmes de santé.
  - **Contrainte** : `identifier` est marqué comme Must Support (MS) avec une cardinalité de `1..*`, et `identifier.value` est obligatoire (`1..1`).

#### 1.4. Spécificités du Profil `ISIS-Practitioner`

- **Parent** : `fr-core-practitioner`.
- **Nom** : Exige un nom complet (`name 1..1`) avec `family` et `given` obligatoires pour garantir que les informations d’identification de base soient toujours présentes.
- **Télécommunications** : Exige au moins un contact (`telecom 1..* MS`) avec `system` et `value` obligatoires, Nous avons décidé de rendre l'email professionnel obligatoire car tous les praticiens doivent avoir une adresse MSSanté.
- **Raison** : Ces contraintes assurent que les informations minimales nécessaires pour identifier et contacter un soignant sont toujours disponibles.

#### 1.5. Spécificités du Profil `ISIS-PractitionerRole`

- **Parent** : `fr-core-practitioner-role`.
- **Organisation** : Exige une référence à une organisation (`organization 1..1 MS`)  afin de relier le soignant à son UF ou EJ de rattachement 
.
- **Rôle** : Exige un code de rôle (`code 1..1`) pour définir la fonction du soignant (ex. "Médecin généraliste", "Infirmier"). Nous avons utilisé les ValueSet définis par le FR Core pour être conformes aux exigences françaises. 
- **Disponibilité** : Les éléments `availableTime`, `notAvailable`, et `AvailableTime` ont été désactivés (`0..0`) car la gestion des disponibilités est déléguée à un service externe de prise de rendez-vous.
  - **Raison** : Simplifier le profil en évitant la redondance avec un système externe dédié à la gestion des agendas.

#### 1.6. Exemples

- Deux exemples ont été fournis pour chaque profil afin de démontrer leur utilisation :
  - `PractitionerAntoineDupont` et `PractitionerRomainNtamack` pour `ISIS-Practitioner`.
  - `PractitionerRoleAntoineDupont` et `PractitionerRoleRomainNtamack` pour `MyPractitionerRole`.
- Ces exemples utilisent des identifiants RPPS fictifs et des données réalistes pour illustrer des cas d’usage (médecin généraliste, infirmier).

