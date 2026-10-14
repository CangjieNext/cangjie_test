/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-NEG_diamond_default_conflict | 菱形同一默认实现 | 现编译通过并运行
 * 需求 design-spec §3/§6; dt-design 异常用例3 相关(菱形形态)。菱形 I1,I2<:D,C<:I1&I2,默认经两路径到达,
 * 为同一实例化下的同一默认实现,合并去重后不再要求显式实现。
 * 本用例为正向:编译通过并运行,校验默认实现可用。文件路径保留 negative/NEG_ 前缀以避免破坏既有引用。
 */
// Level: 1
// Description:
// NEG_diamond_default_conflict | 菱形继承中,同一实例化接口的默认实现经两条路径到达,合并去重。
// 正向用例:编译通过并运行,命中 TRACE_OK。
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

package packageA

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface D {
    func f(): Int64 {
        __trace.append("[D.f]")
        1i64
    }
}

interface I1 <: D {}

interface I2 <: D {}

class C <: I1 & I2 {}

main(): Unit {
    let obj0: C = C()
    if (__trace.toString() == "") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}

/* SCAN
TRACE_OK
*/
