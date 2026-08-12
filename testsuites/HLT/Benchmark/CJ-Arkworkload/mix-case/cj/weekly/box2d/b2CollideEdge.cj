/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.math.*

public func b2CollideEdgeAndCircle( manifold: B2Manifold,  edgeA: B2EdgeShape,  xfA: B2Transform,  circleB: B2CircleShape,  xfB: B2Transform): B2Manifold { 
    manifold.points.clear()
    let mQ = b2MulTT2(xfA, b2MulT2(xfB, circleB.mPoint))
    let eA = edgeA.mVertex1
    let eB = edgeA.mVertex2
    let e = subtract(eB, eA)
    let u = b2Dot22(e, subtract(eB, mQ))
    let v = b2Dot22(e, subtract(mQ, eA))
    let radius = edgeA.mRadius + circleB.mRadius
    var cf = B2ContactFeature()
    cf.indexB = 0
    cf.typeB = B2ContactFeatureType.VERTEX
    if ((v <= 0.0)) {
        let mP = eA
        let d = subtract(mQ, mP)
        let dd = b2Dot22(d, d)
        if ((dd > radius * radius)) {
            return manifold
        }
        if ((edgeA.mHasVertex0)) {
            let aA1 = edgeA.mVertex0
            let aB1 = eA
            let e1 = subtract(aB1, aA1)
            let u1 = b2Dot22(e1, subtract(aB1, mQ))
            
            if ((u1 > 0.0)) {
                return manifold
            }
        }
        cf.indexA = 0
        cf.typeA = B2ContactFeatureType.VERTEX
        manifold.`type` = B2ManifoldType.CIRCLES
        manifold.localNormal.setZero()
        manifold.localPoint = mP
        let cp = B2ManifoldPoint()
        cp.id.setZero()
        cp.id = cf
        cp.localPoint = circleB.mPoint
        manifold.points.add(cp)
        return manifold
    }
    if ((u <= 0.0)) {
        let mP = eB
        let d = subtract(mQ, mP)
        let dd = b2Dot22(d, d)
        if ((dd > radius * radius)) {
            return manifold
        } 
        if ((edgeA.mHasVertex3)) {
            let vB2 = edgeA.mVertex3
            let vA2 = eB
            let e2 = subtract(vB2, vA2)
            let v2 = b2Dot22(e2, subtract(mQ, vA2))
            if (v2 > 0.0) {
                return manifold
            }
        }
        cf.indexA = 1
        cf.typeA = B2ContactFeatureType.VERTEX
        manifold.`type` = B2ManifoldType.CIRCLES
        manifold.localNormal.setZero()
        manifold.localPoint = mP
        let cp = B2ManifoldPoint()
        cp.id.setZero()
        cp.id = cf
        cp.localPoint = circleB.mPoint
        manifold.points.add(cp)
        return manifold
    }
    let den = b2Dot22(e, e)
    let vP = multM(add(multM(eA, u), multM(eB, v)), 1.0 / den)
    let d = subtract(mQ, vP)
    let dd = b2Dot22(d, d)
    if ((dd > radius * radius)) {
        return manifold
    }
    var n = B2Vec2(x0:-e.y,y0:e.x)
    if ((b2Dot22(n, subtract(mQ, eA)) < 0.0)) {
        n.set(-n.x, -n.y)
    }
    n.normalize()
    cf.indexA = 0
    cf.typeA = B2ContactFeatureType.FACE
    manifold.`type` = B2ManifoldType.FACEA
    manifold.localNormal = n
    manifold.localPoint = eA
    let cp = B2ManifoldPoint()
    cp.id.setZero()
    cp.id = cf
    cp.localPoint = circleB.mPoint
    manifold.points.add(cp)
    return manifold
}

enum B2EpAxisType {
    | UNKNOWN
    | EDGEA
    | EDGEB
    func getvalue():Int64{
        match(this){
            case UNKNOWN => 0
            case EDGEA => 1
            case EDGEB => 2
        }
    }
}

class B2EpAxis {
    var `type` = B2EpAxisType.UNKNOWN
    var index = 0
    var separation: Float64 = 0.0
}

class B2TempPolygon {
    var vertices = ArrayList<B2Vec2>()
    var normals = ArrayList<B2Vec2>()
    var count = 0
    
    init() {
        for ( i in 0..b2MaxPolygonVertices) {
            vertices.add(B2Vec2())
            normals.add(B2Vec2())
        }
    }
}

class B2ReferenceFace {
    var i1 = 0
    var i2 = 0
    var v1 = B2Vec2()
    var v2 = B2Vec2()
    var normal = B2Vec2()
    var sideNormal1 = B2Vec2()
    var sideOffset1: Float64 = 0.0
    var sideNormal2 = B2Vec2()
    var sideOffset2: Float64 = 0.0
}

class B2EpCollider {
    var mPolygonB = B2TempPolygon()
    var mxf = B2Transform()
    var mCentroidB = B2Vec2()
    var mv0 = B2Vec2()
    var mv1 = B2Vec2()
    var mv2 = B2Vec2()
    var mv3 = B2Vec2()
    var mNormal0 = B2Vec2()
    var mNormal1 = B2Vec2()
    var mNormal2 = B2Vec2()
    var mNormal = B2Vec2()
    var mType1 = VertexType.ISOLATED
    var mType2 = VertexType.ISOLATED
    var mLowerLimit = B2Vec2()
    var mUpperLimit = B2Vec2()
    var mRadius: Float64 = 0.0
    var mFront = false
    
    func collide( edgeA: B2EdgeShape,  xfA: B2Transform,  polygonB: B2PolygonShape,  xfB: B2Transform) : B2Manifold {
        let manifold = B2Manifold()
        mxf = b2MulT(xfA, xfB)
        mCentroidB = b2MulT2(mxf, polygonB.mCentroid)
        mv0 = edgeA.mVertex0
        mv1 = edgeA.mVertex1
        mv2 = edgeA.mVertex2
        mv3 = edgeA.mVertex3
        let hasVertex0 = edgeA.mHasVertex0
        let hasVertex3 = edgeA.mHasVertex3
        var edge1 = subtract(mv2, mv1)
        edge1.normalize()
        mNormal1.set(edge1.y, -edge1.x)
        let offset1 = b2Dot22(mNormal1, subtract(mCentroidB, mv1))
        var offset0: Float64 = 0.0
        var offset2: Float64 = 0.0
        var convex1 = false
        var convex2 = false
        if ((hasVertex0)) {
            var edge0 = subtract(mv1, mv0)
            edge0.normalize()
            mNormal0.set(edge0.y, -edge0.x)
            convex1 = b2Cross(edge0, edge1) >= 0.0
            offset0 = b2Dot22(mNormal0, subtract(mCentroidB, mv0))
        }
        if ((hasVertex3)) {
            var edge2 = subtract(mv3, mv2)
            edge2.normalize()
            mNormal2.set(edge2.y, -edge2.x)
            convex2 = b2Cross(edge1, edge2) > 0.0
            offset2 = b2Dot22(mNormal2, subtract(mCentroidB, mv2))
        }
        if ((hasVertex0 && hasVertex3)) {
            if ((convex1 && convex2)) {
                mFront = offset0 >= 0.0 || offset1 >= 0.0 || offset2 >= 0.0
                if ((mFront)) {
                    mNormal = mNormal1
                    mLowerLimit = mNormal0
                    mUpperLimit = mNormal2
                } else {
                    mNormal = minus(mNormal1)
                    mLowerLimit = minus(mNormal1)
                    mUpperLimit = minus(mNormal1)
                }
            } else if ((convex1)) {
                mFront = offset0 >= 0.0 || (offset1 >= 0.0 && offset2 >= 0.0)
                if ((mFront)) {
                    mNormal = mNormal1
                    mLowerLimit = mNormal0
                    mUpperLimit = mNormal1
                } else {
                    mNormal = minus(mNormal1)
                    mLowerLimit = minus(mNormal2)
                    mUpperLimit = minus(mNormal1)
                }
            } else if ((convex2)) {
                mFront = offset2 >= 0.0 || (offset0 >= 0.0 && offset1 >= 0.0)
                if (mFront) {
                    mNormal = mNormal1
                    mLowerLimit = mNormal1
                    mUpperLimit = mNormal2
                } else {
                    mNormal = minus(mNormal1)
                    mLowerLimit = minus(mNormal1)
                    mUpperLimit = minus(mNormal0)
                }
            } else {
                mFront = offset0 >= 0.0 && offset1 >= 0.0 && offset2 >= 0.0
                if ((mFront)) {
                    mNormal = mNormal1
                    mLowerLimit = mNormal1
                    mUpperLimit = mNormal1
                } else {
                    mNormal = minus(mNormal1)
                    mLowerLimit = minus(mNormal2)
                    mUpperLimit = minus(mNormal0)
                }
            }
        } else if ((hasVertex0)) {
            if ((convex1)) {
                mFront = offset0 >= 0.0 || offset1 >= 0.0
                if ((mFront)) {
                    mNormal = mNormal1
                    mLowerLimit = mNormal0
                    mUpperLimit = minus(mNormal1)
                } else {
                    mNormal = minus(mNormal1)
                    mLowerLimit = mNormal1
                    mUpperLimit = minus(mNormal1)
                }
            } else {
                mFront = offset0 >= 0.0 && offset1 >= 0.0
                if ((mFront)) {
                    mNormal = mNormal1
                    mLowerLimit = mNormal1
                    mUpperLimit = minus(mNormal1)
                } else {
                    mNormal = minus(mNormal1)
                    mLowerLimit = mNormal1
                    mUpperLimit = minus(mNormal0)
                }
            }
        } else if ((hasVertex3)) {
            if ((convex2)) {
                mFront = offset1 >= 0.0 || offset2 >= 0.0
                if ((mFront)) {
                    mNormal = mNormal1
                    mLowerLimit = minus(mNormal1)
                    mUpperLimit = mNormal2
                } else {
                    mNormal = minus( mNormal1)
                    mLowerLimit = minus(mNormal1)
                    mUpperLimit = mNormal1
                }
            } else {
                mFront = offset1 >= 0.0 && offset2 >= 0.0
                if ((mFront)) {
                    mNormal = mNormal1
                    mLowerLimit = minus(mNormal1)
                    mUpperLimit = mNormal1
                } else {
                    mNormal = minus(mNormal1)
                    mLowerLimit = minus(mNormal2)
                    mUpperLimit = mNormal1
                }
            }
        } else {
            mFront = offset1 >= 0.0
            if ((mFront)) {
                mNormal = mNormal1
                mLowerLimit = minus(mNormal1)
                mUpperLimit = minus(mNormal1)
            } else {
                mNormal = minus(mNormal1)
                mLowerLimit = mNormal1
                mUpperLimit = mNormal1
            }
        }
        mPolygonB.count = polygonB.mCount
        for (i in 0..polygonB.mCount) {
            mPolygonB.vertices[i] = b2MulT2(mxf, polygonB.mVertices.get(index:i))
            mPolygonB.normals[i] = b2MulR2(mxf.q, polygonB.mNormals.get(index:i))
        }
        mRadius = float2 * b2PolygonRadius
        manifold.points.clear()
        let edgeAxis = computeEdgeSeparation()
        if ((edgeAxis.`type`.getvalue() == B2EpAxisType.UNKNOWN.getvalue())) {
            return manifold
        }
        if ((edgeAxis.separation > mRadius)) {
            return manifold
        }
        let polygonAxis = computePolygonSeparation()
        if ((polygonAxis.`type`.getvalue() != B2EpAxisType.UNKNOWN.getvalue() && polygonAxis.separation > mRadius)) {
            return manifold
        }
        let relativeTol:Float64 = 0.98
        let absoluteTol:Float64 = 0.001
        var primaryAxis: B2EpAxis
        if ((polygonAxis.`type`.getvalue() == B2EpAxisType.UNKNOWN.getvalue())) {
            primaryAxis = edgeAxis
        } else if ((polygonAxis.separation > relativeTol * edgeAxis.separation + absoluteTol)) {
            primaryAxis = polygonAxis
        } else {
            primaryAxis = edgeAxis
        }
        var ie = ArrayList<B2ClipVertex>()
        for (i in 0..indexTwo) {
            ie.add(B2ClipVertex())
        }
        let rf = B2ReferenceFace()
        if ((primaryAxis.`type`.getvalue() == B2EpAxisType.EDGEA.getvalue())) {
            manifold.`type` = B2ManifoldType.FACEA
            var bestIndex = 0
            var bestValue = b2Dot22(mNormal, mPolygonB.normals[0])
            for (i in 1..mPolygonB.count) {
                let value = b2Dot22(mNormal, mPolygonB.normals[i])
                if (value < bestValue) {
                    bestValue = value
                    bestIndex = i
                }
            }
            let i1 = bestIndex
            var i2 = 0
            if(i1 + 1 < mPolygonB.count){
                i2 = i1 + 1
            }
            ie[0].v = mPolygonB.vertices[i1]
            ie[0].id.indexA = 0
            ie[0].id.indexB = i1
            ie[0].id.typeA = B2ContactFeatureType.FACE
            ie[0].id.typeB = B2ContactFeatureType.VERTEX
            ie[1].v = mPolygonB.vertices[i2]
            ie[1].id.indexA = 0
            ie[1].id.indexB = i2
            ie[1].id.typeA = B2ContactFeatureType.FACE
            ie[1].id.typeB = B2ContactFeatureType.VERTEX
            if ((mFront)) {
                rf.i1 = 0
                rf.i2 = 1
                rf.v1 = mv1
                rf.v2 = mv2
                rf.normal = mNormal1
            } else {
                rf.i1 = 1
                rf.i2 = 0
                rf.v1 = mv2
                rf.v2 = mv1
                rf.normal = minus(mNormal1)
            }
        } else {
            manifold.`type` = B2ManifoldType.FACEB
            ie[0].v = mv1
            ie[0].id.indexA = 0
            ie[0].id.indexB = primaryAxis.index
            ie[0].id.typeA = B2ContactFeatureType.VERTEX
            ie[0].id.typeB = B2ContactFeatureType.FACE
            ie[1].v = mv2
            ie[1].id.indexA = 0
            ie[1].id.indexB = primaryAxis.index
            ie[1].id.typeA = B2ContactFeatureType.VERTEX
            ie[1].id.typeB = B2ContactFeatureType.FACE
            rf.i1 = primaryAxis.index
            rf.i2 = 0
            if(rf.i1 + 1 < mPolygonB.count){
                rf.i2 = rf.i1
            }
            rf.v1 = mPolygonB.vertices[rf.i1]
            rf.v2 = mPolygonB.vertices[rf.i2]
            rf.normal = mPolygonB.normals[rf.i1]
        }
        rf.sideNormal1.set(rf.normal.y, -rf.normal.x)
        rf.sideNormal2 = minus(rf.sideNormal1)
        rf.sideOffset1 = b2Dot22(rf.sideNormal1, rf.v1)
        rf.sideOffset2 = b2Dot22(rf.sideNormal2, rf.v2)
        let clipPoints1 = b2ClipSegmentToLine(ie, rf.sideNormal1, rf.sideOffset1, rf.i1)
        if ((clipPoints1.size < b2MaxManifoldPoints)) {
            return manifold
        }
        let clipPoints2 = b2ClipSegmentToLine(clipPoints1, rf.sideNormal2, rf.sideOffset2, rf.i2)
        if ((clipPoints2.size < b2MaxManifoldPoints)) {
            return manifold
        }
        if ((primaryAxis.`type`.getvalue() == B2EpAxisType.EDGEA.getvalue())) {
            manifold.localNormal = rf.normal
            manifold.localPoint = rf.v1
        } else {
            manifold.localNormal = polygonB.mNormals.get(index:rf.i1)
            manifold.localPoint = polygonB.mVertices.get(index:rf.i1)
        }
        for (i in 0 .. b2MaxManifoldPoints) {
            let separation = b2Dot22(rf.normal, subtract(clipPoints2[i].v, rf.v1))
            if ((separation <= mRadius)) {
                let cp = B2ManifoldPoint()
                if (primaryAxis.`type`.getvalue() == B2EpAxisType.EDGEA.getvalue()) {
                    cp.localPoint = b2MulTT2(mxf, clipPoints2[i].v)
                    cp.id = clipPoints2[i].id
                } else {
                    cp.localPoint = clipPoints2[i].v
                    cp.id.typeA = clipPoints2[i].id.typeB
                    cp.id.typeB = clipPoints2[i].id.typeA
                    cp.id.indexA = clipPoints2[i].id.indexB
                    cp.id.indexB = clipPoints2[i].id.indexA
                }
                manifold.points.add(cp)
            }
        }
        return manifold
    }
    
    func computeEdgeSeparation() : B2EpAxis {
        let axis = B2EpAxis()
        axis.`type` = B2EpAxisType.EDGEA
        axis.index = 1
        if(mFront){
            axis.index = 0
        }
        axis.separation = b2MaxFloat
        for (i in 0 .. mPolygonB.count) {
            let s = b2Dot22(mNormal, subtract(mPolygonB.vertices[i], mv1))
            if ((s < axis.separation)) {
                axis.separation = s
            }
        }
        return axis
    }
    
    func computePolygonSeparation() : B2EpAxis {
        let axis = B2EpAxis()
        axis.`type` = B2EpAxisType.UNKNOWN
        axis.index = -1
        axis.separation = -b2MaxFloat
        let perp = B2Vec2(x0:-mNormal.y, y0:mNormal.x)
        for (i in 0..mPolygonB.count) {
            let n = minus(mPolygonB.normals[i])
            let s1 = b2Dot22(n, subtract(mPolygonB.vertices[i], mv1))
            let s2 = b2Dot22(n, subtract(mPolygonB.vertices[i], mv2))
            let s = min(s1, s2)
            if ((s > mRadius)) {
                axis.`type` = B2EpAxisType.EDGEB
                axis.index = i
                axis.separation = s
                return axis
            }
            if ((b2Dot22(n, perp) >= 0.0)) {
                if (b2Dot22(subtract(n, mUpperLimit), mNormal) < -b2AngularSlop) {
                    continue
                }
            } else {
                if ((b2Dot22(subtract(n, mLowerLimit), mNormal) < -b2AngularSlop)) {
                    continue
                }
            }
            if ((s > axis.separation)) {
                axis.`type` = B2EpAxisType.EDGEB
                axis.index = i
                axis.separation = s
            }
        }
        return axis
    }
}

enum VertexType {
    | ISOLATED
    | CONCAVE
    | CONVEX
}

public func b2CollideEdgeAndPolygon( manifold: B2Manifold,  edgeA: B2EdgeShape,  xfA: B2Transform,  polygonB: B2PolygonShape,  xfB: B2Transform): B2Manifold {
    let collider = B2EpCollider()
    var manifold1 = collider.collide(edgeA, xfA, polygonB, xfB)
    return manifold1
}

