/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-MULTI-PARENT | 无关默认冲突（负向侧）
 * 需求 design-spec §3(direct_unrelated_defaults)/§6。
 *
 * 构造：接口 I1、I2（无父子关系）各带同名 foo 默认实现；class C <: I1 & I2
 * 不提供显式实现。两个无关默认冲突 → 编译失败，无显式实现时被拒绝。
 * 本文件预期编译失败，不得作为 runtime trace 用例。
 * 预期 DiagKind=sema_interface_member_must_be_implemented（与菱形形态不同，此处是无关两接口）。
 */
// Level: 1
// Description:
// TC-GENINST-MULTI-PARENT | 无关默认冲突(负向侧),class 不提供显式实现,两无关默认冲突被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_interface_member_must_be_implemented。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_interface_member_must_be_implemented

package packageA

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
