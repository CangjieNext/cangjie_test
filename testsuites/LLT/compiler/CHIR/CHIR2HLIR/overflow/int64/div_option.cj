// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow wrapping %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan w1 = -9223372036854775808
// ASSERT: scan s1 = 9223372036854775807
// ASSERT: scan s2 = 9223372036854775807

internal import std.overflow.*

func test(x: Int64, y: Int64) {
    let w1 = x / y // wrapping
    print("w1 = " + w1.toString() + "\n")

    let s1 = x.saturatingDiv(y)
    print("s1 = " + s1.toString() + "\n")

    let s2 = @OverflowSaturating {
        => x / y // saturating
    }
    print("s2 = " + s2().toString() + "\n")
}

main() {
    let MIN_INT64: Int64 = -0x8000_0000_0000_0000
    let a: Int64 = MIN_INT64
    test(a, -1)
    return 0
}
