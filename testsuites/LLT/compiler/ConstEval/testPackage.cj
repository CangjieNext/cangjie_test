// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_fib_calculated` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests that adding a `package` declaration doesn't break constant evaluation.

package fibonacci

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
