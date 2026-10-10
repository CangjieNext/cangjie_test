// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %cjc %compile_exe_opt %debugCHIROpt %n.cj %cmp_opt -o %output 2>&1 | compare %f
// ASSERT: scan error: an exception was thrown while evaluating constant
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Left shift by more than the bit width raises OverflowException (Int32).

const func f(a: Int32, n: Int64): Int32 { a << n }
const X = f(1, 200)
main() { println(X) }
