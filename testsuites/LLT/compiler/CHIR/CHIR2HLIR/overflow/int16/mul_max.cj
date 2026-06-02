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
    return x * y // 此时采用截断处理策略，不会抛异常。
}

@OverflowSaturating
func testSaturating(x: Int16, y: Int16): Int16 {
    return x * y // 此时采用饱和处理策略，不会抛异常。
}

@OverflowThrowing
func testThrowing(x: Int16, y: Int16): Int16 {
    return x * y // 此时采用抛异常策略。
}

main() {
    let MIN_INT16: Int16 = -32768
    let MAX_INT16: Int16 = 32767
    let a: Int16 = MIN_INT16 / 8
    let b: Int16 = 8
    let c: Int16 = -8
    let d: Int16 = -a
    // wrapping
    let ret: Int16 = testWrapping(16, 4) // normal
    if (ret != 64) {
        return 1
    }
    let ret1: Int16 = testWrapping(a, c) // max overflow
    if (ret1 != MIN_INT16) {
        return 1
    }
    let ret2: Int16 = testWrapping(d, b) // max overflow
    if (ret2 != MIN_INT16) {
        return 1
    }
    // saturating
    let ret3: Int16 = testSaturating(16, 4) // normal
    if (ret3 != 64) {
        return 1
    }
    let ret4: Int16 = testSaturating(a, c) // max overflow
    if (ret4 != MAX_INT16) {
        return 1
    }
    let ret5: Int16 = testSaturating(d, b) // max overflow
    if (ret5 != MAX_INT16) {
        return 1
    }
    // throwing
    let ret6: Int16 = testThrowing(16, 4) // normal
    if (ret6 != 64) {
        return 1
    }
    return 0
}
