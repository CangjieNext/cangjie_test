/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*
import std.core.*
import std.convert.*
import std.convert.*

/*
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
    /*
     * @Benchmark
     */
    func benchmarkRun() {
        let loop120 = 20
        let start = Timer().getTime()
        for (option in 0 .. loop120) {
            runIteration()
        }
        let end = Timer().getTime()
        print("box2d: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
    }
    
    func runIteration() {
        runBox2D()
    }

    func runBox2D() {
        let times = 60.0
        let second = 1.0
        let loop20 = 20
        let velocityIterations = 10
        let positionIterations = 3
        let world = makeNewWorld()
        for (option in 0..loop20) {
            world.step(second/times, velocityIterations, positionIterations)
            log("position_y:${world.mBodyList.getOrThrow().position().gety()}")
        }
    }
    /*
     * @Setup
     */
    func makeNewWorld() : B2World {
        let loop5 = 5
        let loop10 = 10
        let density = 5.0
        let xX = -7.0
        let xY = 0.75
        let gravityY = -10.0
        let zero = 0.0
        let edgeV1X = -40.0
        let edgeV2X = 40.0
        let deltaXX = 0.5625
        let deltaXY = 1.0
        let deltaYX = 1.125
        let gravity = B2Vec2(x0: zero, y0: gravityY)
        let world = B2World(gravity)
        let shape = B2PolygonShape()
        shape.setAsEdge(B2Vec2(x0:edgeV1X,  y0:zero), B2Vec2(x0:edgeV2X, y0: zero))
        shape.radius = 0.0
        let fd = B2FixtureDef()
        fd.density = zero
        fd.shape = shape
        let bd = B2BodyDef()
        bd.`type` = B2BodyType.STATICBODY
        let ground = world.createBody(bd)
        ground.createFixture(fd)
        let a = 0.5
        let shape2 = B2PolygonShape()
        shape2.setAsBox(a, a)
        shape2.radius = 0.0
        var x = B2Vec2(x0: xX, y0: xY)
        var y = B2Vec2()
        let deltaX = B2Vec2(x0: deltaXX, y0: deltaXY)
        let deltaY = B2Vec2(x0: deltaYX, y0: zero)
        for (_ in 0..loop10) {
            y.set(x.x, x.y)
            for (_ in 0..loop5) {
                let fd = B2FixtureDef()
                fd.density = density
                fd.shape = shape2
                let bd = B2BodyDef()
                bd.`type` = B2BodyType.DYNAMICBODY
                bd.position.set(y.x, y.y)
                let body = world.createBody(bd)
                body.createFixture(fd)
                y = addEqual(y, deltaY)
            }
            x = addEqual(x, deltaX)
        }
        return world
    }
}



let isDebug : Bool = false
func log( msg : String){
    if (isDebug) {
        let prefix = "${msg}"
        println(prefix)
    }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}