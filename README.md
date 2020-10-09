# Scrappeur_fou

Aujourd'hui il s'agissait de faire de la récupération massive de données issus de sites internet.

1. Crypto_currency

lib/crypto_currencies.rb permet de recuperer les noms et cours actuels des crypto-monnaies et de les retourner sous forme de array de hash ou la cles est le nom et la valeur le cours actuel.

spec/crypto_currencies_spec.rb permet de tester que le retour est bien un array de hash, que la taille du retour comporte bien les elements sur la page ou le scrapping se fait et enfin il teste les valeurs de deux crypto-monnaies (BTC et ETH) afin de s'assurer que c'est coherent.


2. Townhall_mail

lib/townhall.rb permet de recuperer les noms et mails des mairies du val d'oise et de les retourner sous forme de array de hash contenant le nom et le mail.

spec/townhall_spec.rb permet de tester que le retour est bien un array de hash, que la taille du retour comporte bien les elements sur la page ou le scrapping se fait et enfin il teste les mails de deux villes afin de s'assurer que c'est coherent.


3. Deputy_info

lib/deputies.rb permet de recuperer les noms, prenom et mails des deputes francais et de les retourner sous forme de array de hashou le nom, prenom et mail.

spec/deputies_spec.rb permet de tester que le retour est bien un array de hash, que la taille du retour comporte bien les elements sur la page ou le scrapping se fait et enfin il teste les valeurs de deux deputes (le premier et le dernier) afin de s'assurer que c'est coherent.