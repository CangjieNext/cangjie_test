/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


public func b2CollideCircles(manifold: B2Manifold,  circleA: B2CircleShape,  xfA: B2Transform,  circleB: B2CircleShape,  xfB: B2Transform) : B2Manifold{ 
    manifold.points.clear()
    let pA = b2MulT2(xfA, circleA.mPoint)
    let pB = b2MulT2(xfB, circleB.mPoint)
    let d = subtract(pB, pA)
    let distSqr = b2Dot22(d, d)
    let rA = circleA.mRadius
    let rB = circleB.mRadius
    let radius = rA + rB
    if (distSqr > radius * radius) {
        return manifold
    }
    manifold.`type` = B2ManifoldType.CIRCLES
    manifold.localPoint = circleA.mPoint
    manifold.localNormal.setZero()
    let cp = B2ManifoldPoint()
    cp.localPoint = circleB.mPoint
    cp.id.setZero()
    manifold.points.add(cp)
    return manifold
}

public func b2CollidePolygonAndCircle( manifold: B2Manifold, polygonA: B2PolygonShape, xfA: B2Transform, circleB: B2CircleShape, xfB: B2Transform) : B2Manifold{
    manifold.points.clear()
    let c = b2MulT2(xfB, circleB.mPoint)
    let cLocal = b2MulTT2(xfA, c)
    var normalIndex = 0
    var separation = -b2MaxFloat
    let radius = polygonA.mRadius + circleB.mRadius
    let vertexCount = polygonA.mCount
    let vertices = polygonA.mVertices
    let normals = polygonA.mNormals
    for (i in 0 .. vertexCount) {
        let n = subtract(cLocal, vertices.get(index:i))
        let s = b2Dot22(normals.get(index:i), n)
        if (s > radius) {
            return manifold
        }
        if (s > separation) {
            separation = s
            normalIndex = i
        }
    }
    let vertIndex1 = normalIndex
    var vertIndex2 = 0
    if (vertIndex1 + 1 < vertexCount){
        vertIndex2 = vertIndex1 + 1
    }
    let v1 = vertices.get(index:vertIndex1)
    let v2 = vertices.get(index:vertIndex2)
    if ((separation < b2Epsilon)) {
        manifold.`type` = B2ManifoldType.FACEA
        manifold.localNormal = normals.get(index:normalIndex)
        manifold.localPoint = multM(add(v1, v2), half)
        let cp = B2ManifoldPoint()
        cp.localPoint = circleB.mPoint
        cp.id.setZero()
        manifold.points.add(cp)
        return manifold
    }
    let u1 = b2Dot22(subtract(cLocal, v1), subtract(v2, v1))
    let u2 = b2Dot22(subtract(cLocal, v2), subtract(v1, v2))
    if ((u1 <= 0.0)) {
        if ((b2DistanceSquared(cLocal, v1) > radius * radius)) {
            return manifold
        }
        manifold.`type` = B2ManifoldType.FACEA
        manifold.localNormal = subtract(cLocal, v1)
        manifold.localNormal.normalize()
        manifold.localPoint = v1
        let cp = B2ManifoldPoint()
        cp.localPoint = circleB.mPoint
        cp.id.setZero()
        manifold.points.add(cp)
    } else if ((u2 <= 0.0)) {
        if (b2DistanceSquared(cLocal, v2) > radius * radius) {
            return manifold
        }
        manifold.`type` = B2ManifoldType.FACEA
        manifold.localNormal = subtract(cLocal, v2)
        manifold.localNormal.normalize()
        manifold.localPoint = v2
        let cp = B2ManifoldPoint()
        cp.localPoint = circleB.mPoint
        cp.id.setZero()
        manifold.points.add(cp)
    } else {
        let inVec = normals.get(index:vertIndex1)
        let faceCenter = multM(add(v1, v2), half)
        let separation = b2Dot22(subtract(cLocal, faceCenter), inVec)
        if (separation > radius) {
            return manifold
        }
        manifold.`type` = B2ManifoldType.FACEA
        manifold.localNormal = inVec
        manifold.localPoint = faceCenter
        let cp = B2ManifoldPoint()
        cp.localPoint = circleB.mPoint
        cp.id.setZero()
        manifold.points.add(cp)
    }
    return manifold
}