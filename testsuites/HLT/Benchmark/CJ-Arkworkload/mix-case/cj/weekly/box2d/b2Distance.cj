/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.math.*

public var b2GjkMaxIters = 0

public class B2DistanceProxy {
    var mBuffer: B2Array<B2Vec2> = B2Array(count:indexTwo, repeatedValue:B2Vec2())
    var mVertices: ?B2Array<B2Vec2> = B2Array(count:1, repeatedValue:B2Vec2())
    var mCount = 0
    var mRadius: Float64 = 0.0
    public init( shape!: ?B2Shape = Option<B2Shape>.None,  index!: ?Int64 = Option<Int64>.None) {
        if ((shape.isSome())) {
            set((shape.getOrThrow()))
        }
    }
    
    public func set( shape: B2Shape) {
        match ( shape.getType()) {
        case CIRCLE =>
            let circle = (shape as B2CircleShape).getOrThrow()
            mVertices = circle.mp
            mCount = 1
            mRadius = circle.mRadius
        case POLYGON =>
            let polygon = (shape as B2PolygonShape).getOrThrow()
            mVertices = polygon.mVertices
            mCount = polygon.mCount
            mRadius = polygon.mRadius
        case EDGE =>
            let edge = (shape as B2EdgeShape).getOrThrow()
            mVertices = edge.mVertices
            mCount = b2MaxManifoldPoints
            mRadius = edge.mRadius
        case _ =>
            throw Exception("invalid params to set")
        }
    }
    
    public func getSupport( d: B2Vec2) : Int64 {
        var bestIndex = 0
        var bestValue = b2Dot22(mVertices.getOrThrow().get(index:0), d)
        for (i in 1 .. mCount) {
            let value = b2Dot22(mVertices.getOrThrow().get(index:i), d)
            if ((value > bestValue)) {
                bestIndex = i
                bestValue = value
            }
        }
        return bestIndex
    }
    
    public func getSupportVertex( d: B2Vec2) : B2Vec2 {
        var bestIndex = 0
        var bestValue = b2Dot22(mVertices.getOrThrow().get(index:0), d)
        for (i in 1 .. mCount) {
            let value = b2Dot22(mVertices.getOrThrow().get(index:i), d)
            if ((value > bestValue)) {
                bestIndex = i
                bestValue = value
            }
        }
        return mVertices.getOrThrow().get(index:bestIndex)
    }
    
    public func getVertexCount() : Int64 {
        return mCount
    }
    
    public func getVertex( index: Int64) : B2Vec2 {
        return mVertices.getOrThrow().get(index:index)
    }
}

class B2SimplexVertex {
    var wA = B2Vec2()
    var wB = B2Vec2()
    var w = B2Vec2()
    var a: Float64 = 0.0
    var indexA = 0
    var indexB = 0
    func set( other: B2SimplexVertex) {
        this.wA = other.wA
        this.wB = other.wB
        this.w = other.w
        this.a = other.a
        this.indexA = other.indexA
        this.indexB = other.indexB
    }
}

class B2Simplex {
    var mCount = 0
    init() {
        for (i in 0 .. indexThr) {
            mv.add(B2SimplexVertex())
        }
    }
    
    func readCache( cache: B2SimplexCache,  proxyA: B2DistanceProxy,  transformA: B2Transform,  proxyB: B2DistanceProxy,  transformB: B2Transform) {
        mCount = cache.size
        for (i in 0 .. mCount) {
            let v = mv[i]
            v.indexA = cache.indexA[i]
            v.indexB = cache.indexB[i]
            let wALocal = proxyA.getVertex(v.indexA)
            let wBLocal = proxyB.getVertex(v.indexB)
            v.wA = b2MulT2(transformA, wALocal)
            v.wB = b2MulT2(transformB, wBLocal)
            v.w = subtract(v.wB, v.wA)
            v.a = 0.0
        }
        if ((mCount > 1)) {
            let metric1 = cache.metric
            let metric2 = getMetric()
            if ((metric2 < half * metric1 || float2 * metric1 < metric2 || metric2 < b2Epsilon)) {
                mCount = 0
            }
        }
        if ((mCount == 0)) {
            let v = mv[0]
            v.indexA = 0
            v.indexB = 0
            let wALocal = proxyA.getVertex(0)
            let wBLocal = proxyB.getVertex(0)
            v.wA = b2MulT2(transformA, wALocal)
            v.wB = b2MulT2(transformB, wBLocal)
            v.w = subtract(v.wB, v.wA)
            v.a = 1.0
            mCount = 1
        }
    }
    
    func writeCache( cache: B2SimplexCache):  B2SimplexCache{
        cache.metric = getMetric()
        cache.size = mCount
        for (i in 0 .. mCount) {
            cache.indexA[i] = mv[i].indexA
            cache.indexB[i] = mv[i].indexB
        }
        return cache
    }
    
    func getSearchDirection() : B2Vec2 {
        match ( (mCount)) {
        case 1 =>
            return minus(mv1.w)
        case indexTwo =>
            let e12 = subtract(mv2.w, mv1.w)
            let sgn = b2Cross(e12, minus(mv1.w))
            if ((sgn > 0.0)) {
                return b2Cross21(1.0, e12)
            } else {
                return b2Cross12(e12, 1.0)
            }
        case _ =>
            throw Exception("invalid params to getSearchDirection")
        }
    }
    
    func getClosestPoint() : B2Vec2 {
        match ( (mCount)) {
        case 0 =>
            return b2Vec2Zero
        case 1 =>
            return mv1.w
        case indexTwo =>
            return add(multM(mv1.w, mv1.a), multM(mv2.w, mv2.a))
        case indexThr =>
            return b2Vec2Zero
        case _ =>
            return b2Vec2Zero
        }
    }
    
    func getWitnessPoints() : (pA: B2Vec2, pB: B2Vec2) {
        var pA = B2Vec2()
        var pB = B2Vec2()
        match ( (mCount)) {
        case 0 =>
            throw Exception("illegal state")
        case 1 =>
            pA = mv1.wA
            pB = mv1.wB
        case indexTwo =>
            pA = add(multM(mv1.wA, mv1.a), multM(mv2.wA, mv2.a))
            pB = add(multM(mv1.wB, mv1.a), multM(mv2.wB, mv2.a))
        case indexThr =>
            pA = add(add(multM(mv1.wA, mv1.a), multM(mv2.wA, mv2.a)), multM(mv3.wA, mv3.a))
            pB = pA
        case _ =>
            throw Exception("illegal state")
        }
        return (pA, pB)
    }
    
    func getMetric() : Float64 {
        match ( (mCount)) {
        case 0 =>
            return 0.0
        case 1 =>
            return 0.0
        case indexTwo =>
            return b2Distance(mv1.w, mv2.w)
        case indexThr =>
            return b2Cross(subtract(mv2.w, mv1.w), subtract( mv3.w, mv1.w))
        case _  =>
            return 0.0
        }
    }
    
    func solve2() {
        let w1 = mv1.w
        let w2 = mv2.w
        let e12 = subtract(w2, w1)
        let d122 = -b2Dot22(w1, e12)
        if ((d122 <= 0.0)) {
            mv1.a = 1.0
            mCount = 1
            return
        }
        let d121 = b2Dot22(w2, e12)
        if ((d121 <= 0.0)) {
            mv2.a = 1.0
            mCount = 1
            mv1 = mv2
            return
        }
        let invd12 = 1.0 / (d121 + d122)
        mv1.a = d121 * invd12
        mv2.a = d122 * invd12
        mCount = indexTwo
    }
    
    func solve3() {
        let w1 = mv1.w
        let w2 = mv2.w
        let w3 = mv3.w
        let e12 = subtract(w2, w1)
        let w1e12 = b2Dot22(w1, e12)
        let w2e12 = b2Dot22(w2, e12)
        let d121 = w2e12
        let d122 = -w1e12
        let e13 = subtract(w3, w1)
        let w1e13 = b2Dot22(w1, e13)
        let w3e13 = b2Dot22(w3, e13)
        let d131 = w3e13
        let d132 = -w1e13
        let e23 = subtract(w3,w2)
        let w2e23 = b2Dot22(w2, e23)
        let w3e23 = b2Dot22(w3, e23)
        let d231 = w3e23
        let d232 = -w2e23
        let n123 = b2Cross(e12, e13)
        let d1231 = n123 * b2Cross(w2, w3)
        let d1232 = n123 * b2Cross(w3, w1)
        let d1233 = n123 * b2Cross(w1, w2)
        if ((d122 <= 0.0 && d132 <= 0.0)) {
            mv1.a = 1.0
            mCount = 1
            return
        }
        if ((d121 > 0.0 && d122 > 0.0 && d1233 <= 0.0)) {
            let invd12 = 1.0 / (d121 + d122)
            mv1.a = d121 * invd12
            mv2.a = d122 * invd12
            mCount = indexTwo
            return
        }
        if ((d131 > 0.0 && d132 > 0.0 && d1232 <= 0.0)) {
            let invd13 = 1.0 / (d131 + d132)
            mv1.a = d131 * invd13
            mv3.a = d132 * invd13
            mCount = indexTwo
            mv2 = mv3
            return
        }
        if ((d121 <= 0.0 && d232 <= 0.0)) {
            mv2.a = 1.0
            mCount = 1
            mv1 = mv2
            return
        }
        if ((d131 <= 0.0 && d231 <= 0.0)) {
            mv3.a = 1.0
            mCount = 1
            mv1 = mv3
            return
        }
        if ((d231 > 0.0 && d232 > 0.0 && d1231 <= 0.0)) {
            let invd23 = 1.0 / (d231 + d232)
            mv2.a = d231 * invd23
            mv3.a = d232 * invd23
            mCount = indexTwo
            mv1 = mv3
            return
        }
        let invd123 = 1.0 / (d1231 + d1232 + d1233)
        mv1.a = d1231 * invd123
        mv2.a = d1232 * invd123
        mv3.a = d1233 * invd123
        mCount = indexThr
    }
    
    var mv = ArrayList<B2SimplexVertex>()
    public mut prop mv1: B2SimplexVertex{
        get(){
            mv[0]
        }
        set(v){
             mv[0].set(v)
        }
    }
    
    public mut prop mv2: B2SimplexVertex{
        get(){
            mv[1]
        }
        set(v){
             mv[1].set(v)
        }
    }
    
    public mut prop mv3: B2SimplexVertex{
        get(){
            mv[indexTwo]
        }
        set(v){
             mv[indexTwo].set(v)
        }
    }
}

public class B2SimplexCache {
    public var metric: Float64
    public var size: Int64
    public var indexA: ArrayList<Int64>
    public var indexB: ArrayList<Int64>
    public init() {
        metric = 0.0
        size = 0
        indexA = ArrayList<Int64>([0, 0, 0])
        indexB = ArrayList<Int64>([0, 0, 0])
    }
}

class B2DistanceInput {
    public var proxyA: B2DistanceProxy
    public var proxyB: B2DistanceProxy
    public var transformA: B2Transform
    public var transformB: B2Transform
    public var useRadii: Bool
    public init() {
        proxyA = B2DistanceProxy()
        proxyB = B2DistanceProxy()
        transformA = B2Transform()
        transformB = B2Transform()
        useRadii = false
    }
}

public class B2DistanceOutput {
    public var pointA: B2Vec2
    public var pointB: B2Vec2
    public var distance: Float64
    public var iterations: Int64
    public init() {
        pointA = B2Vec2()
        pointB = B2Vec2()
        distance = 0.0
        iterations = 0
    }
}

func b2DistanceM( output: B2DistanceOutput,  cache: B2SimplexCache,  input: B2DistanceInput): (B2DistanceOutput, B2SimplexCache) {
    let proxyA = input.proxyA
    let proxyB = input.proxyB
    let transformA = input.transformA
    let transformB = input.transformB
    var simplex = B2Simplex()
    simplex.readCache(cache, proxyA, transformA, proxyB, transformB)
    let kMaxIters = 20
    var saveA = [0,0,0]
    var saveB = [0,0,0]
    var saveCount = 0
    var distanceSqr1 = b2MaxFloat
    var distanceSqr2 = distanceSqr1
    var iter = 0
    while (iter < kMaxIters) {
        saveCount = simplex.mCount
        for (i in 0 .. saveCount) {
            saveA[i] = simplex.mv[i].indexA
            saveB[i] = simplex.mv[i].indexB
        }
        match ( simplex.mCount) {
        case 1 =>
            print("default")
        case indexTwo =>
            simplex.solve2()
        case indexThr =>
            simplex.solve3()
        case _ =>
            print("default")
        }
        if ((simplex.mCount == indexThr)) {
            break
        }
        let p = simplex.getClosestPoint()
        distanceSqr2 = p.lengthSquared()
        distanceSqr1 = distanceSqr2
        let d = simplex.getSearchDirection()
        if ((d.lengthSquared() < b2Epsilon * b2Epsilon)) {
            break
        }
        let vertex = simplex.mv[simplex.mCount]
        vertex.indexA = proxyA.getSupport(b2MulTR2(transformA.q, minus(d)))
        vertex.wA = b2MulT2(transformA, proxyA.getVertex(vertex.indexA))
        vertex.indexB = proxyB.getSupport(b2MulTR2(transformB.q, d))
        vertex.wB = b2MulT2(transformB, proxyB.getVertex(vertex.indexB))
        vertex.w = subtract(vertex.wB, vertex.wA)
        iter += 1
        var duplicate = false
        for (i in 0 .. saveCount) {
            if (vertex.indexA == saveA[i] && vertex.indexB == saveB[i]) {
                duplicate = true
                break
            }
        }
        if (duplicate) {
            break
        }
        simplex.mCount += 1
    }
    b2GjkMaxIters = max(b2GjkMaxIters, iter)
    let sget = simplex.getWitnessPoints()
    output.pointA = sget[0]
    output.pointB = sget[1]
    output.distance = b2Distance(output.pointA, output.pointB)
    output.iterations = iter
    var cache1 = simplex.writeCache(cache)
    if ((input.useRadii)) {
        let rA = proxyA.mRadius
        let rB = proxyB.mRadius
        if (output.distance > rA + rB && output.distance > b2Epsilon) {
            output.distance -= rA + rB
            var normal = subtract(output.pointB, output.pointA)
            normal.normalize()
            output.pointA = addEqual(output.pointA, multM(normal, rA))
            output.pointB = subtractEqual(output.pointB, multM(normal, rB))
        } else {
            let p = multM(add(output.pointA, output.pointB), half)
            output.pointA = p
            output.pointB = p
            output.distance = 0.0
        }
    }
    return (output, cache1)
}


