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
func testWrapping(x: Int8, y: Int8): Int8 {
    return x - y // 此时采用截断处理策略，不会抛异常。
}

@OverflowSaturating
func testSaturating(x: Int8, y: Int8): Int8 {
    return x - y // 此时采用饱和处理策略，不会抛异常。
}

@OverflowThrowing
func testThrowing(x: Int8, y: Int8): Int8 {
    return x - y // 此时采用抛异常策略。
}

main() {
    let MIN_INT8: Int8 = -128
    let MAX_INT8: Int8 = 127
    let a: Int8 = MIN_INT8 + 15
    // wrapping
    let ret: Int8 = testWrapping(a, 15) // min
    if (ret != MIN_INT8) {
        return 1
    }
    let ret1: Int8 = testWrapping(a, 16) // min overflow
    if (ret1 != MAX_INT8) {
        return 1
    }
    // saturating
    let ret2: Int8 = testSaturating(a, 15) // min
    if (ret2 != MIN_INT8) {
        return 1
    }
    let ret3: Int8 = testSaturating(a, 16) // min overflow
    if (ret3 != MIN_INT8) {
        return 1
    }
    // throwing
    let ret4: Int8 = testThrowing(a, 15) // min
    if (ret4 != MIN_INT8) {
        return 1
    }
    // min overflow
    let ret5: Int8 = try {
        testThrowing(a, 16)
    } catch (e: ArithmeticException) {
        print("ArithmeticException: sub")
        0
    } finally {}
    return 0
}
