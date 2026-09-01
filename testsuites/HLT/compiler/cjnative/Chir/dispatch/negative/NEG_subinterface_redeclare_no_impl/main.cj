/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 子接口仅重声明继承的默认实现但无新实现负向 | 期望 DiagKind=sema_invalid_override_or_redefine_member_in_interface
 * 需求 design-spec §3; SPEC §6 line1568:
 *   子接口如果继承了父接口中有默认实现的函数或属性,则在子接口中不允许仅写此函数或属性的声明而没有实现。
 * 构造: I1 有 foo 默认实现,I2 <: I1 仅声明 func foo() 无实现。
 *       应编译拒绝。
 * 本用例不得作为 runtime trace 用例: 预期编译失败。
 * cjc 1.3.0-alpha.02 实测: 拒绝, DiagKind=sema_invalid_override_or_redefine_member_in_interface。
 */
// Level: 1
// Description:
// NEG NEG_subinterface_redeclare_no_impl | 子接口重声明成员未实现被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_invalid_override_or_redefine_member_in_interface。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_invalid_override_or_redefine_member_in_interface

package geninst_neg_subiface

interface I1 {
    func foo(): Unit {}
}

interface I2 <: I1 {
    func foo(): Unit
}

main(): Unit {}
