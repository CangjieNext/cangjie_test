// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: depFibonacci.cj
// (DEBUG_OPTION)EXEC: %compiler %compile_lib_opt depFibonacci.cj -o depFibonacci.%middle
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt depFibonacci.%middle %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_tenth_fibonacci` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_fifth_fibonacci_is_smaller_than_tenth_fibonacci` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests constant evaluation using constant variables and functions from dependencies.

internal import fibonacci.*

const tenth_fibonacci = fib(10)
const fifth_fibonacci_is_smaller_than_tenth_fibonacci = fifth_fibonacci < tenth_fibonacci

main() {}
