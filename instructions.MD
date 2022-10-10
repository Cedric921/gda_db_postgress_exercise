# Marche à suivre

Pour répondre a cet exercice rassurez-vous que vous avez le serveur PostgreSQL qui est installé sur votre ordinateur.

- Lancer le serveur PostgreSQL si ce dernier ne l’est pas, avec la commande

```powershell
systemctl start postgres
```

Une fois vous avez lancez le serveur vous pouvez vous connecter a PostgreSQL via l’utilisateur et le mot de pass, si vous n’avez pas encore l’utilisateur, utiliser celui qui vient par defaut

```powershell
sudo -u postgres psql
```

un fois connecté en tant que postgres vous allez creer la base des donnees, et suivre les etapes comme le montre le fichier `**gouniv.sql**`

Si vous ne voulez pas suivre toutes les etapes selon ce fichier **`gouniv.sql`**, ce n’est pas grave, telecharger juste ce fichier et executez-le dans postgres avec la commande

```powershell
psql -h localhost -p 5432 -U postgres -f gouniv.sql
```
