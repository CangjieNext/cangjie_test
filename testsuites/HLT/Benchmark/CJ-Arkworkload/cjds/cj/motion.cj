/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.math.*

let TIMES_NUM: Float64 = 0.5
let DOT_TWO: Float64 = 2.0
let DOT_FOUR: Float64 = 4.0

extend Motion <: ToString {
    public func toString(): String {
        "Motion(" + callSign.toString() + " from " + posOne.toString() + " to " + posTwo.toString() + ")"
    }
}

class Motion {
    let callSign: CallSign
    let posOne: Vector3D
    let posTwo: Vector3D
    
    init(callSign: CallSign, posOne: Vector3D, posTwo: Vector3D) {
        this.callSign = callSign
        this.posOne = posOne
        this.posTwo = posTwo
    }
    
    func delta(): Vector3D {
        return this.posTwo.minus(posOne)
    }
    
    func findIntersection(other: Motion): ?Vector3D {
        let init1 = posOne
        let init2 = other.posOne
        let vec1 = delta()
        let vec2 = other.delta()
        let radius = Constants.PROXIMITY_RADIUS
        let a = vec2.minus(vec1).squaredMagnitude()
        if (a != 0.0) {
            let b = DOT_TWO * init1.minus(init2).dot(vec1.minus(vec2))
            let c = Float64(-radius * radius) + init2.minus(init1).squaredMagnitude()
            let discr = b * b - DOT_FOUR * a * c
            if (discr < 0.0) {
                return Option<Vector3D>.None
            }
            
            let v1 = (-b - sqrt(discr)) / (DOT_TWO * a)
            let v2 = (-b + sqrt(discr)) / (DOT_TWO * a)
            
            if (v1 <= v2 && ((v1 <= 1.0 && 1.0 <= v2) || (v1 <= 0.0 && 0.0 <= v2) || (0.0 <= v1 && v2 <= 1.0))) {
                // Pick a good "time" at which to report the collision.
                var v: Float64 = 0.0 
                if (v1 <= 0.0) {
                    // The collision started before this frame. Report it at the start of the frame.
                    v = 0.0
                } else {
                    // The collision started during this frame. Report it at that moment.
                    v = v1
                }
                
                let result1 = init1.plus(vec1.times(v))
                let result2 = init2.plus(vec2.times(v))
                
                let result = result1.plus(result2).times(TIMES_NUM)
                if (result.x >= Float64(Constants.MIN_X) &&
                    result.x <= Float64(Constants.MAX_X) &&
                    result.y >= Float64(Constants.MIN_Y) &&
                    result.y <= Float64(Constants.MAX_Y) &&
                    result.z >= Float64(Constants.MIN_Z) &&
                    result.z <= Float64(Constants.MAX_Z)) {
                    return result
                }
            }
            return Option<Vector3D>.None
        }
        
        let dist = init2.minus(init1).magnitude()
        if (dist <= Float64(radius)) {
            return init1.plus(init2).times(TIMES_NUM)
        }
        
        return Option<Vector3D>.None
    }

}
