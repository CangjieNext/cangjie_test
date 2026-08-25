/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-NEG_static_instance_clash | static/实例状态冲突 | 期望 DiagKind=sema_static_and_non_static_member_cannot_have_same_name
 * 需求 design-spec §3; dt-design 异常用例5 精确对应(IsImplementationFunc static 状态不一致→noRelation)。
 * 接口 static f,类实例 f(static/非static 不一致),编译期拒绝。
 * 手写落地(已验证 cjc 拒绝 + DiagKind 匹配)。
 * 本用例不得作为 runtime trace 用例:预期编译失败。
 */
// Level: 1
// Description:
// NEG NEG_static_instance_clash | 静态与实例成员同名被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_static_and_non_static_member_cannot_have_same_name。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name

package packageA

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    public static func f(): Int64 {
        __trace.append("[I.f]")
        1i64
    }
}

class C <: I {
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
