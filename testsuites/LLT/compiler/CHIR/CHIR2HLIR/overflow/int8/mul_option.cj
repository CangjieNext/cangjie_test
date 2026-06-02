// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow wrapping %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan w1 = -16
// ASSERT: scan s1 = 127
// ASSERT: scan s2 = 127

internal import std.overflow.*

func test(x: Int8, y: Int8) {
    let w1 = x * y // wrapping
    print("w1 = " + w1.toString() + "\n")

    let s1 = x.saturatingMul(y)
    print("s1 = " + s1.toString() + "\n")

    let s2 = @OverflowSaturating {
        => x * y // saturating
    }
    print("s2 = " + s2().toString() + "\n")
}

main() {
    let MAX_INT8: Int8 = 127
    let a: Int8 = MAX_INT8 / 8
    test(a, 16)
    return 0
}
