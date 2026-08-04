/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func b2FindMaxSeparation( poly1: B2PolygonShape,  xf1: B2Transform,  poly2: B2PolygonShape,  xf2: B2Transform) : (Int64, Float64) {
    let count1 = poly1.mCount
    let count2 = poly2.mCount
    let n1s = poly1.mNormals
    let v1s = poly1.mVertices
    let v2s = poly2.mVertices
    let xf = b2MulT(xf2, xf1)
    var bestIndex = 0
    var maxSeparation = -b2MaxFloat
    for (i in 0..count1) {
        let n = b2MulR2(xf.q, n1s.get(index:i))
        let v1 = b2MulT2(xf, v1s.get(index:i))
        var si = b2MaxFloat
        for (j in 0 ..count2) {
            let sij = b2Dot22(n, subtract(v2s.get(index:j), v1))
            if (sij < si) {
                si = sij
            }
        }
        if (si > maxSeparation) {
            maxSeparation = si
            bestIndex = i
        }
    }
    return (bestIndex, maxSeparation)
}

func b2FindIncidentEdge( poly1: B2PolygonShape,  xf1: B2Transform,  edge1: Int64,  poly2: B2PolygonShape,  xf2: B2Transform) : ArrayList<B2ClipVertex> {
    let normals1 = poly1.mNormals
    let count2 = poly2.mCount
    let vertices2 = poly2.mVertices
    let normals2 = poly2.mNormals
    let normal1 = b2MulTR2(xf2.q, b2MulR2(xf1.q, normals1.get(index:edge1)))
    var index = 0
    var minDot = b2MaxFloat
    for (i in 0..count2) {
        let dot = b2Dot22(normal1, normals2.get(index:i))
        if (dot < minDot) {
            minDot = dot
            index = i
        }
    }
    let i1 = index
    var i2 = i1 + 1
    if(i1 + 1 < count2){
        i2 = 0
    }
    var c = ArrayList<B2ClipVertex>()
    for (i in 0 ..indexTwo) {
        c.add(B2ClipVertex())
    }
    c[0].v = b2MulT2(xf2, vertices2.get(index:i1))
    c[0].id.indexA = edge1
    c[0].id.indexB = i1
    c[0].id.typeA = B2ContactFeatureType.FACE
    c[0].id.typeB = B2ContactFeatureType.VERTEX
    c[1].v = b2MulT2(xf2, vertices2.get(index:i2))
    c[1].id.indexA = edge1
    c[1].id.indexB = i2
    c[1].id.typeA = B2ContactFeatureType.FACE
    c[1].id.typeB = B2ContactFeatureType.VERTEX
    return c
}

public func b2CollidePolygons( manifold: B2Manifold,  polyA: B2PolygonShape,  xfA: B2Transform,  polyB: B2PolygonShape,  xfB: B2Transform): B2Manifold{
    manifold.points.clear()
    let totalRadius = polyA.mRadius + polyB.mRadius
    var edgeA: Int64
    var separationA: Float64
    (edgeA, separationA) = b2FindMaxSeparation(polyA,xfA, polyB,xfB)
    if ((separationA > totalRadius)) {
        return manifold
    }
    var edgeB: Int64
    var separationB: Float64
    (edgeB, separationB) = b2FindMaxSeparation(polyB, xfB, polyA, xfA)
    if ((separationB > totalRadius)) {
        return manifold
    }
    let ratio = 0.1
    let kTol: Float64 = ratio * b2LinearSlop
    let speAb = separationB > separationA + kTol
    var poly1: B2PolygonShape = polyA
    if(speAb){
        poly1 = polyB
    }
    var poly2: B2PolygonShape = polyB
    if(speAb){
        poly2 = polyA
    }
    var xf1: B2Transform = xfA
    if(speAb){
        xf1 = xfB
    }
    var xf2: B2Transform = xfB
    if(speAb){
        xf2 = xfA
    }
    var edge1: Int64 = edgeA
    if(speAb){
        edge1 = edgeB
    }
    var flip: Bool = false
    if(speAb){
        flip = true
    }
    manifold.`type` = B2ManifoldType.FACEA
    if(speAb){
        manifold.`type` = B2ManifoldType.FACEB
    }
    let incidentEdge = b2FindIncidentEdge(poly1, xf1, edge1,  poly2, xf2)
    let vertices1 = poly1.mVertices
    var iv2= 0
    if(edge1 + 1 < poly1.mCount){
        iv2 = edge1 + 1
    }
    var v11 = vertices1.get(index:edge1)
    var v12 = vertices1.get(index:iv2)
    var localTangent = subtract(v12, v11)
    localTangent.normalize()
    let localNormal = b2Cross12(localTangent, 1.0)
    let planePoint = multM(add(v11, v12), half)
    let tangent = b2MulR2(xf1.q, localTangent)
    let normal = b2Cross12(tangent, 1.0)
    v11 = b2MulT2(xf1, v11)
    v12 = b2MulT2(xf1, v12)
    let frontOffset = b2Dot22(normal, v11)
    let sideOffset1 = -b2Dot22(tangent, v11) + totalRadius
    let sideOffset2 = b2Dot22(tangent, v12) + totalRadius
    let clipPoints1 = b2ClipSegmentToLine(incidentEdge, minus(tangent), sideOffset1, edge1)
    if (clipPoints1.size < indexTwo) {
        return manifold
    }
    let clipPoints2 = b2ClipSegmentToLine(clipPoints1, tangent, sideOffset2, iv2)
    if (clipPoints2.size < indexTwo) {
        return manifold
    }
    manifold.localNormal = localNormal
    manifold.localPoint = planePoint
    for (i in 0 ..b2MaxManifoldPoints ) {
        let separation = b2Dot22(normal, clipPoints2[i].v) - frontOffset
        if (separation <= totalRadius) {
            let cp = B2ManifoldPoint()
            cp.localPoint = b2MulTT2(xf2, clipPoints2[i].v)
            cp.id = clipPoints2[i].id
            if (flip) {
                let cf = cp.id
                cp.id.indexA = cf.indexB
                cp.id.indexB = cf.indexA
                cp.id.typeA = cf.typeB
                cp.id.typeB = cf.typeA
            }
            manifold.points.add(cp)
        }
    }
    return manifold
}
