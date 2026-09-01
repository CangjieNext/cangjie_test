/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 协变返回类型不兼容负向 | 期望 DiagKind=sema_return_type_incompatible
 * 需求 design-spec §7 case7 负向边界; SPEC §6 line1818:
 *   覆盖函数返回类型与被覆盖函数返回类型相同或为其子类型,不满足型变关系不能作为子类型依据。
 * 构造: I1.foo 返回 Return1,A1.foo 返回 Unrelated(Unrelated 与 Return1 无父子关系)。
 *       返回类型不满足协变子类型关系,应编译拒绝,而非被视为同一覆盖目标。
 * 本用例不得作为 runtime trace 用例: 预期编译失败。
 * cjc 1.3.0-alpha.02 实测: 拒绝, DiagKind=sema_return_type_incompatible (伴随 sema_unexpected_return_type_for_entry)。
 */
// Level: 1
// Description:
// NEG NEG_covariant_return_incompatible | 协变返回类型不兼容(非子类型关系)被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_return_type_incompatible。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_return_type_incompatible

package geninst_neg_cov

open class Return1 {}

class Unrelated {}

interface I1 {
    func foo(): Return1
}

class A1 <: I1 {
    public func foo(): Unrelated {
        Unrelated()
    }
}

main(): Unit {
    let a = A1()
    a.foo()
}
