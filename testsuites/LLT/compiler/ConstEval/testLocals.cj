// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_five` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_fifth_fibonacci` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_ten_plus_fifth_fib` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests that constant variables inside functions are evaluated.

const func fib(n: Int64) : Int64 {
  if (n < 2) {
    return n
  }
  return fib(n - 1) + fib(n - 2)
}

const func add_the_fifth_fibonacci(n: Int64) : Int64 {
  const five = ((3 + 6 + 8) - 2) / 3
  const fifth_fibonacci = fib(five)
  n + fifth_fibonacci
}

const ten_plus_fifth_fib = add_the_fifth_fibonacci(10)

main() {}
