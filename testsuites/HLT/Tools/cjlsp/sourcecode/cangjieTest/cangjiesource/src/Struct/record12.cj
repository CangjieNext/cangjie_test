/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Struct

struct CC12 {
    var x: Int32 = 0
    var y: Int32 = 0
    CC12(a: Int32, b: Int32) {
        x = a
        y = b
    }
    operator func -(): CC12 {
        return CC12(-x, -y)
    }
    operator func +(right: CC12): CC12 {
        return CC12(x + right.x, y + right.y)
    }
}

func test12() {
    let p1 = CC12(8, 16)
    let p2 = -p1
    let p3 = p1 + p2
}
