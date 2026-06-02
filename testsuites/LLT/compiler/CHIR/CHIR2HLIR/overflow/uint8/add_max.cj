// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan ArithmeticException: add

@OverflowWrapping
func testWrapping(x: UInt8, y: UInt8): UInt8 {
    return x + y // 此时采用截断处理策略，不会抛异常。
}

@OverflowSaturating
func testSaturating(x: UInt8, y: UInt8): UInt8 {
    return x + y // 此时采用饱和处理策略，不会抛异常。
}

@OverflowThrowing
func testThrowing(x: UInt8, y: UInt8): UInt8 {
    return x + y // 此时采用抛异常策略。
}

main() {
    // wrapping
    let MIN_UINT8: UInt8 = 0
    let MAX_UINT8: UInt8 = 255
    let ret: UInt8 = testWrapping(16, 4) // normal
    if (ret != 20) {
        return 1
    }
    let b: UInt8 = MAX_UINT8 - 15
    let ret1: UInt8 = testWrapping(b, 16) // max overflow
    if (ret1 != 0) {
        return 1
    }
    // saturating
    let ret2: UInt8 = testSaturating(16, 4) // normal
    if (ret2 != 20) {
        return 1
    }
    let ret3: UInt8 = testSaturating(b, 16) // max overflow
    if (ret3 != MAX_UINT8) {
        return 1
    }
    // throwing
    let ret4: UInt8 = testThrowing(16, 4) // normal
    if (ret4 != 20) {
        return 1
    }
    // max overflow
    let ret5: UInt8 = try {
        testThrowing(b, 16)
    } catch (e: ArithmeticException) {
        print("ArithmeticException: add")
        0
    } finally {}
    return 0
}
