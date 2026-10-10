/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 扩展内禁止 override 修饰负向 | 期望 DiagKind=parse_illegal_modifier_in_scope
 * 需求 design-spec §3; SPEC §8 扩展的成员·修饰符:
 *   扩展内的函数定义不支持使用 open、override、redef、required 修饰。
 * 构造: extend Foo <: I 中使用 public override func f()。
 *       扩展成员不得 override 原有成员,应编译拒绝。
 * 本用例不得作为 runtime trace 用例: 预期编译失败。
 * cjc 1.3.0-alpha.02 实测: 拒绝, DiagKind=parse_illegal_modifier_in_scope。
 */
// Level: 1
// Description:
// NEG NEG_extend_forbidden_override | extend 中非法 override 修饰被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 parse_illegal_modifier_in_scope。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan parse_illegal_modifier_in_scope

package geninst_neg_ext_override

class Foo {
    public open func f(): Unit {}
}

interface I {
    func f(): Unit
}

extend Foo <: I {
    public override func f(): Unit {}
}

main(): Unit {
    let a = Foo()
    a.f()
}
