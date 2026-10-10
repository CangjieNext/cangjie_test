/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-NEG_diamond_default_conflict | 菱形多默认冲突 | 期望 DiagKind=sema_interface_member_must_be_implemented
 * 需求 design-spec §3/§6; dt-design 异常用例3 相关(菱形形态)。菱形 I1,I2<:D,C<:I1&I2,默认经两路径到达,编译期拒绝。
 * 手写落地(已验证 cjc 拒绝 + DiagKind 匹配)。
 * 本用例不得作为 runtime trace 用例:预期编译失败。
 */
// Level: 1
// Description:
// NEG NEG_diamond_default_conflict | 菱形继承两默认冲突且无显式消歧被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_interface_member_must_be_implemented。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_interface_member_must_be_implemented

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
