/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-NEG_abstract_unimpl | 抽象成员未实现 | 期望 DiagKind=sema_class_need_abstract_modifier_or_func_need_impl
 * 需求 design-spec §3/§6; dt-design 异常用例4 相关。final class 实现 interface 但漏一抽象成员,编译期拒绝。
 * 手写落地(已验证 cjc 拒绝 + DiagKind 匹配)。
 * 本用例不得作为 runtime trace 用例:预期编译失败。
 */
// Level: 1
// Description:
// NEG NEG_abstract_unimpl | final class 实现 interface 漏一抽象成员被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_class_need_abstract_modifier_or_func_need_impl。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_class_need_abstract_modifier_or_func_need_impl

package packageA

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Int64

    func bar(): Int64
}

class C <: I {
    public func foo(): Int64 {
        __trace.append("[C.foo]")
        1i64
    }
}

main(): Unit {
    let obj0: C = C()
    obj0.foo()
    if (__trace.toString() == "[C.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
