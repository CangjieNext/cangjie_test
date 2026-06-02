// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 

@OverflowWrapping
func testWrapping(x: Int16, y: Int16): Int16 {
    var res = x
    res -= y // 此时采用截断处理策略，不会抛异常。
    return res
}

@OverflowSaturating
func testSaturating(x: Int16, y: Int16): Int16 {
    var res = x
    res -= y // 此时采用饱和处理策略，不会抛异常。
    return res
}

@OverflowThrowing
func testThrowing(x: Int16, y: Int16): Int16 {
    var res = x
    res -= y // 此时采用抛异常策略。
    return res
}

main() {
    let MIN_INT16: Int16 = -32768
    let MAX_INT16: Int16 = 32767
    let a: Int16 = MAX_INT16 - 15
    // wrapping
    let ret: Int16 = testWrapping(16, 4) // normal
    if (ret != 12) {
        return 1
    }
    let ret1: Int16 = testWrapping(a, -16) // max overflow
    if (ret1 != MIN_INT16) {
        return 1
    }
    // saturating
    let ret2: Int16 = testSaturating(16, 4) // normal
    if (ret2 != 12) {
        return 1
    }
    let ret3: Int16 = testSaturating(a, -16) // max overflow
    if (ret3 != MAX_INT16) {
        return 1
    }
    let ret4: Int16 = testSaturating(0, MIN_INT16) // max overflow
    if (ret4 != MAX_INT16) {
        return 1
    }
    // throwing
    let ret5: Int16 = testThrowing(16, 4) // normal
    if (ret5 != 12) {
        return 1
    }
    return 0
}
