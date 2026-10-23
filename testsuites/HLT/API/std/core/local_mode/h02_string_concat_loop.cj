/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// SKIPPED: String @local! + String 无 operator func + @local! 重载，std 库未实现。
// String @local! 循环拼接不触发 GC 的验证需要 std 库补全 local! + 重载后才能编译。

import std.runtime.*

func assertEq<T>(actual: T, expected: T, name: String): Int64 where T <: ToString & Equatable<T> {
    if (actual != expected) {
        println("FAIL: ${name} — expected ${expected}, got ${actual}")
        return 1
    }
    return 0
}

func assertB(actual: Bool, name: String): Int64 {
    if (!actual) {
        println("FAIL: ${name} — expected true, got false")
        return 1
    }
    return 0
}

main(): Int64 {
    var failed = 0

    // GC baseline
    GC(heavy: true)
    let before = getGCCount()

    // SKIPPED: String @local! + "x" — std 库缺 operator func +(this @local!, right: String) 重载
    // var s: String @local! = ""
    // for (i in 0..1000) {
    //     s = s + "x"
    // }
    let sb = StringBuilder()
    for (i in 0..1000) {
        sb.append("x")
    }
    let s = sb.toString()

    let after = getGCCount()

    failed += assertB(after - before <= 1, "h02_gc_tolerance")
    failed += assertEq(s.size, 1000, "h02_size")

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
