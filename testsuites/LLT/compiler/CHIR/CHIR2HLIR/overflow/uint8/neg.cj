// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan ArithmeticException: neg

@OverflowWrapping
func testWrapping(x: UInt8): UInt8 {
    -x // 此时采用截断处理策略，不会抛异常。
}

@OverflowSaturating
func testSaturating(x: UInt8): UInt8 {
    -x // 此时采用饱和处理策略，不会抛异常。
}

@OverflowThrowing
func testThrowing(x: UInt8): UInt8 {
    -x // 此时采用抛异常策略。
}

main() {
    let MIN_UINT8: UInt8 = 0
    let MAX_UINT8: UInt8 = 255
    let a: UInt8 = MAX_UINT8
    let ret: UInt8 = testWrapping(a)
    if (ret != 1) {
        return 1
    }
    let ret1: UInt8 = testSaturating(a)
    if (ret1 != 0) {
        return 1
    }
    // min overflow
    let ret2: UInt8 = try {
        testThrowing(a)
    } catch (e: ArithmeticException) {
        print("ArithmeticException: neg")
        0
    } finally {}
    return 0
}
