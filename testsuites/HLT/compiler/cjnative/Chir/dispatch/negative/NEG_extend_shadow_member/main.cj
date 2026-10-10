/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 扩展 shadow/reimplement 已有成员负向 | 期望 DiagKind=sema_extend_member_cannot_shadow
 * 需求 design-spec §3; SPEC §8:
 *   扩展不能 override/redef 原有成员;扩展不得 shadow 或重复实现目标类型已有同签名成员。
 * 构造: 类 Foo 已有 public func f(),extend Foo 再定义同签名 func f()。
 *       扩展不得遮蔽原有成员,应编译拒绝。
 * 本用例不得作为 runtime trace 用例: 预期编译失败。
 * cjc 1.3.0-alpha.02 实测: 拒绝, DiagKind=sema_ambiguous_match (伴随 sema_extend_member_cannot_shadow)。
 */
// Level: 1
// Description:
// NEG NEG_extend_shadow_member | extend 成员不能遮蔽既有成员被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_extend_member_cannot_shadow。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_extend_member_cannot_shadow

package geninst_neg_ext_shadow

class Foo {
    public func f(): Unit {}
}

extend Foo {
    public func f(): Unit {}
}

main(): Unit {
    let a = Foo()
    a.f()
}
