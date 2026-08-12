/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


class Vector2D {
    var x: Float64
    var y: Float64
    
    init(x: Float64, y: Float64) {
        this.x = x
        this.y = y
    }
    
    func plus(other: Vector2D): Vector2D {
        return Vector2D(x + other.x, y + other.y)
    }
    
    func minus(other: Vector2D): Vector2D {
        return Vector2D(x - other.x, y - other.y)
    }
    
    func compareTo(other: Vector2D): Int64 {
        let result = compareNumbers(x, other.x)
        if (result != 0) {
            return result
        }
        return compareNumbers(y, other.y)
    }
}

extend Vector2D <: ToString {
    public func toString(): String {
        return "[" + x.toString() + ", " + y.toString() + "]"
    }
}