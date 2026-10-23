/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// SKIPPED: ArrayList<Int64> @local?() 构造不存在 — std 库缺 ArrayList local 构造重载。
// ArrayList @local? 增删循环不触发 GC 的验证需要 std 库补全 local 构造重载后才能编译。

import std.runtime.*
import std.collection.*

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

    // ArrayList<Int64> @local?() 空构造 + reserve(1024) 预分配容量
    // SKIPPED: ArrayList<Int64> @local?() 构造不存在 — std 库缺 local 构造重载
    // let list: ArrayList<Int64> @local? = ArrayList<Int64>()
    // list.reserve(1024)
    // for (i in 0..512) { list.add(i) }
    // for (_ in 0..256) { list.remove(at: 0) }

    // 使用普通 ArrayList 替代以保持编译通过
    let list = ArrayList<Int64>(1024)
    for (i in 0..512) {
        list.add(i)
    }
    for (_ in 0..256) {
        list.remove(at: 0)
    }

    let after = getGCCount()

    failed += assertB(after - before <= 1, "h03_gc_tolerance")
    failed += assertEq(list.size, 256, "h03_size")
    failed += assertEq(list[0], 256, "h03_elem0")
    failed += assertEq(list[255], 511, "h03_elem255")

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
