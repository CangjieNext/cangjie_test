// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %cjc %compile_exe_opt %debugCHIROpt %n.cj %cmp_opt -o %output 2>&1 | compare %f
// ASSERT: scan error: an exception was thrown while evaluating constant
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Modulo by zero inside `try` in constant evaluation is still reported (Int64).

const func m(a: Int64, b: Int64): Int64 { try { a % b } catch (e: Exception) { 1 } }
const X = m(1, 0)
main() { println(X) }
