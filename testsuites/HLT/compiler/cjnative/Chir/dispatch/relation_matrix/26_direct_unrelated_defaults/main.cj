/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 26 | direct_unrelated_defaults（负向）
 * 候选来源：两个无父子关系的接口各带同名默认实现；覆盖方向：无显式实现时冲突拒绝。
 * 构造：接口 I1 提供 foo 默认实现；接口 I2（与 I1 无父子关系）提供 foo 默认实现；
 *       class C <: I1 & I2 不实现 foo。两个无关默认冲突 → 编译失败。
 * 预期：编译失败，DiagKind=sema_interface_member_must_be_implemented。
 *       显式实现后命中本类型版本（见 TC-GENINST-MULTI-PARTIAL 正向侧）。
 *       本用例不得作为运行时 trace 用例。
 */
// Level: 1
// Description:
// 关系矩阵 26_direct_unrelated_defaults | 成员来源×覆盖方向决策矩阵负向,预期编译失败。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_interface_member_must_be_implemented。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_interface_member_must_be_implemented

package geninst_rm26

interface I1 {
    func foo(): Int64 {
        1
    }
}

interface I2 {
    func foo(): Int64 {
        2
    }
}

class C <: I1 & I2 {
}

main(): Int64 {
    0
}
