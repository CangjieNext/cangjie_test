/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.math.*

public enum B2ContactFeatureType {
    | VERTEX
    | FACE
    public func getValue(){
        match(this){
            case VERTEX => return 0
            case FACE => return 1
        }
    }
}

public class B2ContactFeature {
    public var indexA = 0
    public var indexB = 0
    public var typeA: B2ContactFeatureType = B2ContactFeatureType.VERTEX
    public var typeB: B2ContactFeatureType = B2ContactFeatureType.VERTEX
    public init() {}
    public func setZero() {
        indexA = 0
        indexB = 0
        typeA = B2ContactFeatureType.VERTEX
        typeB = B2ContactFeatureType.VERTEX
    }
}

open class B2ManifoldPoint {
    var localPoint = B2Vec2()
    var normalImpulse: Float64 = 0.0
    var tangentImpulse: Float64 = 0.0
    var id = B2ContactFeature()
    public init( copyFrom!: ?B2ManifoldPoint = Option<B2ManifoldPoint>.None) {
        if ((copyFrom.isSome())) {
            this.localPoint = copyFrom.getOrThrow().localPoint
            this.normalImpulse = copyFrom.getOrThrow().normalImpulse
            this.tangentImpulse = copyFrom.getOrThrow().tangentImpulse
            this.id = copyFrom.getOrThrow().id
        }
    }
}

public enum B2ManifoldType {
    | CIRCLES
    | FACEA
    | FACEB
}

public open class B2Manifold {
    var points = ArrayList<B2ManifoldPoint>()
    var localNormal = B2Vec2()
    var localPoint = B2Vec2()
    var `type` = B2ManifoldType.CIRCLES
    public mut prop pointCount : Int64 {
        get(){
            points.size
        }
        set(v){

        }
    }
    public init(copyFrom!: ?B2Manifold = Option<B2Manifold>.None) {
        if ((copyFrom.isSome())) {
            this.points = ArrayList<B2ManifoldPoint>([])
            for (i in 0..copyFrom.getOrThrow().points.size) {
                this.points.add(B2ManifoldPoint(copyFrom:copyFrom.getOrThrow().points[i]))
            }
            this.localNormal = copyFrom.getOrThrow().localNormal
            this.localPoint = copyFrom.getOrThrow().localPoint
            this.`type` = copyFrom.getOrThrow().`type`
        }
    }
}

open class B2WorldManifold {
    var normal = B2Vec2()
    var points: ArrayList<B2Vec2>
    var separations:ArrayList<Float64>
    public init() {
        points = ArrayList<B2Vec2>()
        separations = ArrayList<Float64>()
        for (i in 0 ..b2MaxManifoldPoints) {
            points.add(B2Vec2(x0:0.0, y0:0.0))
            separations.add(0.0)
        }
    }
    func initialize( manifold: B2Manifold,  xfA: B2Transform,  radiusA: Float64,  xfB: B2Transform,  radiusB: Float64) {
        if ((manifold.pointCount == 0)) {
            return
        }
        match ( manifold.`type`) {
        case B2ManifoldType.CIRCLES =>
            normal.set(1.0, 0.0)
            let pointA = b2MulT2(xfA, manifold.localPoint)
            let pointB = b2MulT2(xfB, manifold.points[0].localPoint)
            if (b2DistanceSquared(pointA, pointB) > b2Epsilon * b2Epsilon) {
                normal = subtract(pointB, pointA)
                normal.normalize()
            }
            let cA = add(pointA, multM(normal, radiusA))
            let cB = subtract(pointB, multM(normal, radiusB))
            points[0] = multM(add(cA, cB), half)
            separations[0] = b2Dot22(subtract(cB, cA), normal)
        case B2ManifoldType.FACEA =>
            normal = b2MulR2(xfA.q, manifold.localNormal)
            let planePointA = b2MulT2(xfA, manifold.localPoint)
            for (i in 0 .. manifold.pointCount) {
                let clipPoint = b2MulT2(xfB, manifold.points[i].localPoint)
                let ra = radiusA - b2Dot22(subtract(clipPoint, planePointA), normal)
                let cA = add(clipPoint, multM(normal, ra))
                let cB = subtract(clipPoint, multM(normal, radiusB))
                points[i] = multM(add(cA, cB), half)
                separations[i] = b2Dot22(subtract(cB, cA), normal)
            }
        case B2ManifoldType.FACEB =>
            normal = b2MulR2(xfB.q, manifold.localNormal)
            let planePointB = b2MulT2(xfB, manifold.localPoint)
            for (i in 0 .. manifold.pointCount) {
                let clipPoint = b2MulT2(xfA, manifold.points[i].localPoint)
                let rb = radiusB - b2Dot22(subtract(clipPoint, planePointB), normal)
                let cB = add(clipPoint, multM(normal, rb))
                let cA = subtract(clipPoint, multM(normal, radiusA))
                points[i] = multM(add(cA, cB), half)
                separations[i] = b2Dot22(subtract(cA, cB), normal)
            }
            normal = minus(normal)
        case _ => ()
        }
    }
}

public class B2ClipVertex {
    public init() {}
    public var v = B2Vec2()
    public var id = B2ContactFeature()
}

public class B2RayCastInput {
    public init() {}
    public var p1 = B2Vec2()
    public var p2 = B2Vec2()
    public var maxFraction: Float64 = 0.0
}

public class B2RayCastOutput {
    public init() {}
    public var normal = B2Vec2()
    public var fraction: Float64 = 0.0
}

public class B2AaBb {
    public var lowerBound = B2Vec2()
    public var upperBound = B2Vec2()
    public init( lowerBound!: ?B2Vec2 = Option<B2Vec2>.None,  upperBound!: ?B2Vec2 = Option<B2Vec2>.None) {
        if ((lowerBound.isSome() && upperBound.isSome())) {
            this.lowerBound = lowerBound.getOrThrow()
            this.upperBound = upperBound.getOrThrow()
        }
    }
    
    public prop isValid : Bool  { 
        get() {
            let d = subtract(upperBound, lowerBound)
            var valid = d.x >= 0.0 && d.y >= 0.0
            valid = valid && lowerBound.isValid() && upperBound.isValid()
            valid
	}
    }

    public prop center : B2Vec2   { 
        get() {
	    multM(add(lowerBound, upperBound), half)
	}
    }

    public prop extents : B2Vec2  { 
        get() {
	    multM(subtract(upperBound, lowerBound), half)
	}
    }

    public prop perimeter : Float64  { 
        get() {
            let wx = upperBound.x - lowerBound.x
            let wy = upperBound.y - lowerBound.y
            float2 * (wx + wy)
	}
    }
    
    public func combine( aabb1: B2AaBb,  aabb2: B2AaBb) {
        lowerBound = b2Min(aabb1.lowerBound, aabb2.lowerBound)
        upperBound = b2Max(aabb1.upperBound, aabb2.upperBound)
    }
    
    public func contains( aabb: B2AaBb) : Bool {
        var result = true
        result = result && lowerBound.x <= aabb.lowerBound.x
        result = result && lowerBound.y <= aabb.lowerBound.y
        result = result && aabb.upperBound.x <= upperBound.x
        result = result && aabb.upperBound.y <= upperBound.y
        return result
    }
    
    public func rayCast( input: B2RayCastInput) : ?B2RayCastOutput {
        var tmin = b2MinFloat
        var tmax = b2MaxFloat
        let p = input.p1
        let d = subtract(input.p2, input.p1) 
        let absD = b2Abs2(d)
        var normal = B2Vec2()
        for (i in 0 ..indexTwo) {
            if ((absD.getSubscript(i) < b2Epsilon)) {
                if (p.getSubscript(i) < lowerBound.getSubscript(i) || upperBound.getSubscript(i) < p.getSubscript(i)) {
                    return None
                }
            } else {
                let invd = 1.0 / d.getSubscript(i)
                var t1 = (lowerBound.getSubscript(i) - p.getSubscript(i)) * invd
                var t2 = (upperBound.getSubscript(i) - p.getSubscript(i)) * invd
                var s: Float64 = -1.0
                if ((t1 > t2)) {
                    t1 = t2
                    t2 = t1
                    s = 1.0
                }
                if ((t1 > tmin)) {
                    normal.setZero()
                    normal.setSubscript(i, s)
                    tmin = t1
                }
                tmax = min(tmax, t2)
                if ((tmin > tmax)) {
                    return None
                }
            }
        }
        if ((tmin < 0.0 || input.maxFraction < tmin)) {
            return None
        }
        var output = B2RayCastOutput()
        output.fraction = tmin
        output.normal = normal
        return output
    }
}

public func b2ClipSegmentToLine( vIn: ArrayList<B2ClipVertex>,  normal: B2Vec2,  offset: Float64,  vertexIndexA: Int64) : ArrayList<B2ClipVertex> {
    var vOut = ArrayList<B2ClipVertex>()
    let distance0 = b2Dot22(normal, vIn[0].v) - offset
    let distance1 = b2Dot22(normal, vIn[1].v) - offset
    if ((distance0 <= 0.0)) {
        vOut.add(vIn[0])
    }
    if ((distance1 <= 0.0)) {
        vOut.add(vIn[1])
    }
    if ((distance0 * distance1 < 0.0)) {
        let interp = distance0 / (distance0 - distance1)
        var v = B2ClipVertex()
        v.v = add(vIn[0].v, multM(subtract(vIn[1].v, vIn[0].v), interp))
        v.id.indexA = vertexIndexA
        v.id.indexB = vIn[0].id.indexB
        v.id.typeA = B2ContactFeatureType.VERTEX
        v.id.typeB = B2ContactFeatureType.FACE
        vOut.add(v)
    }
    return vOut
}

public func b2TestOverlap( shapeA: B2Shape,  shapeB: B2Shape,  xfA: B2Transform,  xfB: B2Transform) : Bool {
    let input = B2DistanceInput()
    input.proxyA.set(shapeA)
    input.proxyB.set(shapeB)
    input.transformA = xfA
    input.transformB = xfB
    input.useRadii = true
    var cache = B2SimplexCache()
    cache.size = 0
    var output = B2DistanceOutput()
    (output, cache) = b2DistanceM(output, cache, input)
    return output.distance < float10 * b2Epsilon
}

public func b2TestOverlap2( a: B2AaBb,  b: B2AaBb) : Bool {
    let d1 = subtract(b.lowerBound, a.upperBound)
    let d2 = subtract(a.lowerBound, b.upperBound)
    if (d1.x > 0.0 || d1.y > 0.0) {
        return false
    }
    if (d2.x > 0.0 || d2.y > 0.0) {
        return false
    }
    return true
}