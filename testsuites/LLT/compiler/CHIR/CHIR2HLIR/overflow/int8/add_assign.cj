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
func testWrapping(x: Int8, y: Int8): Int8 {
    var res = x
    res += y // 此时采用截断处理策略，不会抛异常。
    return res
}

@OverflowSaturating
func testSaturating(x: Int8, y: Int8): Int8 {
    var res = x
    res += y // 此时采用饱和处理策略，不会抛异常。
    return res
}

@OverflowThrowing
func testThrowing(x: Int8, y: Int8): Int8 {
    var res = x
    res += y // 此时采用抛异常策略。
    return res
}

main() {
    // wrapping
    let MIN_INT8: Int8 = -128
    let MAX_INT8: Int8 = 127
    let ret: Int8 = testWrapping(16, 4) // normal
    if (ret != 20) {
        return 1
    }
    let b: Int8 = MAX_INT8 - 15
    let ret1: Int8 = testWrapping(b, 16) // max overflow
    if (ret1 != MIN_INT8) {
        return 1
    }
    // saturating
    let ret2: Int8 = testSaturating(16, 4) // normal
    if (ret2 != 20) {
        return 1
    }
    let ret3: Int8 = testSaturating(b, 16) // max overflow
    if (ret3 != MAX_INT8) {
        return 1
    }
    // throwing
    let ret4: Int8 = testThrowing(16, 4) // normal
    if (ret4 != 20) {
        return 1
    }
    // max overflow
    let ret5: Int8 = try {
        testThrowing(b, 16)
    } catch (e: ArithmeticException) {
        print("ArithmeticException: add")
        0
    } finally {}
    return 0
}
