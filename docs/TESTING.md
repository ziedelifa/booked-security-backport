# Manual Security and Regression Test Matrix

Run these tests on staging after every modification to the backport.

## 1. Administrator

- Create an appointment.
- Edit date/time/customer fields.
- Approve an appointment.
- Delete an appointment.
- Export CSV.
- Verify custom fields render safely.

Expected: all authorized operations succeed.

## 2. Booking Agent isolation

Create at least two agents/calendars: Agent A → Calendar A, Agent B → Calendar B.

Agent A must be able to:

- View and manage appointments in Calendar A.
- Approve/delete assigned appointments.
- Manage permitted custom time slots in Calendar A.
- Export only Calendar A data.

Agent A must **not** be able to:

- Read Calendar B customer details.
- Edit/approve/delete Calendar B appointments.
- Modify Calendar B custom time slots.
- Export Calendar B data.

Expected: cross-calendar attempts return authorization failure / HTTP 403 / WordPress permission denial.

## 3. Subscriber

- Attempt Front-End Agent AJAX actions.
- Attempt admin appointment endpoints.
- Attempt to read another customer's appointment details.

Expected: denied.

## 4. Registered customer

- Create own appointment.
- Change/cancel own appointment where enabled.
- Attempt to modify another customer's appointment by changing IDs in the request.

Expected: own operations work; cross-user operations are denied.

## 5. Guest

When guest booking is enabled:

- Create a valid guest appointment.
- Verify guest cannot use an arbitrary existing user ID.
- Verify guest cannot pay/change/cancel an appointment that requires an authenticated owner.

When guest booking is disabled:

- Attempt direct guest booking requests.

Expected: server enforces configured policy.

## 6. Slot/date validation

- Attempt valid time slot.
- Attempt malformed date/time slot.
- Attempt a disabled slot.
- Attempt a date outside configured limits/buffer.
- Attempt to exceed appointment quota.
- Tamper with the client-supplied timestamp.

Expected: server independently validates and rejects invalid requests.

## 7. WooCommerce (if enabled)

- Owner pays for own appointment.
- Different signed-in user attempts payment.
- Guest attempts payment.
- Change appointment date as owner.
- Tamper with/remove `booked-wc-nonce`.

Expected: owner + valid nonce succeeds; all unauthorized/nonce-invalid cases fail.

## 8. CSV

- Export as admin.
- Export as Booking Agent.
- Include test fields beginning with `=`, `+`, `-`, and `@`.

Expected: agent receives only assigned calendars and formula-like values are neutralized.

## 9. iCalendar

- Confirm old 32-character feed URL stops working after token rotation.
- Retrieve the new 64-character feed URL.
- Confirm the new feed works.
- Test text containing comma, semicolon, backslash, CR and LF.

Expected: old token rejected, new token accepted, text cannot inject new iCalendar properties.

## 10. General regression

- Confirmation emails.
- Agent notifications.
- Custom fields.
- Front-end calendar rendering.
- Custom/disabled slots.
- Profile updates/password changes.
- Login failure redirect behavior.
- Page/server caches cleared after deployment.
