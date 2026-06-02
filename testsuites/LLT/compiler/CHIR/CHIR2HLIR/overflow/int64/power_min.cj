// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@OverflowWrapping
func testWrapping(x: Int64, y: UInt64): Int64 {
    x ** y // 此时采用截断处理策略，不会抛异常。
}

@OverflowSaturating
func testSaturating(x: Int64, y: UInt64): Int64 {
    x ** y // 此时采用饱和处理策略，不会抛异常。
}

@OverflowThrowing
func testThrowing(x: Int64, y: UInt64): Int64 {
    x ** y // 此时采用抛异常策略。
}

main() {
    let MIN_INT64: Int64 = -0x8000_0000_0000_0000
    let ret = testSaturating(-1, 5)
    println(ret)
    if (ret != -1) {
        return 1
    }
    let ret1 = testWrapping(-65536, 5)
    println(ret1)
    if (ret1 != 0) {
        return 2
    }
    let ret2 = testSaturating(-65536, 5)
    println(ret2)
    if (ret2 != MIN_INT64) {
        return 3
    }
    return 0
}
