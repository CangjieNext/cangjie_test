// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow wrapping %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan w1 = 18446744073709551600
// ASSERT: scan s1 = 0
// ASSERT: scan s2 = 0

internal import std.overflow.*

func test(x: UInt64, y: UInt64) {
    let w1 = x - y // wrapping
    print("w1 = " + w1.toString() + "\n")

    let s1 = x.saturatingSub(y)
    print("s1 = " + s1.toString() + "\n")

    let s2 = @OverflowSaturating {
        => x - y // saturating
    }
    print("s2 = " + s2().toString() + "\n")
}

main() {
    test(0, 16)
    return 0
}
