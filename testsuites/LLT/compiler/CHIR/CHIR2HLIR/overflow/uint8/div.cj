// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan w1 = 255
// ASSERT: scan s1 = 255
// ASSERT: scan s2 = 255

internal import std.overflow.*

@OverflowWrapping
func testWrapping(x: UInt8, y: UInt8): UInt8 {
    return x / y // 此时采用截断处理策略，不会抛异常。
}

@OverflowSaturating
func testSaturating(x: UInt8, y: UInt8): UInt8 {
    return x / y // 此时采用饱和处理策略，不会抛异常。
}

@OverflowThrowing
func testThrowing(x: UInt8, y: UInt8): UInt8 {
    return x / y // 不会溢出
}

@OverflowWrapping
func test(x: UInt8, y: UInt8) {
    let w1 = x / y // 此时采用截断处理策略，不会抛异常。
    print("w1 = " + w1.toString() + "\n")

    let s1 = x.saturatingDiv(y) // 此时采用饱和处理策略。
    print("s1 = " + s1.toString() + "\n")

    let s2 = @OverflowSaturating {
        => x / y // 此时采用饱和处理策略，不会抛异常。
    }
    print("s2 = " + s2().toString() + "\n")
}

main() {
    // wrapping
    let MIN_UINT8: UInt8 = 0
    let MAX_UINT8: UInt8 = 255
    let ret: UInt8 = testWrapping(16, 4) // normal
    if (ret != 4) {
        return 1
    }
    // saturating
    let ret1: UInt8 = testSaturating(16, 4) // normal
    if (ret1 != 4) {
        return 1
    }
    // throwing
    let ret2: UInt8 = testThrowing(16, 4) // normal
    if (ret2 != 4) {
        return 1
    }
    let a: UInt8 = MAX_UINT8
    test(a, 1)
    return 0
}
