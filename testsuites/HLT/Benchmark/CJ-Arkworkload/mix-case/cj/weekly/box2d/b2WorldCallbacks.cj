/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

interface B2DestructionListener {
    func sayGoodbye(joint: B2Joint):Unit
    func sayGoodbye( fixture: B2Fixture):Unit
}

open class B2ContactFilter {
    func shouldCollide( fixtureA: B2Fixture, fixtureB: B2Fixture) : Bool {
        let filterA = fixtureA.filterData
        let filterB = fixtureB.filterData
        if (filterA.groupIndex == filterB.groupIndex && filterA.groupIndex != 0) {
            return filterA.groupIndex > 0
        }
        let collide = (filterA.maskBits & filterB.categoryBits) != 0 && (filterA.categoryBits & filterB.maskBits) != 0
        return collide
    }
}

public class B2ContactImpulse {
    var normalImpulses: ArrayList<Float64>
    var tangentImpulses: ArrayList<Float64>
    var count: Int64 = 0
    init() {
        normalImpulses = ArrayList<Float64>([])
        tangentImpulses = ArrayList<Float64>([])
        for (_ in 0 .. b2MaxManifoldPoints) {
            normalImpulses.add(0.0)
            tangentImpulses.add(0.0)
        }
    }
}

interface B2ContactListener {
    func beginContact( contact: B2Contact): Unit
    func endContact(contact: B2Contact): Unit
    func preSolve( contact: B2Contact,  oldManifold: B2Manifold): Unit
    func postSolve( contact: B2Contact,  impulse: B2ContactImpulse): Unit
}

class B2DefaultContactListener <: B2ContactListener {
    public func beginContact( contact : B2Contact) {}
    public func endContact( contact: B2Contact) {}
    public func preSolve( contact: B2Contact,  oldManifold: B2Manifold) {}
    public func postSolve( contact: B2Contact,  impulse: B2ContactImpulse) {}
}

interface B2QueryCallback {
    func reportFixture( fixture: B2Fixture) : Bool
}

interface B2QueryCallbackFunction {
    func queryBack(fixture: B2Fixture) : Bool
}

class B2QueryCallbackProxy <: B2QueryCallback {
    var callback: B2QueryCallbackFunction
    init(callback: B2QueryCallbackFunction) {
        this.callback = callback
    }
    public func reportFixture( fixture: B2Fixture) : Bool {
        return this.callback.queryBack(fixture)
    }
}

interface B2RayCastCallback {
    func reportFixture(fixture: B2Fixture,  point: B2Vec2,  normal: B2Vec2,  fraction: Float64) : Float64
}

interface B2RayCastCallbackFunction {
    func rayBack( fixture: B2Fixture,  point: B2Vec2,  normal: B2Vec2,  fraction: Float64) : Float64
}
class B2RayCastCallbackProxy <: B2RayCastCallback {
    var callback: B2RayCastCallbackFunction
    init(callback: B2RayCastCallbackFunction) {
        this.callback = callback
    }
    public func reportFixture( fixture: B2Fixture,  point: B2Vec2,  normal: B2Vec2,  fraction: Float64) : Float64 {
        return this.callback.rayBack(fixture, point, normal, fraction)
    }
}
