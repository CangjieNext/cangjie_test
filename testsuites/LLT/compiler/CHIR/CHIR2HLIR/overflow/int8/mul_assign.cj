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
    var res = x
    res *= y // 此时采用截断处理策略，不会抛异常。
    return res
}

@OverflowSaturating
func testSaturating(x: Int8, y: Int8): Int8 {
    var res = x
    res *= y // 此时采用饱和处理策略，不会抛异常。
    return res
}

@OverflowThrowing
func testThrowing(x: Int8, y: Int8): Int8 {
    var res = x
    res *= y // 此时采用抛异常策略。
    return res
}

main() {
    let MIN_INT8: Int8 = -128
    let MAX_INT8: Int8 = 127
    let a: Int8 = MIN_INT8 / 8
    let b: Int8 = 8
    let c: Int8 = -8
    let d: Int8 = -a
    // wrapping
    let ret: Int8 = testWrapping(16, 4) // normal
    if (ret != 64) {
        return 1
    }
    let ret1: Int8 = testWrapping(a, c) // max overflow
    if (ret1 != MIN_INT8) {
        return 1
    }
    let ret2: Int8 = testWrapping(d, b) // max overflow
    if (ret2 != MIN_INT8) {
        return 1
    }
    // saturating
    let ret3: Int8 = testSaturating(16, 4) // normal
    if (ret3 != 64) {
        return 1
    }
    let ret4: Int8 = testSaturating(a, c) // max overflow
    if (ret4 != MAX_INT8) {
        return 1
    }
    let ret5: Int8 = testSaturating(d, b) // max overflow
    if (ret5 != MAX_INT8) {
        return 1
    }
    // throwing
    let ret6: Int8 = testThrowing(16, 4) // normal
    if (ret6 != 64) {
        return 1
    }
    // max overflow
    let e: Int8 = MAX_INT8 / 8
    let ret7: Int8 = try {
        testThrowing(e, 16)
    } catch (e: ArithmeticException) {
        print("ArithmeticException: mul")
        0
    } finally {}
    return 0
}
