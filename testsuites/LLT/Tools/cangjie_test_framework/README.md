# Test framework CLI regression tests

[中文说明](README_zh.md)

These tests exercise `maple_test/compare.py` from a separate checkout of
[`cangjie_test_framework`](https://atomgit.com/Cangjie/cangjie_test_framework).
The production comparison tool remains in that repository.

## Requirements and execution

- Python 3.7 or later, with its standard library.
- Local checkouts of `cangjie_test` and `cangjie_test_framework`.
- No Cangjie SDK, shell utilities, or third-party Python packages are needed for this script.

From the **`cangjie_test` repository root**, run the following command when the
two repositories are sibling directories:

```shell
python testsuites/LLT/Tools/cangjie_test_framework/test_compare_object.py --framework ../cangjie_test_framework -v
```

`--framework` is required and names the root of the framework checkout under test.
For another layout, replace its value with that checkout's path; quote paths
containing spaces. A missing `maple_test/compare.py` produces an argument error
and exit code 2. `-v` enables verbose unittest output.

The script launches the comparison tool using the same Python interpreter,
creates UTF-8 fixtures in a temporary directory, and removes them on completion.
It sets `PYTHONIOENCODING=utf-8` for the child process; no environment variable
needs to be set by the caller. All scenarios passing produces `OK` and exit code 0.
An assertion failure produces a nonzero exit code.

This is a standalone framework regression entry point. It is not registered in
the default HLT/LLT test lists; run the command explicitly when checking framework changes.

## Covered behavior

One unittest method exercises seven subprocess scenarios:

| Input | Expected tool result |
| --- | --- |
| Omitted `--compare_object` | Read stdin; matching content exits 0 |
| UTF-8 file with spaces in its path | Read the file; matching content exits 0 |
| `--compare_object` without a value | Read stdin; matching content exits 0 |
| `--compare_object -` | Read stdin; matching content exits 0 |
| Mismatching stdin | `[Compare Fail]`, exit 1 |
| Missing file | Argument error, exit 2, no traceback |
| Mismatching file with matching stdin | `[Compare Fail]`, exit 1; the file takes precedence |

The test checks both exit codes and output markers and rejects unexpected tracebacks.
