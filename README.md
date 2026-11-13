# Booked 2.4.4 Security Backport

Unofficial community security backport for **Booked – Appointment Booking for WordPress 2.4.4**.

This repository does **not** distribute the original Booked plugin package. It provides a patch intended to be applied to a **legitimately obtained Booked 2.4.4 installation**.

## Status

Release: **2.4.4.2-14h28-security-backport**

**Security backport author / maintainer:** Zied El Ifa  
**Contact:** ziedelifa@gmail.com

The backport was created to mitigate publicly disclosed Booked vulnerabilities and to port relevant security hardening documented by QuickCal. It has been statically reviewed, syntax-checked, and manually regression-tested on a real WordPress installation.

This is an **unofficial mitigation**, not an upstream Booked/QuickCal release and not a guarantee that no undiscovered vulnerabilities exist.

## Security scope

The backport targets the following publicly disclosed issues:

- **CVE-2026-22341** — authentication / account-takeover path affecting Booked.
- **CVE-2026-57746** — missing authorization / access-control weaknesses.
- **CVE-2026-57747** — CSRF weaknesses.

It also backports security hardening matching the relevant QuickCal changelog work through **v1.0.23**, including:

- Booking Agent isolation to assigned calendars.
- Appointment ownership checks for customer changes, cancellations and payment actions.
- Nonce and capability checks on sensitive AJAX, CSV, WooCommerce and notice actions.
- Server-side booking date/time-slot validation rather than trusting client timestamps/user IDs.
- Disabled-slot enforcement and guest/registration policy enforcement.
- Stored/reflected XSS hardening on appointment/custom-field output paths.
- CSV formula neutralization.
- iCalendar token strengthening and RFC 5545 text escaping.
- Safe failed-login redirects.
- Protection of legacy demo/destructive tools.

QuickCal has continued evolving after v1.0.23. This project is a compatibility/security backport for sites that cannot immediately migrate; it is **not a replacement for moving to a maintained booking plugin**.

## Requirements

- WordPress installation currently using **Booked 2.4.4**.
- Shell access with GNU `patch`, or another patching workflow capable of applying unified diffs.
- Full backup of WordPress files and database before applying.

## Apply the patch

From `wp-content/plugins` (the directory that contains the `booked/` folder):

```bash
cp -a booked booked.backup-before-security-backport

patch --dry-run -p1 \
  < /path/to/booked-2.4.4.2-14h28-security-backport.patch

patch -p1 \
  < /path/to/booked-2.4.4.2-14h28-security-backport.patch
```

Then clear WordPress/server/page caches.

The plugin header should report:

```text
Version: 2.4.4.2
Description: ... (14h28 Security Backport)
```

## Important: Calendar Feed URLs rotate

The patch replaces legacy 32-character iCalendar feed tokens with a 64-character cryptographically generated token.

After first load, if you use external calendar subscriptions, retrieve the new feed URL from:

**Appointments / Rendez-vous → Settings / Paramètres → Calendar Feeds**

Update Outlook, Apple Calendar, Google Calendar, or any external consumer that still uses the old feed URL.

## Scanners may still report Booked as vulnerable

Wordfence, Patchstack, or other scanners may continue flagging the plugin because they identify the public Booked package/slug and upstream version range. This community patch does not change upstream vulnerability databases.

Do **not** fake a version such as `3.0.1` merely to hide scanner alerts. Keep the explicit backport version and document the local mitigation.

## Validation performed

The backport was manually validated for:

- Administrator appointment CRUD and CSV export.
- Booking Agent access to assigned calendars.
- Booking Agent denial outside assigned calendars.
- Subscriber denial of agent/admin actions.
- Registered-customer booking/change/cancel ownership.
- Guest booking policy.
- WooCommerce ownership and nonce behavior where enabled.
- iCalendar old-token rejection and new-token access.
- Primary booking, notification, custom-field and slot regressions.

See [`docs/TESTING.md`](docs/TESTING.md) for a reusable checklist.

## Files

- `patches/booked-2.4.4.2-14h28-security-backport.patch` — patch to apply to Booked 2.4.4.
- `docs/SECURITY.md` — security scope and disclosure policy.
- `docs/TESTING.md` — manual regression/security test matrix.
- `docs/CHANGELOG.md` — backport changelog.
- `docs/REFERENCES.md` — public advisories and upstream changelog references.
- `docs/SOURCE-FINGERPRINT.md` — SHA-256 of the specific Booked 2.4.4 archive used during validation.
- `scripts/preflight.sh` — verifies the source version and runs a patch dry-run.

## Legal / licensing

The repository intentionally does not include the original Booked commercial distribution. The patch contains modifications/differences intended for use with a legally obtained copy of Booked 2.4.4.

The patch and original-project-derived modifications should be used consistently with the licensing terms applicable to Booked and WordPress-derived code. See `LICENSE` and `NOTICE.md`.

## Disclaimer

No warranty is provided. Back up first, test in staging, and monitor the installation after deployment. A maintained upstream product or migration remains preferable for long-term security.
