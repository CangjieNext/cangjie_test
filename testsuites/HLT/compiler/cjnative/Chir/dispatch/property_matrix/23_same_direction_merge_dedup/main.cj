/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 23 | same_direction_merge_dedup(属性):菱形继承同一接口默认属性,同一实例化下合并去重。
// 正向用例:编译通过并运行。
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

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
