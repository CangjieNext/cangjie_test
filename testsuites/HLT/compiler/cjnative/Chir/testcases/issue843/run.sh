#!/usr/bin/env bash
# TC-GENINST-843-O2: issue#843 -O2 断言编译链接成功 + 运行 TRACE_OK + 无 undefined symbol。
set -u
CJC="${1:-cjc}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
FAIL=0

if "$CJC" "$ROOT/main.cj" -O2 -o "$ROOT/prog843" >"$ROOT/build.log" 2>&1; then
  actual=$("$ROOT/prog843" 2>"$ROOT/run.err")
  if [ "$actual" = "TRACE_OK" ]; then echo "PASS issue843 -O2 TRACE_OK"; else echo "FAIL issue843 got: $actual"; FAIL=1; fi
  if grep -qi "undefined symbol" "$ROOT/run.err" "$ROOT/build.log" 2>/dev/null; then
    echo "FAIL issue843 undefined symbol present"; FAIL=1
  fi
  rm -f "$ROOT/prog843"
else
  echo "FAIL issue843 build"; cat "$ROOT/build.log"; FAIL=1
fi
exit $FAIL
