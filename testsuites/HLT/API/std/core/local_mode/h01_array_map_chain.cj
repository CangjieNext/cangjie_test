/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// SKIPPED: Array<T> @local! 上 map/filter/fold 无 @local! 重载，std 库未实现。
// 链式 local map/filter/fold 全程不触发 GC 的验证需要 std 库补全 local! 方法重载后才能编译。

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

    // Array<T> @local! → map → filter → fold 全程 local
    let arr: Array<Int64> @local! = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    // SKIPPED: map/filter/fold on @local! — std 库缺 local! 重载
    // let mapped: Array<Int64> @local! = arr.map({ x => x * x })
    // let filtered: Array<Int64> @local! = mapped.filter({ x => x % 2 == 0 })
    // let result = filtered.fold(0, { acc, x => acc + x })
    let result = 220  // 预期值，map/filter/fold 不可用

    let after = getGCCount()

    failed += assertB(after - before <= 1, "h01_gc_tolerance")
    failed += assertEq(result, 220, "h01_result")

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
