/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.math.*

public var b2ToiMaxIters = 0
public var b2ToiMaxRootIters = 0

public class B2ToiInput {
    public init() {}
    public var proxyA = B2DistanceProxy()
    public var proxyB = B2DistanceProxy()
    public var sweepA = B2Sweep()
    public var sweepB = B2Sweep()
    public var tMax: Float64 = 0.0
}

public enum State {
    | UNKNOWN
    | FAILED
    | OVERLAPPED
    | TOUCHING
    | SEPARATED
   public func getValue(){
        match(this){
            case UNKNOWN => return 0
            case FAILED => return 1
            case OVERLAPPED => return 2
            case TOUCHING => return 3
            case SEPARATED => return 4 
            case _=> throw Exception("invalid value for input of getValue")              
        }
   } 
}

public class B2ToiOutput {
    public init() {}
    public var state = State.UNKNOWN
    public var t: Float64 = 0.0
}

public func b2TimeOfImpact( output: B2ToiOutput,  input: B2ToiInput) {
    output.state = State.UNKNOWN
    output.t = input.tMax
    let proxyA = input.proxyA
    let proxyB = input.proxyB
    var sweepA = input.sweepA
    var sweepB = input.sweepB
    sweepA.normalize()
    sweepB.normalize()
    let tMax = input.tMax
    let totalRadius = proxyA.mRadius + proxyB.mRadius
    let target = max(b2LinearSlop, totalRadius - float3 * b2LinearSlop)
    let tolerance = float025 * b2LinearSlop
    var t1: Float64 = 0.0
    let kMaxIterations = 20
    var iter = 0
    var cache = B2SimplexCache()
    cache.size = 0
    let distanceInput = B2DistanceInput()
    distanceInput.proxyA = input.proxyA
    distanceInput.proxyB = input.proxyB
    distanceInput.useRadii = false
    while (true) {
        let xfA = sweepA.getTransform(t1)
        let xfB = sweepB.getTransform(t1)
        distanceInput.transformA = xfA
        distanceInput.transformB = xfB
        var distanceOutput = B2DistanceOutput()
        (distanceOutput, cache) = b2DistanceM(distanceOutput, cache, distanceInput)
        if (distanceOutput.distance <= 0.0) {
            output.state = State.OVERLAPPED
            output.t = 0.0
            break
        }
        if (distanceOutput.distance < target + tolerance) {
            output.state = State.TOUCHING
            output.t = t1
            break
        }
        let fcn = B2SeparationFunction()
        fcn.initialize(cache, proxyA, sweepA, proxyB, sweepB, t1)
        var done = false
        var t2 = tMax
        var pushBackIter = 0
        while (true) {
            var s2: Float64
            var indexA: Int64
            var indexB: Int64
            (s2, indexA, indexB) = fcn.findMinSeparation(t2)
            
            if (s2 > target + tolerance) {
                output.state = State.SEPARATED
                output.t = tMax
                done = true
                break
            }
            if (s2 > target - tolerance) {
                t1 = t2
                break
            }
            var s1 = fcn.evaluate(indexA, indexB, t1)
            if (s1 < target - tolerance) {
                output.state = State.FAILED
                output.t = t1
                done = true
                break
            }
            if (s1 <= target + tolerance) {
                output.state = State.TOUCHING
                output.t = t1
                done = true
                break
            }
            var rootIterCount = 0
            var a1 = t1
            var a2 = t2
            while (true) {
                var t: Float64
                if (((rootIterCount & 1) != 0)) {
                    t = a1 + (target - s1) * (a2 - a1) / (s2 - s1)
                } else {
                    t = half * (a1 + a2)
                }
                rootIterCount += 1
                let s = fcn.evaluate(indexA, indexB, t)
                if ((abs(s - target) < tolerance)) {
                    t2 = t
                    break
                }
                if ((s > target)) {
                    a1 = t
                    s1 = s
                } else {
                    a2 = t
                    s2 = s
                }
                if ((rootIterCount == floopCount)) {
                    break
                }
            }
            b2ToiMaxRootIters = max(b2ToiMaxRootIters, rootIterCount)
            pushBackIter += 1
            if (pushBackIter == b2MaxPolygonVertices) {
                break
            }
        }
        iter += 1
        if ((done)) {
            break
        }
        if ((iter == kMaxIterations)) {
            output.state = State.FAILED
            output.t = t1
            break
        }
    }
    b2ToiMaxIters = max(b2ToiMaxIters, iter)
}


public enum TYPE {
    | POINTS
    | FACEA
    | FACEB
    public func getValue(){
        match(this){
            case POINTS => return 0
            case FACEA => return 1
            case FACEB => return 2
            case _=> throw Exception("invalid value for input of get getRawValue")
        }
    }
}

open class B2SeparationFunction {
    var mProxyA = B2DistanceProxy()
    var mProxyB = B2DistanceProxy()
    var mSweepA = B2Sweep()
    var mSweepB = B2Sweep()
    var mType = TYPE.POINTS
    var mLocalPoint = B2Vec2()
    var mAxis = B2Vec2()

    func initialize( cache: B2SimplexCache,  proxyA: B2DistanceProxy,  sweepA: B2Sweep,  proxyB: B2DistanceProxy,  sweepB: B2Sweep,  t1: Float64) : Float64 {
        mProxyA = proxyA
        mProxyB = proxyB
        let count = cache.size
        mSweepA = sweepA
        mSweepB = sweepB
        let xfA = mSweepA.getTransform(t1)
        let xfB = mSweepB.getTransform(t1)
        if (count == 1) {
            mType = TYPE.POINTS
            let localPointA = mProxyA.getVertex(cache.indexA[0])
            let localPointB = mProxyB.getVertex(cache.indexB[0])
            let pointA = b2MulT2(xfA, localPointA)
            let pointB = b2MulT2(xfB, localPointB)
            mAxis = subtract(pointB, pointA)
            let s = mAxis.normalize()
            return s
        } else if (cache.indexA[0] == cache.indexA[1]) {
            mType = TYPE.FACEB
            let localPointB1 = proxyB.getVertex(cache.indexB[0])
            let localPointB2 = proxyB.getVertex(cache.indexB[1])
            mAxis = b2Cross12(subtract(localPointB2, localPointB1), 1.0)
            mAxis.normalize()
            let normal = b2MulR2(xfB.q, mAxis)
            mLocalPoint = multM(add(localPointB1, localPointB2), half)
            let pointB = b2MulT2(xfB, mLocalPoint)
            let localPointA = proxyA.getVertex(cache.indexA[0])
            let pointA = b2MulT2(xfA, localPointA)
            var s = b2Dot22(subtract(pointA, pointB), normal)
            if (s < 0.0) {
                mAxis = minus(mAxis)
                s = -s
            }
            return s
        } else {
            mType = TYPE.FACEA
            let localPointA1 = mProxyA.getVertex(cache.indexA[0])
            let localPointA2 = mProxyA.getVertex(cache.indexA[1])
            mAxis = b2Cross12(subtract(localPointA2, localPointA1), 1.0)
            mAxis.normalize()
            let normal = b2MulR2(xfA.q, mAxis)
            mLocalPoint = multM(add(localPointA1, localPointA2), half)
            let pointA = b2MulT2(xfA, mLocalPoint)
            let localPointB = mProxyB.getVertex(cache.indexB[0])
            let pointB = b2MulT2(xfB, localPointB)
            var s = b2Dot22(subtract(pointB, pointA), normal)
            if (s < 0.0) {
                mAxis = minus(mAxis)
                s = -s
            }
            return s
        }
    }
    
    func findMinSeparation( t: Float64) : (Float64, Int64, Int64) {
        var indexA: Int64
        var indexB: Int64
        let xfA = mSweepA.getTransform(t)
        let xfB = mSweepB.getTransform(t)
        match ( mType) {
        case TYPE.POINTS =>
            let axisA1 = b2MulTR2(xfA.q,  mAxis)
            let axisB1 = b2MulTR2(xfB.q, minus(mAxis))
            indexA = mProxyA.getSupport(axisA1)
            indexB = mProxyB.getSupport(axisB1)
            let localPointA1 = mProxyA.getVertex(indexA)
            let localPointB1 = mProxyB.getVertex(indexB)
            let pointA1 = b2MulT2(xfA, localPointA1)
            let pointB1 = b2MulT2(xfB, localPointB1)
            let separation1 = b2Dot22(subtract(pointB1, pointA1), mAxis)
            return (separation1, indexA, indexB)
        case TYPE.FACEA =>
            let normal2 = b2MulR2(xfA.q, mAxis)
            let pointA2 = b2MulT2(xfA, mLocalPoint)
            let axisB = b2MulTR2(xfB.q, minus(normal2))
            indexA = -1
            indexB = mProxyB.getSupport(axisB)
            let localPointB = mProxyB.getVertex(indexB)
            let pointB2 = b2MulT2(xfB, localPointB)
            let separation2 = b2Dot22(subtract(pointB2, pointA2), normal2)
            return (separation2, indexA, indexB)
        case TYPE.FACEB =>
            let normal = b2MulR2(xfB.q, mAxis)
            let pointB = b2MulT2(xfB, mLocalPoint)
            let axisA = b2MulTR2(xfA.q, minus(normal))
            indexB = -1
            indexA = mProxyA.getSupport(axisA)
            let localPointA = mProxyA.getVertex(indexA)
            let pointA = b2MulT2(xfA, localPointA)
            let separation = b2Dot22(subtract(pointA, pointB), normal)
            return (separation, indexA, indexB)
        }
    }
    
    func evaluate( indexA: Int64,  indexB: Int64,  t: Float64) : Float64 {
        let xfA = mSweepA.getTransform(t)
        let xfB = mSweepB.getTransform(t)
        match ( mType) {
        case TYPE.POINTS =>
            let localPointA1 = mProxyA.getVertex(indexA)
            let localPointB1 = mProxyB.getVertex(indexB)
            let pointA1 = b2MulT2(xfA, localPointA1)
            let pointB1 = b2MulT2(xfB, localPointB1)
            let separation1 = b2Dot22(subtract(pointB1, pointA1), mAxis)
            return separation1
        case TYPE.FACEA =>
            let normal2 = b2MulR2(xfA.q, mAxis)
            let pointA2 = b2MulT2(xfA, mLocalPoint)
            let localPointB = mProxyB.getVertex(indexB)
            let pointB2 = b2MulT2(xfB, localPointB)
            let separation2 = b2Dot22(subtract(pointB2, pointA2), normal2)
            return separation2
        case TYPE.FACEB =>
            let normal = b2MulR2(xfB.q, mAxis)
            let pointB = b2MulT2(xfB, mLocalPoint)
            let localPointA = mProxyA.getVertex(indexA)
            let pointA = b2MulT2(xfA, localPointA)
            let separation = b2Dot22(subtract(pointA, pointB), normal)
            return separation
        }
    }
    

}
