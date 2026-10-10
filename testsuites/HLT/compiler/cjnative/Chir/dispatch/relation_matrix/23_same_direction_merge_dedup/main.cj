/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 23 | same_direction_merge_dedup (负向)
 * 候选来源：同方向（两条继承路径）到达同一默认实现；覆盖方向：同向合并去重。
 * 构造：接口 Base 提供 foo 默认实现；接口 I1 <: Base、I2 <: Base（同向继承同一默认）；
 *       class C <: I1 & I2 不实现 foo。预期合并去重选取 Base.foo，
 *       但 cjc 1.3.0 实测菱形同向到达同一默认仍要求显式实现 → 编译拒绝。
 * 与成员属性矩阵 23 同族同 DiagKind；按既有矩阵以实测行为为准落为负向。
 */
// Level: 1
// Description:
// 关系矩阵 23_same_direction_merge_dedup | 菱形同向合并(两路径到达同一接口默认),cjc 1.3.0 实测编译失败。
// 负向:编译断言失败 + --diagnostic-format json 命中 sema_interface_member_must_be_implemented。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_interface_member_must_be_implemented

package geninst_rm23

import std.collection.*

interface Base {
    func foo(): Unit {
    }
}

interface I1 <: Base {
}

interface I2 <: Base {
}

class C <: I1 & I2 {
}

main(): Int64 {
    0
}
