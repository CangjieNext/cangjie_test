/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-NEG_sig_conflict | 返回类型冲突 | 期望 DiagKind=sema_return_type_incompatible
 * 需求 design-spec §3; dt-design 异常场景补充。两接口同名同参不同返回类型,class 共实现,编译期拒绝。
 * 手写落地(已验证 cjc 拒绝 + DiagKind 匹配)。
 * 本用例不得作为 runtime trace 用例:预期编译失败。
 */
// Level: 1
// Description:
// NEG NEG_sig_conflict | 签名冲突致返回类型不兼容被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_return_type_incompatible。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_return_type_incompatible

package packageA

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func f(): Int64
}

interface I2 {
    func f(): String
}

class C <: I1 & I2 {
    public func f(): Int64 {
        __trace.append("[C.f]")
        1i64
    }
}

main(): Unit {
    let obj0: C = C()
    obj0.f()
    if (__trace.toString() == "[C.f]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
