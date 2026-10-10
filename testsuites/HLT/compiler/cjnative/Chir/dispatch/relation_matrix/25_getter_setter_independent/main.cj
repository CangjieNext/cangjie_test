/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 25 | getter_setter_independent（负向）
 * 候选来源：接口属性的 getter/setter；覆盖方向：类型只重写一侧时另一侧应保持父实现。
 * 构造：接口 I 声明 mut prop x 带 getter 与 setter；class C <: I 只重写 getter（不重写 setter）。
 *       期望 setter 保持接口默认实现（getter/setter 独立解析）。
 * 预期：仓颉编译器 1.3.0 实测要求属性必须同时实现 getter 与 setter，
 *       仅重写一侧时编译失败，DiagKind=sema_property_must_have_accessors。
 *       此为本套件记录的编译器真实行为（独立解析的意图由全重写正向用例 TC-GENINST-PROPERTY 佐证）。
 *       本用例不得作为运行时 trace 用例。
 */
// Level: 1
// Description:
// 关系矩阵 25_getter_setter_independent | 成员来源×覆盖方向决策矩阵负向,预期编译失败。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_property_must_have_accessors。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_property_must_have_accessors

package geninst_rm25

interface I {
    mut prop x: Int64 {
        get() { 0 }
        set(v) { }
    }
}

class C <: I {
    public mut prop x: Int64 {
        get() { 42 }
    }
}

main(): Int64 {
    0
}
