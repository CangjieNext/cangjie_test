/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-PROPERTY-PARTIAL | getter/setter 部分重写（负向）
 * 需求 design-spec §7 property 部分重写：意图为 getter/setter 分别独立解析，
 * 未重写的一侧保持父实现。但仓颉编译器 1.3.0 实测要求属性必须同时实现 getter 与 setter，
 * 仅重写一侧时编译失败。本用例落地编译器真实行为，记录"部分重写被拒绝"。
 *
 * 构造：接口 I 声明 mut prop x（带 getter/setter 默认实现）；class C <: I
 * 只重写 getter（不重写 setter）。期望 setter 保持接口默认实现，
 * 但 cjc 拒绝此形态，DiagKind=sema_property_must_have_accessors。
 * 本文件预期编译失败，不得作为 runtime trace 用例。
 * 全重写正向侧见 TC-GENINST-PROPERTY。
 */
// Level: 1
// Description:
// TC-GENINST-PROPERTY-PARTIAL | getter/setter 部分重写(负向),仅重写一侧被编译器拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_property_must_have_accessors。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_property_must_have_accessors

package packageA

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
