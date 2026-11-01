/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-NEG_generic_constraint | 泛型约束不满足 | 期望 DiagKind=sema_generic_type_argument_not_match_constraint
 * 需求 design-spec §3; dt-design 约束补充。泛型函数约束 T<:I,用不满足约束的 BBB 实例化,编译期拒绝。
 * 手写落地(已验证 cjc 拒绝 + DiagKind 匹配)。
 * 本用例不得作为 runtime trace 用例:预期编译失败。
 */
// Level: 1
// Description:
// NEG NEG_generic_constraint | 泛型实参不满足约束被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_generic_type_argument_not_match_constraint。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_generic_type_argument_not_match_constraint

package packageA

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func m(): Int64
}

open class BBB {
    public open func m(): Int64 {
        __trace.append("[BBB.m]")
        1i64
    }
}

class OK <: I {
    public func m(): Int64 {
        __trace.append("[OK.m]")
        1i64
    }
}

func g<T>(a: T): Unit where T <: I {
    a.m()
}

main(): Unit {
    let obj0: BBB = BBB()
    obj0.m()
    let obj1: OK = OK()
    obj1.m()
    g<BBB>(BBB())
    if (__trace.toString() == "[BBB.m][OK.m][BBB.m]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
