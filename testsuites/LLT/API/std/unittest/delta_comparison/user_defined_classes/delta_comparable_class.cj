/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package std.unittest.delta_util

import std.unittest.NearEquatable
import std.math.sqrt

public class Point2D <: NearEquatable<Point2D, Float64> {
    public Point2D(private let _x: Float64, private let _y: Float64) {}

    prop x: Float64 {
        get() { _x }
    }

    prop y: Float64 {
        get() { _y }
    } 

    public func isNear(point: Point2D, delta!: Float64): Bool {
        println("XXX: ${sqrt((x - point.x) ** 2 + (y - point.y) ** 2)}")
        sqrt((x - point.x) ** 2 + (y - point.y) ** 2) < delta
    }
}
