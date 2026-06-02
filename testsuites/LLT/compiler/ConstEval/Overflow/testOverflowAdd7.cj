// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION) EXEC: %cjc %compile_exe_opt %debugCHIROpt %n.cj %cmp_opt -o %output 2>&1 | compare %f
// ASSERT: scan error: an exception was thrown while evaluating constant
// ASSERT: scan OverflowException
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const MAX_INT32: Int32 = 2147483647

@OverflowThrowing
const func testThrowingAdd(x: Int32, y: Int32): Int32 {
    return x + y
}

public const my_const = testThrowingAdd(MAX_INT32 - 15, 16)

main() {
    my_const
}