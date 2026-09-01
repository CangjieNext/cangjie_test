/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-NEG_unrelated_extend_conflict | 无父子关系扩展遮蔽 | 期望 DiagKind=sema_extend_member_cannot_shadow
 * 需求 design-spec §3/§6; dt-design 异常用例3 精确对应。两无关接口各带同名成员,两个 extend 各提供实现,编译期拒绝。
 * 对照:有父子关系时子接口默认覆盖父接口编译通过(case1/case4)。
 * 手写落地(已验证 cjc 拒绝 + DiagKind 匹配)。
 * 本用例不得作为 runtime trace 用例:预期编译失败。
 */
// Level: 1
// Description:
// NEG NEG_unrelated_extend_conflict | 无关 extend 成员冲突被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_extend_member_cannot_shadow。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_extend_member_cannot_shadow

package packageA

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func f(): Int64
}

interface I2 {
    func f(): Int64
}

class C {}

extend C <: I1 {
    public func f(): Int64 {
        __trace.append("[extend_C_I1.f]")
        1i64
    }
}

extend C <: I2 {
    public func f(): Int64 {
        __trace.append("[extend_C_I2.f]")
        1i64
    }
}

main(): Unit {
    let obj0: C = C()
    let ext0: I1 = C()
    ext0.f()
    let ext1: I2 = C()
    ext1.f()
    if (__trace.toString() == "[extend_C_I1.f][extend_C_I1.f]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
