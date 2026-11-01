/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-NEG_generic_mismatch | generic 状态不一致 | 期望 DiagKind=sema_return_type_incompatible
 * 需求 design-spec §3; dt-design 异常用例6 精确对应(IsImplementationFunc generic 状态不一致→noRelation)。
 * 接口泛型 foo<T>,类非泛型 foo(generic 状态不一致),编译期拒绝。
 * 正向:两者均 generic 时 GenerateGenericMappingFromGeneric 代入后 IsFuncTySubType 判定正确。
 * 手写落地(已验证 cjc 拒绝 + DiagKind 匹配)。
 * 本用例不得作为 runtime trace 用例:预期编译失败。
 */
// Level: 1
// Description:
// NEG NEG_generic_mismatch | 泛型成员 generic 状态不一致致返回类型不兼容被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_return_type_incompatible。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_return_type_incompatible

package packageA

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo<T>(): T
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
