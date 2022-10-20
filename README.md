# lightbulb

A Flutter app for the upcoming TechTalk about BLoC.

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
- Invoke [code generation](#code-generation)
- [Run the app](#running) from the command line or an IDE

## Code generation

A few parts of the app rely on automatic code generation. Full code generation can be executed at
once using [`build_runner`](#build_runner).

### build_runner

Most code generation plugins use the standard Dart build framework and can be invoked using

```sh
make generate
```

To continuously rebuild whenever relevant files change (recommended), use

```sh
make watch
```

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

## Running

- TODO: Document Fastlane usage for iOS device testing
- TODO: Document run configurations
