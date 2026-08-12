/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class Aircraft {
    var callSign: CallSign
    var position: Vector3D
    
    init(callSign: CallSign, position: Vector3D) {
        this.callSign = callSign
        this.position = position
    }
}

class MyBool {
    var b: Bool = true
}

class CollisionDetector {
    var state: RedBlackTree = RedBlackTree()
    
    func handleNewFrame(frame: ArrayList<Aircraft>): ArrayList<Collision> {
        var motions: ArrayList<Motion> = ArrayList<Motion>()
        let seen: RedBlackTree = RedBlackTree()
        
        for (aircraft in frame) {
            let newPosition = aircraft.position
            seen.put(aircraft.callSign, MyBool())
            var oldPosition_Any = state.put(aircraft.callSign, aircraft.position)
            var oldPosition = Option<Vector3D>.None
            if (oldPosition_Any.isSome()) {
                oldPosition = oldPosition_Any.getOrThrow() as Vector3D
            }
            if (oldPosition.isNone()) {
                // Treat newly introduced aircraft as if they were stationary.
                oldPosition = newPosition
            }
            motions.add(Motion(aircraft.callSign, oldPosition.getOrThrow(), newPosition))
        }
        // Remove aircraft that are no longer present.
        let toRemove: ArrayList<CallSign> = ArrayList<CallSign>()
        state.forEach{ callSign: Object, position: Object => if (seen.get(callSign).isNone()) {
                toRemove.add((callSign as CallSign).getOrThrow())
        }}

        for (callSign in toRemove) {
            state.remove(callSign)
        }
        
        let allReduced = reduceCollisionSet(motions)
        var collisions: ArrayList<Collision> = ArrayList<Collision>()
        for (reduced in allReduced) {
            for (i in 0..reduced.size) {
                let motion1 = reduced[i]
                for (j in (i + 1)..reduced.size) {
                    let motion2 = reduced[j]
                    let collision = motion1.findIntersection(motion2)
                    if (collision.isSome()) {
                        collisions.add(Collision(ArrayList<CallSign>([motion1.callSign, motion2.callSign]), collision.getOrThrow()))
                    }
                }
            }
        }
        return collisions
    }
}
