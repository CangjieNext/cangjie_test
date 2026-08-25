/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-CROSS-PACKAGE | 跨包扩展/缓存隔离 — 根包主入口
 * import pkg_a.*,泛型函数 g<T> 约束 T <: pkg_a.I,实例化到 pkg_a.A 时
 * 按需查询跨包命中 pkg_a.A.foo。验证跨包包可见性与孤儿规则正确、缓存不串包。
 * 跨包查询命中各自包的实例化版本(本包 A 实例化 foo 来自 pkg_a,不陈旧复用)。
 */
package geninst_cross_package

import std.collection.*
import pkg_a.*

var __trace: StringBuilder = StringBuilder()

func g<T>(x: T): Int64 where T <: I {
    x.foo()
}

main(): Int64 {
    let r = g<A>(A())
    if (r == 1) {
        println("TRACE_OK")
    } else {
        println("MISMATCH r=${r}")
    }
    0
}
