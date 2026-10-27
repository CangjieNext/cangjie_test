# Cangjie Programming Language Test

## Directory Structure

```shell
cangjie_test/
|-- Conformance
|   `-- Compiler
|       |-- harness     # Harness Test Framework
|       `-- testsuite   # Cangjie SPEC Conformance Test Suite
`-- testsuites
    |-- HLT             # Cangjie HLT Test Suite
    |-- LLT             # Cangjie LLT Test Suite
    `-- support         # Explicitly run supporting regression suites and fixtures
```

## Cangjie SPEC Conformance Test Suite Guide

[Harness Test Framework](Conformance/Compiler/harness/README.md)

## Cangjie HLT and LLT Test Suite Guide

[Maple Test Framework](https://gitcode.com/Cangjie/cangjie_test_framework/blob/main/README.md)

## Supporting Regression Suites

[aspect_cj driver and rule regressions (Chinese)](testsuites/support/aspect_cj_driver/README.md)
require a matching compiler and stdx build. These scripts are run explicitly;
their fixture files are not standalone Maple cases.

