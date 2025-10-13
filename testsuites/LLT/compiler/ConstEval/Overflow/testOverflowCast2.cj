// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %cjc %compile_exe_opt %debugCHIROpt %n.cj %cmp_opt -o %output 2>&1 | compare %f
// ASSERT: scan error: an exception was thrown while evaluating constant
// (DEBUG_OPTION)ASSERT: scan OverflowException
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package std.test_casts // Allow casts

@OverflowThrowing
@ConstSafe
const func testThrowingCast(x: Float64): Int8 {
    return Int8(x)
}

public const my_const = testThrowingCast(10000.0)

main() {
    my_const
}