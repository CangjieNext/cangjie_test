// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan ArithmeticException: inc

@OverflowWrapping
func testWrapping(x: Int8): Int8 {
    var res: Int8 = x
    res++ // 此时采用截断处理策略，不会抛异常。
    return res
}

@OverflowSaturating
func testSaturating(x: Int8): Int8 {
    var res: Int8 = x
    res++ // 此时采用饱和处理策略，不会抛异常。
    return res
}

@OverflowThrowing
func testThrowing(x: Int8): Int8 {
    var res: Int8 = x
    res++ // 此时采用抛异常策略。
    return res
}

main() {
    let MIN_INT8: Int8 = -128
    let MAX_INT8: Int8 = 127
    let a: Int8 = 15
    let b: Int8 = testWrapping(a)
    let c: Int8 = testSaturating(a)
    let d: Int8 = testThrowing(a)
    if ((b != 16) || (d != 16) || (d != 16)) {
        return 1
    }
    let ret: Int8 = testWrapping(MAX_INT8)
    if (ret != MIN_INT8) {
        return 1
    }
    let ret1: Int8 = testSaturating(MAX_INT8)
    if (ret1 != MAX_INT8) {
        return 1
    }
    // max overflow
    let ret2: Int8 = try {
        testThrowing(MAX_INT8)
    } catch (e: ArithmeticException) {
        print("ArithmeticException: inc")
        0
    } finally {}
    return 0
}
