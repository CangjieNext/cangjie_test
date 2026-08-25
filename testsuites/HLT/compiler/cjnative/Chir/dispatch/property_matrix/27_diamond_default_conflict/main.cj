/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 27 | diamond_default_conflict(属性):菱形继承 I,J/K 各重声明默认属性,C 同时实现 J&K 不实现 x。两不同默认经菱形到达 → 编译失败(属性版实测,与函数版行为不同)。
// 负向用例:预期编译失败,不得作为 runtime trace 用例,不能进 unittest 框架。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_interface_member_must_be_implemented。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_interface_member_must_be_implemented

package geninst_pm27

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    mut prop x: Int64 {
        get() {
            1
        }
        set(v) {
        }
    }
}
interface J <: I {
    mut prop x: Int64 {
        get() {
            2
        }
        set(v) {
        }
    }
}
interface K <: I {
    mut prop x: Int64 {
        get() {
            3
        }
        set(v) {
        }
    }
}
class C <: J & K {
    var _x: Int64 = 0
}

main(): Int64 {
    0
}
