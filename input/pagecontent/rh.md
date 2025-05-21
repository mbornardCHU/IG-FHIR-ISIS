# Guide de Conception et d'Implémentation des Profils FHIR

Ce document décrit les choix effectués pour la conception des profils FHIR `ISIS-Practitioner` et `MyPractitionerRole`, ainsi que les instructions pour leur implémentation dans un système de gestion des soignants et des rendez-vous.

## Contexte

Dans le cadre d’un projet de gestion des soignants et de leurs rendez-vous, nous avons créé deux profils FHIR pour répondre aux besoins spécifiques :

- **ISIS-Practitioner** : Profil pour représenter les soignants avec un identifiant RPPS obligatoire.
- **MyPractitionerRole** : Profil pour définir le rôle d’un soignant dans une organisation, lié à un identifiant RPPS et à des rendez-vous.

Ces profils sont basés sur les standards FHIR R4 et s’appuient sur le package français `hl7.fhir.fr.core` pour garantir leur conformité avec les exigences françaises.

## Choix de Conception

### 1. Pourquoi ces profils ?

#### 1.1. Utilisation du package `hl7.fhir.fr.core`

- Nous avons choisi de baser nos profils sur les profils français `fr-core-practitioner` et `fr-core-practitioner-role` (ajusté à `fr-core-practitioner-role-exercice` après analyse) du package `hl7.fhir.fr.core` (version 1.1.0) pour assurer la conformité avec les standards nationaux, notamment pour l’utilisation des identifiants RPPS et des terminologies françaises.
- Ces profils parent fournissent une base solide pour représenter les professionnels de santé en France, incluant des contraintes spécifiques comme les systèmes d’identification et les ValueSets nationaux.

#### 1.2. Identifiant RPPS Obligatoire

- Les deux profils exigent un identifiant RPPS (`identifier` avec `system = "https://esante.gouv.fr/produits-services/repertoire-rpps"`) pour permettre une identification unique des soignants et une association fiable avec leurs rendez-vous.
  - **Raison** : Le RPPS est le standard national pour identifier les professionnels de santé en France, garantissant l’interopérabilité avec d’autres systèmes de santé.
  - **Contrainte** : `identifier` est marqué comme Must Support (MS) avec une cardinalité de `1..*`, et `identifier.value` est obligatoire (`1..1`).

#### 1.3. Spécificités du Profil `ISIS-Practitioner`

- **Parent** : `fr-core-practitioner`.
- **Nom** : Exige un nom complet (`name 1..1`) avec `family` et `given` obligatoires pour garantir que les informations d’identification de base soient toujours présentes.
- **Télécommunications** : Exige au moins un contact (`telecom 1..* MS`) avec `system` et `value` obligatoires, permettant de joindre le soignant (par téléphone ou email, par exemple).
- **Raison** : Ces contraintes assurent que les informations minimales nécessaires pour identifier et contacter un soignant sont toujours disponibles.

#### 1.4. Spécificités du Profil `MyPractitionerRole`

- **Parent** : `fr-core-practitioner-role-exercice` (ajusté après analyse du package, car `fr-core-practitioner-role` n’existait pas dans `hl7.fhir.fr.core-1.1.0`).
- **Organisation** : Exige une référence à une organisation (`organization 1..1 MS`) pour contextualiser le rôle du soignant.
- **Rôle** : Exige un code de rôle (`code 1..1`) pour définir la fonction du soignant (ex. "Médecin généraliste", "Infirmier"). Nous avons utilisé des codes SNOMED CT pour leur adoption internationale, bien que le ValueSet `fr-core-vs-practitioner-role` ait été envisagé (commenté pour des raisons de simplicité).
- **Disponibilité** : Les éléments `availableTime`, `notAvailable`, et `AvailableTime` (ce dernier semble être une erreur typographique dans le FSH initial) ont été désactivés (`0..0`) car la gestion des disponibilités est déléguée à un service externe de prise de rendez-vous (les "edts").
  - **Raison** : Simplifier le profil en évitant la redondance avec un système externe dédié à la gestion des agendas.

#### 1.5. Exemples

- Deux exemples ont été fournis pour chaque profil afin de démontrer leur utilisation :
  - `PractitionerExample1` et `PractitionerExample2` pour `ISIS-Practitioner`.
  - `PractitionerRoleExample1` et `PractitionerRoleExample2` pour `MyPractitionerRole`.
- Ces exemples utilisent des identifiants RPPS fictifs et des données réalistes pour illustrer des cas d’usage (médecin généraliste, infirmier).

### 2. Contraintes Techniques

#### 2.1. Dépendances

- Le package `hl7.fhir.fr.core-1.1.0` a été utilisé localement après des échecs répétés de téléchargement automatique depuis `packages.fhir.org`. Cela a nécessité un ajustement manuel dans `sushi-config.yaml` :

  ```yaml
  dependencies:
    - package: hl7.fhir.fr.core
      uri: ./input/package/hl7.fhir.fr.core-1.1.0.tgz
    - package: hl7.fhir.uv.extensions.r4
      version: 5.2.0
