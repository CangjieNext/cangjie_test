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
    return x + y // 此时采用截断处理策略，不会抛异常。
}

@OverflowSaturating
func testSaturating(x: Int16, y: Int16): Int16 {
    return x + y // 此时采用饱和处理策略，不会抛异常。
}

@OverflowThrowing
func testThrowing(x: Int16, y: Int16): Int16 {
    return x + y // 此时采用抛异常策略。
}

main() {
    // wrapping
    let MIN_INT16: Int16 = -32768
    let MAX_INT16: Int16 = 32767
    let a: Int16 = MIN_INT16 + 15
    let ret: Int16 = testWrapping(a, -15) // min
    if (ret != MIN_INT16) {
        return 1
    }
    let ret1: Int16 = testWrapping(a, -16) // min overflow
    if (ret1 != MAX_INT16) {
        return 1
    }
    // saturating
    let ret2: Int16 = testSaturating(a, -15) // min
    if (ret2 != MIN_INT16) {
        return 1
    }
    let ret3: Int16 = testSaturating(a, -16) // min overflow
    if (ret3 != MIN_INT16) {
        return 1
    }
    // throwing
    let ret4: Int16 = testThrowing(a, -15) // min
    if (ret4 != MIN_INT16) {
        return 1
    }
    return 0
}
