/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.math.*

class Vector3D {
    var x: Float64
    var y: Float64
    let z: Float64
    
    init(x: Float64, y: Float64, z: Float64) {
        this.x = x
        this.y = y
        this.z = z
    }
    
    func plus(other: Vector3D): Vector3D {
        return Vector3D(x + other.x, y + other.y, z + other.z)
    }
    
    func minus(other: Vector3D): Vector3D {
        return Vector3D(x - other.x, y - other.y, z - other.z)
    }
    
    func dot(other: Vector3D): Float64 {
        return x * other.x + y * other.y + z * other.z
    }
    
    func squaredMagnitude(): Float64 {
        return dot(this)
    }
    
    func magnitude(): Float64 {
        return sqrt(squaredMagnitude())
    }
    
    func times(amount: Float64): Vector3D {
        return Vector3D(x * amount, y * amount, z * amount)
    }
    
    func as2D(): Vector2D {
        return Vector2D(x, y)
    }
}

extend Vector3D <: ToString {
    public func toString(): String {
        return "[" + x.toString() + ", " + y.toString() + ", " + z.toString() + "]"
    }
}
