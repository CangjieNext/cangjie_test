/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

internal common struct Point {
    var x: Int64 = 0
    var y: Int64 = 0
    public common init (a: Int64, b: Int64) {
        x = a
        y = b
    }
    public common operator func -(): Point
    public operator common func +(right: Point): Point

    operator common func [](arg1: Int64, arg2: String): Int64
}
