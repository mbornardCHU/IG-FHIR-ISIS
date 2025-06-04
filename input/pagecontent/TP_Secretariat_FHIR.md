
# TP Secrétariat : Utilisation des Ressources FHIR

Ce document présente l’utilisation des ressources FHIR (`Appointment`, `Schedule` et `Slot`) dans le cadre du TP sur la gestion des rendez-vous et plannings du secrétariat hospitalier. Toutes les ressources décrites respectent les standards HL7 FHIR R4.

---

##  Ressource : Appointment

La ressource `Appointment` représente un rendez-vous programmé, reliant obligatoirement :
- Un patient (`Patient`)
- Un praticien (`Practitioner`)
- Une salle ou lieu (`Location`)

### Particularités du profil secrétariat :
- **Statut obligatoire** : indique l’état du rendez-vous (`booked`, `cancelled`, etc.).
- **Extension** `appointmentOperator` : indique l’organisation (secrétariat) ayant créé le rendez-vous.

### Exemple :
- Une consultation ORL programmée par le secrétariat avec le Dr Martin dans la salle ORL 1.
- Une prise de sang programmé par le secrétariat avec Dr Claude dans la salle 4.

---

##  Ressource : Schedule

La ressource `Schedule` représente un planning publié, indiquant la disponibilité générale d'un ou plusieurs praticiens dans un ou plusieurs lieux.

### Particularités du profil secrétariat :
- **Acteurs obligatoires** : au minimum un praticien (`Practitioner`) et une salle (`Location`).
- **Période (`planningHorizon`) obligatoire** : début et fin de validité du planning.
- **Extension** `scheduleOperator` : indique l’organisation (secrétariat) ayant créé le planning.

### Exemple :
- Un planning hebdomadaire du Dr Martin pour les consultations ORL dans la salle ORL 1.
- Un planning hebdomadaire du Dr Claude pour les prises de sang dans la salle 4.

---

##  Ressource : Slot

La ressource `Slot` décrit un créneau individuel, précis, disponible ou occupé, au sein d'un planning (`Schedule`).

### Particularités du profil secrétariat :
- **Référence obligatoire vers un planning (`Schedule`)** : rattachement au planning correspondant.
- **Statut** : `free` ou `busy-tentative` pour indiquer la disponibilité du créneau.
- **Extension** `slotOperator` : indique l’organisation (secrétariat) ayant publié le créneau.

### Exemple :
- Un créneau précis le 14 mai 2025 de 9h00 à 9h30 disponible à la réservation pour une consultation ORL.
- Un créneau précis le 14 juin 2025 de 9h00 à 9h30 disponible à la réservation pour une prise de sang

---

##  Mise en place technique

- Chaque ressource a été définie via un profil FSH spécifique, validé par **SUSHI**.
- Les invariants FHIRPath assurent l'intégrité et la cohérence métier sans slicing, garantissant la compatibilité maximale avec les ressources standards HL7 FHIR.
