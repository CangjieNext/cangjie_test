/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common internal struct Point {
    var x: Int64 = 0
    var y: Int64 = 0
    common public init(a: Int64, b: Int64) {
        x = a
        y = b
    }
    common public operator func -(): Point
    common public operator func +(right: Point): Point

    common operator func [](arg1: Int64, arg2: String): Int64
}
