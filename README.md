# Hello, Nix

This is a set of examples to show how a single tool, the Nix package manager, can be used to install system dependencies and build projects across different languages.

## Setup

Install the [Nix package manager](http://nixos.org/nix/). Everything else is installed by Nix as needed. Make sure the Nix binaries are on your path, e.g. by adding `~/.nix-profile/bin` to your path.

## Build all languages

To build and install "Hello world" executables for Clojure, Haskell, Java, and PureScript:

```
nix-env -f default.nix -i '*'
```

To uninstall all:

```
nix-env -e hello-clojure hello-haskell hello-java hello-purescript
```

## Project-specific installation

Navigate to one of the language directories, then run any of the following commands.

Install all project dependencies and drop into a shell with those dependencies available:

```
nix-shell
```

Build the project into `result/`:

```
nix-build
```

Install the project locally:

```
nix-env -f default.nix -i '*'
```