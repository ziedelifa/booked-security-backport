# Changelog

## 2.4.4.2-14h28-security-backport — 2026-11-13

Maintained by **Zied El Ifa** (`ziedelifa@gmail.com`).

### Security

- Mitigates the identified Booked account-takeover/authentication path associated with CVE-2026-22341.
- Adds missing authorization controls associated with CVE-2026-57746.
- Adds missing CSRF/nonces on sensitive paths associated with CVE-2026-57747.
- Restricts Booking Agents to their assigned calendars across front-end agents, admin AJAX, custom timeslots, bulk actions and CSV export.
- Prevents Booking Agents from changing linked WordPress customer profiles unless WordPress itself grants permission to edit that user.
- Stops trusting client-supplied appointment user IDs and timestamps.
- Adds server-side date/time-slot validation and disabled-slot enforcement.
- Enforces configured guest-booking and registration policies server-side.
- Adds appointment-owner checks to customer changes, cancellations and WooCommerce payment/change-date flows.
- Makes WooCommerce security nonces mandatory on patched sensitive actions.
- Sanitizes appointment custom fields before storage and escapes stored output boundaries.
- Neutralizes spreadsheet formulas in CSV exports.
- Hardens failed-login redirects with WordPress safe redirect validation.
- Protects legacy demo/destructive utilities with permissions/nonces and disables unsafe default behavior.
- Replaces legacy 32-character iCalendar feed tokens with a 64-character CSPRNG token.
- Uses constant-time token comparison for iCalendar feed access.
- Escapes iCalendar text values against RFC 5545 property injection.

### Packaging

- Marks the plugin locally as `2.4.4.2` / `14h28 Security Backport`.
- Public distribution contains the patch and documentation only; it does not redistribute the original Booked plugin.
