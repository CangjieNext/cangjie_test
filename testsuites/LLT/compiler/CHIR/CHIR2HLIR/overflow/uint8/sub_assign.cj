// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan ArithmeticException: sub

@OverflowWrapping
func testWrapping(x: UInt8, y: UInt8): UInt8 {
    var res = x
    res -= y // 此时采用截断处理策略，不会抛异常。
    return res
}

@OverflowSaturating
func testSaturating(x: UInt8, y: UInt8): UInt8 {
    var res = x
    res -= y // 此时采用饱和处理策略，不会抛异常。
    return res
}

@OverflowThrowing
func testThrowing(x: UInt8, y: UInt8): UInt8 {
    var res = x
    res -= y // 此时采用抛异常策略。
    return res
}

main() {
    let MIN_UINT8: UInt8 = 0
    let MAX_UINT8: UInt8 = 255
    let a: UInt8 = 15
    // wrapping
    let ret: UInt8 = testWrapping(a, 15) // min
    if (ret != 0) {
        return 1
    }
    let ret1: UInt8 = testWrapping(a, 16) // min overflow
    if (ret1 != MAX_UINT8) {
        return 1
    }
    // saturating
    let ret2: UInt8 = testSaturating(a, 15) // min
    if (ret2 != 0) {
        return 1
    }
    let ret3: UInt8 = testSaturating(a, 16) // min overflow
    if (ret3 != 0) {
        return 1
    }
    // throwing
    let ret4: UInt8 = testThrowing(a, 15) // min
    if (ret4 != 0) {
        return 1
    }
    // min overflow
    let ret5: UInt8 = try {
        testThrowing(a, 16)
    } catch (e: ArithmeticException) {
        print("ArithmeticException: sub")
        0
    } finally {}
    return 0
}
