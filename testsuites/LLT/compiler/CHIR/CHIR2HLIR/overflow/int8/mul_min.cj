// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan ArithmeticException: mul

@OverflowWrapping
func testWrapping(x: Int8, y: Int8): Int8 {
    return x * y // 此时采用截断处理策略，不会抛异常。
}

@OverflowSaturating
func testSaturating(x: Int8, y: Int8): Int8 {
    return x * y // 此时采用饱和处理策略，不会抛异常。
}

@OverflowThrowing
func testThrowing(x: Int8, y: Int8): Int8 {
    return x * y // 此时采用抛异常策略。
}

main() {
    let MIN_INT8: Int8 = -128
    let MAX_INT8: Int8 = 127
    let a: Int8 = MIN_INT8 / 8
    let b: Int8 = 8
    let c: Int8 = -a
    // wrapping
    let ret: Int8 = testWrapping(a, b) // min
    if (ret != MIN_INT8) {
        return 1
    }
    let ret1: Int8 = testWrapping(a, c) // min overflow
    if (ret1 != 0) {
        return 1
    }
    let ret2: Int8 = testWrapping(c, a) // min overflow
    if (ret2 != 0) {
        return 1
    }
    // saturating
    let ret3: Int8 = testSaturating(a, b) // min
    if (ret3 != MIN_INT8) {
        return 1
    }
    let ret4: Int8 = testSaturating(a, c) // min overflow
    if (ret4 != MIN_INT8) {
        return 1
    }
    let ret5: Int8 = testSaturating(c, a) // min overflow
    if (ret5 != MIN_INT8) {
        return 1
    }
    // throwing
    let ret6: Int8 = testThrowing(a, 8) // min
    if (ret6 != MIN_INT8) {
        return 1
    }
    // min overflow
    let ret7: Int8 = try {
        testThrowing(a, 16)
    } catch (e: ArithmeticException) {
        print("ArithmeticException: mul")
        0
    } finally {}
    return 0
}
