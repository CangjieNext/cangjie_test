/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.math.*
import std.collection.*

public class B2Profile {
    public var step: Float64 = 0.0
    public var collide: Float64 = 0.0
    public var solve: Float64 = 0.0
    public var solveInit: Float64 = 0.0
    public var solveVelocity: Float64 = 0.0
    public var solvePosition: Float64 = 0.0
    public var broadPhase: Float64 = 0.0
    public var solveToi: Float64 = 0.0
    public init() {}
}

public class B2TimeStep {
    var dt: Float64 = 0.0
    var invDt: Float64 = 0.0
    var dtRatio: Float64 = 0.0
    var velocityIterations: Int64 = 0
    var positionIterations: Int64 = 0
    var warmStarting: Bool = false
}

open class B2Array<T> {
    var array = ArrayList<T>()
    public init(count!: ?Int64 = None,repeatedValue!: ?T =None) {
        if ((count.isSome() && repeatedValue.isSome())) {
            for (option in 0..count.getOrThrow()) {
                array.add(repeatedValue.getOrThrow())
            }
        }
    }
    open public func append( newElement!: T) {
        array.add(newElement)
    }
    open public func insert( newElement!: T, i!: Int64) {
        array.add(newElement, at: i)
    }
    open public func removeAtIndex( index!: Int64) : T {
        let ele = array[index]
        array.remove(at: index)
        return ele
    }
    open public func removeLast() {
        var index = array.size - 1
        array.remove(at: index)
    }
    open public func removeAll() {
        array.clear()
    }
    open public func get( index!: Int64) : T {
            return array[index]
        }
    open public func set( index!: Int64,  newValue!: T) {
        array[index] = newValue
    }
    open public func clone() : B2Array<T> {
        let clone = B2Array<T>()
        for (e in this.array) {
            clone.array.add(e)
        }
        return clone
    }   
    public prop count: Int64 {
        get() {
            array.size
        }
    }
}

public class B2Position {
    init( c: B2Vec2,  a: Float64) {
        this.c = c
        this.a = a
    }
    var c : B2Vec2
    var a : Float64
}

public class B2Velocity {
    init( v: B2Vec2,  w: Float64) {
        this.v = v
        this.w = w
    }
    var v : B2Vec2
    var w : Float64
}

public class B2SolverData {
    var step = B2TimeStep()
    var positions = B2Array<B2Position>()
    var velocities = B2Array<B2Velocity>()
}
