# light-bulb

A Flutter app for the TechTalk 2022-10 about Flutter BLoC.

## Prerequisites

### Android setup

- Install the [Android SDK](https://developer.android.com/studio)
- Set environment variable `ANDROID_HOME` to the location of the SDK

### iOS setup

- Be a Mac OS user
- Install XCode
    - You'll need to be logged in with an Apple Developer account to download XCode
- Start XCode once and follow the instructions

## Setup

- Install [flutter](https://flutter.dev/)
- Make sure flutter is on the stable channel: `flutter channel stable`
- Check whether your system is properly set up: `flutter doctor`

## Git hooks

We use [lefthook](https://github.com/evilmartians/lefthook) to run all coding convention checks as
git pre-commit/pre-push hook.

### Installation

To install lefthook run the following command:

```sh
brew install lefthook
```

### Usage

To initialize lefthook run the following command:

```sh
lefthook install
```

This will setup git pre-commit/pre-push hooks containing checks as configured in `lefthook.yaml`
