# GYM PULSE — Flutter prototype

A mobile-first demo app for a local Indian gym.

## Included
- Member, Owner and Front Desk role switcher
- Sample member membership and attendance
- Simulated QR success, duplicate, invalid and offline states
- Renewal plan selection and simulated payment outcomes
- Add-on catalogue and demo order
- Owner metrics, six sample no-show cases and follow-up outcome form
- Configurable no-show threshold
- Front desk phone lookup and reason-required assisted check-in

## Run
Install Flutter SDK, then from this folder:

```bash
flutter pub get
flutter run
```

Build Android APK:

```bash
flutter build apk --release
```

The APK will be generated at:
`build/app/outputs/flutter-apk/app-release.apk`

## Important limitations
This is a front-end prototype with in-memory demo data. It does not connect to Supabase, a real QR scanner, OTP provider, payment gateway, WhatsApp or push notifications. Do not use it for real member records or real payments.

Production work still required:
- Supabase/PostgreSQL schema, migrations, RLS policies and server APIs
- OTP authentication and role-based access
- Signed rotating QR sessions and server-side duplicate protection
- Provider payment verification, idempotent webhooks, refunds and receipts
- Offline queue with server reconciliation
- Scheduled no-show and reminder jobs
- Audit logs, consent enforcement, backups and privacy controls
