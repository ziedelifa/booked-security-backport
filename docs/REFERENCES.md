# References

Public references used to define the security scope of this backport.

## Upstream hardening

- QuickCal changelog: https://quickcal.co/changelog/
  - Security-hardening scope referenced by this backport: v1.0.23 and relevant earlier security fixes.

## Public vulnerability references

- CVE-2026-22341 / Booked authentication/account-takeover advisory:  
  https://www.wordfence.com/threat-intel/vulnerabilities/wordpress-plugins/booked/booked-300-authentication-bypass

- CVE-2026-57746 / Booked missing authorization advisory:  
  https://www.wordfence.com/threat-intel/vulnerabilities/wordpress-plugins/booked/booked-appointment-booking-for-wordpress-300-missing-authorization

- CVE-2026-57747 / Booked CSRF advisory:  
  https://www.wordfence.com/threat-intel/vulnerabilities/wordpress-plugins/booked/booked-appointment-booking-for-wordpress-300-cross-site-request-forgery

## Disclosure guidance

- Wordfence vulnerability disclosure policy:  
  https://www.wordfence.com/security/

## Note

At the time this backport was prepared (2026-11-13), QuickCal's changelog had progressed beyond v1.0.23. This project intentionally remains a narrowly scoped Booked 2.4.4 compatibility/security backport rather than attempting to recreate current QuickCal.
