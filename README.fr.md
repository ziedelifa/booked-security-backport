# Backport de sécurité Booked 2.4.4

Backport communautaire **non officiel** pour **Booked 2.4.4**.

Ce dépôt **ne redistribue pas le plugin Booked original**. Il fournit uniquement un patch à appliquer sur une copie **légitimement obtenue** de Booked 2.4.4.

## Version

**2.4.4.2-14h28-security-backport**

**Auteur / mainteneur du backport de sécurité :** Zied El Ifa  
**Contact :** ziedelifa@gmail.com

Le patch vise notamment :

- CVE-2026-22341 ;
- CVE-2026-57746 ;
- CVE-2026-57747 ;
- l'isolation des Booking Agents ;
- les contrôles nonce/capabilities/ownership ;
- la validation serveur des dates et créneaux ;
- les protections XSS ;
- l'export CSV ;
- WooCommerce ;
- les flux iCalendar.

Il reprend les durcissements de sécurité pertinents documentés par QuickCal jusqu'à la version 1.0.23.

## Installation

Depuis `wp-content/plugins` :

```bash
cp -a booked booked.backup-before-security-backport
patch --dry-run -p1 < /chemin/booked-2.4.4.2-14h28-security-backport.patch
patch -p1 < /chemin/booked-2.4.4.2-14h28-security-backport.patch
```

Vider ensuite tous les caches.

## Flux iCal

Le patch remplace automatiquement les anciens tokens iCal de 32 caractères par un token CSPRNG de 64 caractères. Les anciennes URL de flux deviennent donc invalides.

Après activation, récupérer les nouvelles URL dans :

**Rendez-vous → Paramètres → Calendar Feeds**

et mettre à jour les calendriers externes.

## Important

Les scanners de vulnérabilités peuvent continuer à signaler Booked comme vulnérable, car ce patch n'est pas une version officielle référencée dans leurs bases. Ne pas falsifier le numéro de version pour masquer l'alerte.

Toujours tester en préproduction avant production. Une migration vers une solution maintenue reste recommandée à long terme.
