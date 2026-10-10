/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 23 | same_direction_merge_dedup(属性):菱形继承同一接口默认属性。函数版编译通过(合并去重),但 cjc 1.3.0 实测属性版编译失败(sema_interface_member_must_be_implemented),按实测行为落负向。
// 负向用例:预期编译失败,不得作为 runtime trace 用例,不能进 unittest 框架。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_interface_member_must_be_implemented。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_interface_member_must_be_implemented

package geninst_pm23

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface Base {
    mut prop x: Int64 {
        get() {
            0
        }
        set(v) {
        }
    }
}
interface I1 <: Base {
}
interface I2 <: Base {
}
class C <: I1 & I2 {
    var _x: Int64 = 0
}

main(): Int64 {
    0
}
