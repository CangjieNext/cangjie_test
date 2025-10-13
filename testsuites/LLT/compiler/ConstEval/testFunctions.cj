// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args
// (DEBUG_OPTION) ASSERT: scan debug: consteval at testFunctions.cj:23:1 - testFunctions.cj:23:32 replaced initializer function `gv$_fib_calculated` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests basic constant evaluation with functions.

const func fib(n: Int64) : Int64 {
  if (n < 2) {
    return n
  }
  return fib(n - 1) + fib(n - 2)
}

const nth = 10
const fib_calculated = fib(nth)

main() {
	print("${nth}th fibonacci is ${fib_calculated}\n")
}
