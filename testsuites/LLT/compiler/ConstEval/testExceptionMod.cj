// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %cjc %compile_exe_opt %debugCHIROpt %printAllBCHIR %n.cj %cmp_opt -o %output 2>&1 | compare %f
// ASSERT: scan error: an exception was thrown while evaluating constant
// (DEBUG_OPTION) ASSERT: scan ArithmeticException
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests constant evaluation when an exception is thrown.

const func remainder(n: Int64, m: Int64) : Int64 {
  n % m
}

const meaningful_value = remainder(2, 0)

main() {}
