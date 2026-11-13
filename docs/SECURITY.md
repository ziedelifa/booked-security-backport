# Security Policy

## Scope

This project is an unofficial security backport for Booked 2.4.4. It is designed to mitigate known vulnerabilities and security weaknesses for sites that cannot immediately migrate.

It is not an upstream release and cannot guarantee the absence of unknown vulnerabilities.

## Supported backport

| Backport | Base plugin | Status |
|---|---|---|
| 2.4.4.2-14h28-security-backport | Booked 2.4.4 | Supported for this patch release |

## Reporting a vulnerability

Maintainer: **Zied El Ifa**  
Security contact: **ziedelifa@gmail.com**

Please do **not** publish an exploit or proof of concept in a public issue before the maintainer has had an opportunity to review it.

Preferred workflow on GitHub:

1. Open a **private security advisory** for the repository.
2. Include the affected file/function, prerequisites, impact, and a minimal reproduction.
3. Avoid including real user data, credentials, production URLs, or destructive payloads.

For vulnerabilities in the upstream Booked/QuickCal product, also consider responsible disclosure to the relevant upstream/security database provider.

## Scanner alerts

Public vulnerability databases may continue to report Booked because this community backport is not an official upstream patched version. Treat scanner findings as requiring review rather than suppressing them by falsifying the plugin version.
