/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 扩展重复实现接口负向 | 期望 DiagKind=sema_extend_duplicate_interface
 * 需求 design-spec §3; SPEC §8 接口扩展:
 *   如果被扩展类型已经实现过某个接口,则不能通过扩展重复实现该接口
 *   (包含使用扩展实现过的接口)。
 * 构造: 类 C 已 <: I 实现 I,extend C <: I 再重复实现。
 *       应编译拒绝。
 * 本用例不得作为 runtime trace 用例: 预期编译失败。
 * cjc 1.3.0-alpha.02 实测: 拒绝, DiagKind=sema_extend_duplicate_interface。
 */
// Level: 1
// Description:
// NEG NEG_extend_duplicate_interface | extend 重复实现同一接口被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_extend_duplicate_interface。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_extend_duplicate_interface

package geninst_neg_ext_dup

interface I {
    func f(): Unit
}

class C <: I {
    public func f(): Unit {}
}

extend C <: I {}

main(): Unit {
    let a = C()
    a.f()
}
