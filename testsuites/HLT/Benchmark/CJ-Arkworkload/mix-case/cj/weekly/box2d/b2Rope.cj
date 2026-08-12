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

public class B2RopeDef {
    var vertices: ?ArrayList<B2Vec2>
    var count: Int64
    var masses: ?ArrayList<Float64>
    var gravity: B2Vec2
    var damping: Float64
    var k2: Float64
    var k3: Float64
    init() {
        vertices = Option<ArrayList<B2Vec2>>.None
        count = 0
        masses = Option<ArrayList<Float64>>.None
        gravity = B2Vec2()
        damping = 0.1
        k2 = 0.9
        k3 = 0.1
    }
}

open class B2Rope {
    var mCount: Int64
    var mps: ?ArrayList<B2Vec2> = Option<ArrayList<B2Vec2>>.None
    var mp0s: ?ArrayList<B2Vec2> = Option<ArrayList<B2Vec2>>.None
    var mvs: ?ArrayList<B2Vec2> = Option<ArrayList<B2Vec2>>.None
    var mims: ?ArrayList<Float64> = Option<ArrayList<Float64>>.None
    var mLs: ?ArrayList<Float64> = Option<ArrayList<Float64>>.None
    var mas: ?ArrayList<Float64> = Option<ArrayList<Float64>>.None
    var mGravity: B2Vec2
    var mDamping: Float64
    var mk2: Float64
    var mk3: Float64
    init() {
        mCount = 0
        mps = ArrayList<B2Vec2>()
        mp0s =  ArrayList<B2Vec2>()
        mvs =  ArrayList<B2Vec2>()
        mims = ArrayList<Float64>()
        mLs = ArrayList<Float64>()
        mas = ArrayList<Float64>()
        mGravity = B2Vec2(x0:0.0, y0:0.0)
        mDamping = 0.1
        mk2 = 1.0
        mk3 = 0.1
    }
    
    func initialize( def: B2RopeDef) {
        mCount = def.count
        mps = ArrayList<B2Vec2>()
        mp0s = ArrayList<B2Vec2>()
        mvs = ArrayList<B2Vec2>()
        mims = ArrayList<Float64>()
        for (option in 0 .. mCount) {
            mps.getOrThrow().add(B2Vec2())
            mp0s.getOrThrow().add(B2Vec2())
            mvs.getOrThrow().add(B2Vec2())
            mims.getOrThrow().add(Float64(0.0))
        }
        for (i in 0 .. mCount) {
            mps.getOrThrow()[i] = def.vertices.getOrThrow().get(i).getOrThrow()
            mp0s.getOrThrow()[i] = def.vertices.getOrThrow().get(i).getOrThrow()
            mvs.getOrThrow().get(i).getOrThrow().setZero()
            let m = def.masses.getOrThrow().get(i)
            if (m.getOrThrow() > 0.0) {
                mims.getOrThrow()[i] = 1.0 / m.getOrThrow()
            } else {
                mims.getOrThrow()[i] = 0.0
            }
        }
        let count2 = mCount - 1
        let count3 = mCount - indexTwo
        mLs = ArrayList<Float64>()
        for (option in 0 .. count2) {
            mLs.getOrThrow().add(Float64(0.0))
        }
        mas = ArrayList<Float64>()
        for (option in 0 .. count3) {
            mas.getOrThrow().add(Float64(0.0))
        }
        for (i in 0 .. count2) {
            let p1 = mps.getOrThrow().get(i).getOrThrow()
            let p2 = mps.getOrThrow().get(i+1).getOrThrow()
            mLs.getOrThrow()[i] = b2Distance(p1, p2)
        }
        for (i in 0 .. count3) {
            let p1 = mps.getOrThrow().get(i).getOrThrow()
            let p2 = mps.getOrThrow().get(i+1).getOrThrow()
            let p3 = mps.getOrThrow().get(i+ indexTwo).getOrThrow()
            let d1 = subtract(p2, p1)
            let d2 = subtract(p3, p2)
            let a = b2Cross(d1, d2)
            let b = b2Dot22(d1, d2)
            mas.getOrThrow()[i] = b2Atan2(a, b)
        }
        mGravity = def.gravity
        mDamping = def.damping
        mk2 = def.k2
        mk3 = def.k3
    }
    
    func step( h: Float64,  iterations: Int64) {
        if (h == 0.0) {
            return
        }
        let d = exp(-h * mDamping)
        for (i in 0 .. mCount) {
            mp0s.getOrThrow()[i] = mps.getOrThrow().get(i).getOrThrow()
            if (mims.getOrThrow().get(i).getOrThrow() > 0.0) {
                addEqual(mvs.getOrThrow().get(i).getOrThrow(), multM(mGravity, h))
            }
            mulEqual(a:mvs.getOrThrow().get(i).getOrThrow(), b:d)
            addEqual(mps.getOrThrow().get(i).getOrThrow(), multM(mvs.getOrThrow().get(i).getOrThrow(), h))
        }
        for (option in 0 .. iterations) {
            solveC2()
            solveC3()
            solveC2()
        }
        let invh = 1.0 / h
        for (i in 0 .. mCount) {
            mvs.getOrThrow()[i] = multM(subtract(mps.getOrThrow().get(i).getOrThrow(), mp0s.getOrThrow().get(i).getOrThrow()), invh)
        }
    }
    
    
    func setAngle( angle: Float64) {
        let count3 = mCount - indexTwo
        for (i in 0 .. count3) {
            mas.getOrThrow()[i] = angle
        }
    }
    
    func solveC2() {
        let count2 = mCount - 1
        for (i in 0 .. count2) {
            var p1 = mps.getOrThrow().get(i).getOrThrow()
            var p2 = mps.getOrThrow().get(i+1).getOrThrow()
            var d = subtract(p2, p1)
            let L = d.normalize()
            let im1 = mims.getOrThrow().get(i).getOrThrow()
            let im2 = mims.getOrThrow().get(i+1).getOrThrow()
            if (im1 + im2 == 0.0) {
                continue
            }
            let s1 = im1 / (im1 + im2)
            let s2 = im2 / (im1 + im2)
            subtractEqual(p1, multM(d, mk2 * s1 * (mLs.getOrThrow().get(i).getOrThrow() - L)))
            addEqual(p2, multM(d, mk2 * s2 * (mLs.getOrThrow().get(i).getOrThrow() - L)))
            mps.getOrThrow()[i] = p1
            mps.getOrThrow()[i+1] = p2
        }
    }
    
    func solveC3() {
        let count3 = mCount - indexTwo
        for (i in 0 .. count3) {
            var p1 = mps.getOrThrow().get(i).getOrThrow()
            var p2 = mps.getOrThrow().get(i+1).getOrThrow()
            var p3 = mps.getOrThrow().get(i+ indexTwo).getOrThrow()
            let m1 = mims.getOrThrow().get(i).getOrThrow()
            let m2 = mims.getOrThrow().get(i+1).getOrThrow()
            let m3 = mims.getOrThrow().get(i+ indexTwo).getOrThrow()
            let d1 = subtract(p2, p1)
            let d2 = subtract(p3, p2)
            let l1sqr = d1.lengthSquared()
            let l2sqr = d2.lengthSquared()
            if (l1sqr * l2sqr == 0.0) {
                continue
            }
            let a = b2Cross(d1, d2)
            let b = b2Dot22(d1, d2)
            var angle = b2Atan2(a, b)
            let jd1 = multM(d1.skew(), -1.0 / l1sqr)
            let jd2 = multM(d2.skew(), 1.0 / l2sqr)
            let j1 = minus(jd1)
            let j2 = subtract(jd1, jd2)
            let j3 = jd2
            var mass = m1 * b2Dot22(j1, j1) + m2 * b2Dot22(j2, j2) + m3 * b2Dot22(j3, j3)
            if (mass == 0.0) {
                continue
            }
            mass = 1.0 / mass
            var c = angle - mas.getOrThrow().get(i).getOrThrow()
            while (c > b2PI) {
                angle -= float2 * b2PI
                c = angle - mas.getOrThrow().get(i).getOrThrow()
            }
            while (c < -b2PI) {
                angle += float2 * b2PI
                c = angle - mas.getOrThrow().get(i).getOrThrow()
            }
            let impulse = -mk3 * mass * c
            addEqual(p1, multM(j1, m1 * impulse))
            addEqual(p2, multM(j2, m2 * impulse))
            addEqual(p3, multM(j3, m3 * impulse))
            mps.getOrThrow()[i] = p1
            mps.getOrThrow()[i+1] = p2
            mps.getOrThrow()[i + indexTwo] = p3
        }
    }
 
}
