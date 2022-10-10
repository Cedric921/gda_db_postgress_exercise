# GDA - Brief pour vendredi 30 sept 2022

Après un processus long et lent, tu es retenu en tant que développeur dans une université. Et sans attendre, il y a une mission qui t’attend et tu es très excité à l’idée de pouvoir démontrer tes compétences à tes chefs.

L’université souhaite optimiser sa façon de gérer les étudiants et son personnel. Ta mission consiste à mettre en place une bdd qui va faciliter la gestion de données de l’université. Afin de te faciliter la tâche, nous te proposons déjà le modèle physique que tu trouveras à la page 128 du document “Database design” disponible sur Google Classroom. Sans toi libre de le modifier si nécessaire.

Ce qui te reste à faire :

- créer une bdd dans PostgreSQL nommée `gouniv`
- créer au moins 3 utilisateurs de la bdd ayant différents niveaux de permissions (droits):
  - un admin ayant tous les droits sur toutes les tables de la bdd
  - un 2è user qui ne peut que manipuler les tables `Student` et `Course`. Il ne peut que lire la table `Staff`
  - un dernier utilisateur qui n’a que les accès en lecture seul sur les tables `Student` et `Course`
- Insérer des données (un minumum de 5 entrées)
- documenter ses actions (faire mention aussi des sources d'informations utilisées)

Note: Toutes les taches ci-haut (excepté la dernière) doivent se faire dans des c

_Livrables :_ scripts sql (à exécuter sans erreurs aucune) ainsi que le document résument les différentes actions mises en place et les sources utilisées pour résoudre ce challenge

_Durée :_ 5 h 45
