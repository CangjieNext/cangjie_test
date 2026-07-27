/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class Collision {
    let aircraft: ArrayList<CallSign>
    let position: Vector3D
    
    init(aircraft: ArrayList<CallSign>, position: Vector3D) {
        this.aircraft = aircraft
        this.position = position
    }
}

extend Collision <: ToString {
    public func toString(): String {
        return "Collision(" + aircraft.toString() + " at " + position.toString() + ")"
    }
}