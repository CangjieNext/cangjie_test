/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*
import std.math.*

open class B2VelocityConstraintPoint {
    var rA = B2Vec2()
    var rB = B2Vec2()
    var normalImpulse: Float64 = 0.0
    var tangentImpulse: Float64 = 0.0
    var normalMass: Float64 = 0.0
    var tangentMass: Float64 = 0.0
    var velocityBias: Float64 = 0.0
}

open class B2ContactVelocityConstraint {
    var points = ArrayList<B2VelocityConstraintPoint>()
    var normal = B2Vec2()
    var normalMass = B2Mat22()
    var mK = B2Mat22()
    var indexA: Int64 = 0
    var indexB: Int64 = 0
    var invMassA: Float64 = 0.0
    var invMassB: Float64 = 0.0
    var invIA: Float64 = 0.0
    var invIB: Float64 = 0.0
    var friction: Float64 = 0.0
    var restitution: Float64 = 0.0
    var tangentSpeed: Float64 = 0.0
    var pointCount: Int64 = 0
    var contactIndex: Int64 = 0
}

public class B2ContactSolverDef {
    var step = B2TimeStep()
    var contacts = ArrayList<B2Contact>()
    var count: Int64 = 0
    var positions = B2Array<B2Position>()
    var velocities = B2Array<B2Velocity>()
}

open class B2ContactSolver {
    init( def : B2ContactSolverDef) {
        mStep = def.step
        mCount = def.count
        mPositionConstraints = ArrayList<B2ContactPositionConstraint>()
        mVelocityConstraints = ArrayList<B2ContactVelocityConstraint>()
        mPositions = def.positions
        mVelocities = def.velocities
        mContacts = def.contacts
        for (i in 0 .. mCount) {
            let contact = mContacts[i]
            let fixtureA = contact.mFixtureA
            let fixtureB = contact.mFixtureB
            let shapeA = fixtureA.getOrThrow().shape
            let shapeB = fixtureB.getOrThrow().shape
            let radiusA = shapeA.getOrThrow().mRadius
            let radiusB = shapeB.getOrThrow().mRadius
            let bodyA = fixtureA.getOrThrow().body()
            let bodyB = fixtureB.getOrThrow().body()
            let manifold = contact.manifold
            let pointCount = manifold.pointCount
            let vc = B2ContactVelocityConstraint()
            vc.friction = contact.mFriction
            vc.restitution = contact.mRestitution
            vc.tangentSpeed = contact.mTangentSpeed
            vc.indexA = bodyA.mIslandIndex
            vc.indexB = bodyB.mIslandIndex
            vc.invMassA = bodyA.mInvMass
            vc.invMassB = bodyB.mInvMass
            vc.invIA = bodyA.mInvI
            vc.invIB = bodyB.mInvI
            vc.contactIndex = i
            vc.pointCount = pointCount
            vc.mK.setZero()
            vc.normalMass.setZero()
            mVelocityConstraints.add(vc)
            let pc = B2ContactPositionConstraint()
            pc.indexA = bodyA.mIslandIndex
            pc.indexB = bodyB.mIslandIndex
            pc.invMassA = bodyA.mInvMass
            pc.invMassB = bodyB.mInvMass
            pc.localCenterA = bodyA.mSweep.localCenter
            pc.localCenterB = bodyB.mSweep.localCenter
            pc.invIA = bodyA.mInvI
            pc.invIB = bodyB.mInvI
            pc.localNormal = manifold.localNormal
            pc.localPoint = manifold.localPoint
            pc.pointCount = pointCount
            pc.radiusA =  radiusA
            pc.radiusB =  radiusB
            pc.`type` = manifold.`type`
            mPositionConstraints.add(pc)
            for (j in 0 .. pointCount) {
                let cp = manifold.points[j]
                let vcp = B2VelocityConstraintPoint()
                if ((mStep.warmStarting)) {
                    vcp.normalImpulse = mStep.dtRatio * cp.normalImpulse
                    vcp.tangentImpulse = mStep.dtRatio * cp.tangentImpulse
                } else {
                    vcp.normalImpulse = 0.0
                    vcp.tangentImpulse = 0.0
                }
                vcp.rA.setZero()
                vcp.rB.setZero()
                vcp.normalMass = 0.0
                vcp.tangentMass = 0.0
                vcp.velocityBias = 0.0
                vc.points.add(vcp)
                pc.localPoints[j] = cp.localPoint
            }
        }
    }
    
    func initializeVelocityConstraints() {
        for (i in 0 .. mCount) {
            let vc = mVelocityConstraints[i]
            let pc = mPositionConstraints[i]
            let radiusA = pc.radiusA
            let radiusB = pc.radiusB
            let manifold = mContacts[vc.contactIndex].manifold
            let indexA = vc.indexA
            let indexB = vc.indexB
            let mA = vc.invMassA
            let mB = vc.invMassB
            let iA = vc.invIA
            let iB = vc.invIB
            let localCenterA = pc.localCenterA
            let localCenterB = pc.localCenterB
            let cA = mPositions.get(index:indexA).c
            let aA = mPositions.get(index:indexA).a
            let vA = mVelocities.get(index:indexA).v
            let wA = mVelocities.get(index:indexA).w
            let cB = mPositions.get(index:indexB).c
            let aB = mPositions.get(index:indexB).a
            let vB = mVelocities.get(index:indexB).v
            let wB = mVelocities.get(index:indexB).w
            var xfA = B2Transform()
            var xfB = B2Transform()
            xfA.q.set(aA)
            xfB.q.set(aB)
            xfA.p = subtract(cA, b2MulR2(xfA.q, localCenterA))
            xfB.p = subtract(cB, b2MulR2(xfB.q, localCenterB))
            let worldManifold = B2WorldManifold()
            worldManifold.initialize(manifold, xfA, radiusA, xfB, radiusB)
            vc.normal = worldManifold.normal
            let pointCount = vc.pointCount
            for (j in 0 .. pointCount) {
                let vcp = vc.points[j]
                vcp.rA = subtract(worldManifold.points[j], cA)
                vcp.rB = subtract(worldManifold.points[j], cB)
                let rnA = b2Cross(vcp.rA, vc.normal)
                let rnB = b2Cross(vcp.rB, vc.normal)
                let kNormal = mA + mB + iA * rnA * rnA + iB * rnB * rnB
                 
		if (kNormal > 0.0) {
		    vcp.normalMass = 1.0 / kNormal
	        } else {
		    vcp.normalMass = 0.0
		}
                let tangent = b2Cross12(vc.normal, 1.0)
                let rtA = b2Cross(vcp.rA, tangent)
                let rtB = b2Cross(vcp.rB, tangent)
                let kTangent = mA + mB + iA * rtA * rtA + iB * rtB * rtB
                
		if (kTangent > 0.0) {
		    vcp.tangentMass =   1.0 /  kTangent
		} else {
		    vcp.tangentMass =   0.0
		}
                vcp.velocityBias = 0.0
                let vRel = b2Dot22(vc.normal, subtract(subtract(add(vB, b2Cross21(wB, vcp.rB)), vA), b2Cross21(wA, vcp.rA)))
                if ((vRel < -b2VelocityThreshold)) {
                    vcp.velocityBias = -vc.restitution * vRel
                }
            }
            if ((vc.pointCount == indexTwo)) {
                let vcp1 = vc.points[0]
                let vcp2 = vc.points[1]
                let rn1A = b2Cross(vcp1.rA, vc.normal)
                let rn1B = b2Cross(vcp1.rB, vc.normal)
                let rn2A = b2Cross(vcp2.rA, vc.normal)
                let rn2B = b2Cross(vcp2.rB, vc.normal)
                let k11 = mA + mB + iA * rn1A * rn1A + iB * rn1B * rn1B
                let k22 = mA + mB + iA * rn2A * rn2A + iB * rn2B * rn2B
                let k12 = mA + mB + iA * rn1A * rn2A + iB * rn1B * rn2B
                let kMaxConditionNumber: Float64 = 1000.0
                if ((k11 * k11 < kMaxConditionNumber * (k11 * k22 - k12 * k12))) {
                    vc.mK.ex.set(k11, k12)
                    vc.mK.ey.set(k12, k22)
                    vc.normalMass = vc.mK.getInverse()
                } else {
                    vc.pointCount = 1
                }
            }
        }
    }
    
    func warmStart() {
        for (i in 0 .. mCount) {
            let vc = mVelocityConstraints[i]
            let indexA = vc.indexA
            let indexB = vc.indexB
            let mA = vc.invMassA
            let iA = vc.invIA
            let mB = vc.invMassB
            let iB = vc.invIB
            let pointCount = vc.pointCount
            var vA = mVelocities.get(index:indexA).v
            var wA = mVelocities.get(index:indexA).w
            var vB = mVelocities.get(index:indexB).v
            var wB = mVelocities.get(index:indexB).w
            let normal = vc.normal
            let tangent = b2Cross12(normal, 1.0)
            for (j in 0 .. pointCount) {
                let vcp = vc.points[j]
                let mP = add(multM(normal, vcp.normalImpulse), multM(tangent, vcp.tangentImpulse))
                wA -= iA * b2Cross(vcp.rA, mP)
                subtractEqual(vA, multM(mP, mA))
                wB += iB * b2Cross(vcp.rB, mP)
                addEqual(vB, multM(mP, mB))
            }
            mVelocities.get(index:indexA).v = vA
            mVelocities.get(index:indexA).w = wA
            mVelocities.get(index:indexB).v = vB
            mVelocities.get(index:indexB).w = wB
        }
    }
    
    func solveVelocityConstraints() {
        for (i in 0 .. mCount) {
            let vc = mVelocityConstraints[i]
            let indexA = vc.indexA
            let indexB = vc.indexB
            let mA = vc.invMassA
            let iA = vc.invIA
            let mB = vc.invMassB
            let iB = vc.invIB
            let pointCount = vc.pointCount
            var vA = mVelocities.get(index:indexA).v
            var wA = mVelocities.get(index:indexA).w
            var vB = mVelocities.get(index:indexB).v
            var wB = mVelocities.get(index:indexB).w
            let normal = vc.normal
            let tangent = b2Cross12(normal, 1.0)
            let friction = vc.friction
            for (j in 0 .. pointCount) {
                let vcp = vc.points[j]
                let dv = subtract(subtract(add(vB, b2Cross21(wB, vcp.rB)), vA), b2Cross21(wA, vcp.rA))
                let vt = b2Dot22(dv, tangent) - vc.tangentSpeed
                var lambda = vcp.tangentMass * (-vt)
                let maxFriction = friction * vcp.normalImpulse
                let newImpulse = b2ClampF(vcp.tangentImpulse + lambda, -maxFriction, maxFriction)
                lambda = newImpulse - vcp.tangentImpulse
                vcp.tangentImpulse = newImpulse
                let mP = multM(tangent, lambda)
                subtractEqual(vA, multM(mP, mA))
                wA -= iA * b2Cross(vcp.rA, mP)
                addEqual(vB, multM(mP, mB))
                wB += iB * b2Cross(vcp.rB, mP)
            }
            if ((vc.pointCount == 1)) {
                let vcp = vc.points[0]
                let dv = subtract(subtract(add(vB, b2Cross21(wB, vcp.rB)), vA), b2Cross21(wA, vcp.rA))
                let vn = b2Dot22(dv, normal)
                var lambda = -vcp.normalMass * (vn - vcp.velocityBias)
                let newImpulse = max(vcp.normalImpulse + lambda, 0.0)
                lambda = newImpulse - vcp.normalImpulse
                vcp.normalImpulse = newImpulse
                let mP = multM(normal, lambda)
                subtractEqual(vA, multM(mP, mA))
                wA -= iA * b2Cross(vcp.rA, mP)
                addEqual(vB, multM(mP, mB))
                wB += iB * b2Cross(vcp.rB, mP)
            } else {
                var cp1 = vc.points[0]
                var cp2 = vc.points[1]
                let a = B2Vec2(x0:cp1.normalImpulse, y0:cp2.normalImpulse)
                var dv1 = subtract(subtract(add(vB, b2Cross21(wB, cp1.rB)), vA), b2Cross21(wA, cp1.rA))
                var dv2 = subtract(subtract(add(vB, b2Cross21(wB, cp2.rB)), vA), b2Cross21(wA, cp2.rA))
                var vn1 = b2Dot22(dv1, normal)
                var vn2 = b2Dot22(dv2, normal)
                var b = B2Vec2()
                b.x = vn1 - cp1.velocityBias
                b.y = vn2 - cp2.velocityBias
                subtractEqual(b, b2Mul22(vc.mK, a))
                while ((true)) {
                    var x = minus(b2Mul22(vc.normalMass, b))
                    if ((x.x >= 0.0 && x.y >= 0.0)) {
                        let d = subtract(x, a)
                        let mP1 = multM(normal, d.x)
                        let mP2 = multM(normal, d.y)
                        subtractEqual(vA, multM(add(mP1, mP2), mA))
                        wA -= iA * (b2Cross(cp1.rA, mP1) + b2Cross(cp2.rA, mP2))
                        addEqual(vB, multM(add(mP1, mP2), mB))
                        wB += iB * (b2Cross(cp1.rB, mP1) + b2Cross(cp2.rB, mP2))
                        cp1.normalImpulse = x.x
                        cp2.normalImpulse = x.y
                        dv1 = subtract(subtract(add(vB, b2Cross21(wB, cp1.rB)), vA), b2Cross21(wA, cp1.rA))
                        dv2 = subtract(subtract(add(vB, b2Cross21(wB, cp2.rB)), vA), b2Cross21(wA, cp2.rA))
                        vn1 = b2Dot22(dv1, normal)
                        vn2 = b2Dot22(dv2, normal)
                        break
                    }
                    x.x = -cp1.normalMass * b.x
                    x.y = 0.0
                    vn1 = 0.0
                    vn2 = vc.mK.ex.y * x.x + b.y
                    if ((x.x >= 0.0 && vn2 >= 0.0)) {
                        let d = subtract(x, a)
                        let mP1 = multM(normal, d.x)
                        let mP2 = multM(normal, d.y)
                        subtractEqual(vA, multM(add(mP1, mP2), mA))
                        wA -= iA * (b2Cross(cp1.rA, mP1) + b2Cross(cp2.rA, mP2))
                        addEqual(vB, multM(add(mP1, mP2), mB))
                        wB += iB * (b2Cross(cp1.rB, mP1) + b2Cross(cp2.rB, mP2))
                        cp1.normalImpulse = x.x
                        cp2.normalImpulse = x.y
                        dv1 = subtract(subtract(add(vB, b2Cross21(wB, cp1.rB)), vA), b2Cross21(wA, cp1.rA))
                        vn1 = b2Dot22(dv1, normal)
                        break
                    }
                    x.x = 0.0
                    x.y = -cp2.normalMass * b.y
                    vn1 = vc.mK.ey.x * x.y + b.x
                    vn2 = 0.0
                    if ((x.y >= 0.0 && vn1 >= 0.0)) {
                        let d = subtract(x, a)
                        let mP1 = multM(normal, d.x)
                        let mP2 = multM(normal, d.y)
                        subtractEqual(vA, multM(add(mP1, mP2), mA))
                        wA -= iA * (b2Cross(cp1.rA, mP1) + b2Cross(cp2.rA, mP2))
                        addEqual(vB, multM(add(mP1, mP2), mB))
                        wB += iB * (b2Cross(cp1.rB, mP1) + b2Cross(cp2.rB, mP2))
                        cp1.normalImpulse = x.x
                        cp2.normalImpulse = x.y
                        dv2 = subtract(subtract(add(vB, b2Cross21(wB, cp2.rB)), vA), b2Cross21(wA, cp2.rA))
                        vn2 = b2Dot22(dv2, normal)
                        break
                    }
                    x.x = 0.0
                    x.y = 0.0
                    vn1 = b.x
                    vn2 = b.y
                    if ((vn1 >= 0.0 && vn2 >= 0.0)) {
                        let d = subtract(x, a)
                        let mP1 = multM(normal, d.x)
                        let mP2 = multM(normal, d.y)
                        subtractEqual(vA, multM(add(mP1, mP2), mA))
                        wA -= iA * (b2Cross(cp1.rA, mP1) + b2Cross(cp2.rA, mP2))
                        addEqual(vB, multM(add(mP1, mP2), mB))
                        wB += iB * (b2Cross(cp1.rB, mP1) + b2Cross(cp2.rB, mP2))
                        cp1.normalImpulse = x.x
                        cp2.normalImpulse = x.y
                        break
                    }
                    break
                }
            }
            mVelocities.get(index:indexA).v = vA
            mVelocities.get(index:indexA).w = wA
            mVelocities.get(index:indexB).v = vB
            mVelocities.get(index:indexB).w = wB
        }
    }
    
    func storeImpulses() {
        for (i in 0 .. mCount) {
            let vc = mVelocityConstraints[i]
            let manifold = mContacts[vc.contactIndex].manifold
            for (j in 0 .. vc.pointCount) {
                manifold.points[j].normalImpulse = vc.points[j].normalImpulse
                manifold.points[j].tangentImpulse = vc.points[j].tangentImpulse
            }
        }
    }
    
    func solvePositionConstraints() : Bool {
        var minSeparation: Float64 = 0.0
        let ratio = -3.0
        for (i in 0 .. mCount) {
            let pc = mPositionConstraints[i]
            let indexA = pc.indexA
            let indexB = pc.indexB
            let localCenterA = pc.localCenterA
            let mA = pc.invMassA
            let iA = pc.invIA
            let localCenterB = pc.localCenterB
            let mB = pc.invMassB
            let iB = pc.invIB
            let pointCount = pc.pointCount
            var cA = mPositions.get(index:indexA).c
            var aA = mPositions.get(index:indexA).a
            var cB = mPositions.get(index:indexB).c
            var aB = mPositions.get(index:indexB).a
            for (j in 0 .. pointCount) {
                let xfA = B2Transform()
                let xfB = B2Transform()
                xfA.q.set(aA)
                xfB.q.set(aB)
                xfA.p = subtract(cA, b2MulR2(xfA.q, localCenterA))
                xfB.p = subtract(cB, b2MulR2(xfB.q, localCenterB))
                let psm = B2PositionSolverManifold()
                psm.initialize(pc, xfA, xfB, j)
                let normal = psm.normal
                let point = psm.point
                let separation = psm.separation
                let rA = subtract(point, cA)
                let rB = subtract(point, cB)
                minSeparation = min(minSeparation, separation)
                let mC = b2ClampF(b2Baumgarte * (separation + b2LinearSlop), -b2MaxLinearCorrection, 0.0)
                let rnA = b2Cross(rA, normal)
                let rnB = b2Cross(rB, normal)
                let mK = mA + mB + iA * rnA * rnA + iB * rnB * rnB
               
		var impulse = 0.0
		if(mK > 0.0) {
		    impulse =-mC / mK
		} 
				
                let mP = multM(normal, impulse)
                subtractEqual(cA, multM(mP, mA))
                aA -= iA * b2Cross(rA, mP)
                addEqual(cB, multM(mP, mB))
                aB += iB * b2Cross(rB, mP)
            }
            mPositions.get(index:indexA).c = cA
            mPositions.get(index:indexA).a = aA
            mPositions.get(index:indexB).c = cB
            mPositions.get(index:indexB).a = aB
        }
        return minSeparation >= ratio * b2LinearSlop
    }
    
    func solveToiPositionConstraints( toiIndexA: Int64,  toiIndexB: Int64) : Bool {
        let ratio = -1.5
        var minSeparation: Float64 = 0.0
        for (i in 0 .. mCount) {
            let pc = mPositionConstraints[i]
            let indexA = pc.indexA
            let indexB = pc.indexB
            let localCenterA = pc.localCenterA
            let localCenterB = pc.localCenterB
            let pointCount = pc.pointCount
            var mA: Float64 = 0.0
            var iA: Float64 = 0.0
            if ((indexA == toiIndexA || indexA == toiIndexB)) {
                mA = pc.invMassA
                iA = pc.invIA
            }
            var mB: Float64 = 0.0
            var iB: Float64 = 0.0
            if ((indexB == toiIndexA || indexB == toiIndexB)) {
                mB = pc.invMassB
                iB = pc.invIB
            }
            var cA = mPositions.get(index:indexA).c
            var aA = mPositions.get(index:indexA).a
            var cB = mPositions.get(index:indexB).c
            var aB = mPositions.get(index:indexB).a
            for (j in 0 .. pointCount) {
                let xfA = B2Transform()
                let xfB = B2Transform()
                xfA.q.set(aA)
                xfB.q.set(aB)
                xfA.p = subtract(cA, b2MulR2(xfA.q, localCenterA))
                xfB.p = subtract(cB, b2MulR2(xfB.q, localCenterB))
                let psm = B2PositionSolverManifold()
                psm.initialize(pc, xfA, xfB, j)
                let normal = psm.normal
                let point = psm.point
                let separation = psm.separation
                let rA = subtract(point, cA)
                let rB = subtract(point, cB)
                minSeparation = min(minSeparation, separation)
                let mC = b2ClampF(b2ToiBaugarte * (separation + b2LinearSlop), -b2MaxLinearCorrection, 0.0)
                let rnA = b2Cross(rA, normal)
                let rnB = b2Cross(rB, normal)
                let mK = mA + mB + iA * rnA * rnA + iB * rnB * rnB
                var impulse = 0.0
                if(mK > 0.0) {
                    impulse = -mC / mK
                }
                let mP = multM(normal, impulse)
                subtractEqual(cA, multM(mP, mA))
                aA -= iA * b2Cross(rA, mP)
                addEqual(cB, multM(mP, mB))
                aB += iB * b2Cross(rB, mP)
            }
            mPositions.get(index:indexA).c = cA
            mPositions.get(index:indexA).a = aA
            mPositions.get(index:indexB).c = cB
            mPositions.get(index:indexB).a = aB
        }
        return minSeparation >= ratio * b2LinearSlop
    }
    
    var mStep : B2TimeStep
    var mPositions : B2Array<B2Position>
    var mVelocities : B2Array<B2Velocity>
    var mPositionConstraints : ArrayList<B2ContactPositionConstraint>
    var mVelocityConstraints : ArrayList<B2ContactVelocityConstraint>
    var mContacts : ArrayList<B2Contact>
    var mCount : Int64
}

open class B2ContactPositionConstraint {
    var localPoints :ArrayList<B2Vec2>
    var localNormal = B2Vec2()
    var localPoint = B2Vec2()
    var indexA = 0
    var indexB = 0
    var invMassA: Float64 = 0.0
    var invMassB: Float64 = 0.0
    var localCenterA = B2Vec2()
    var localCenterB = B2Vec2()
    var invIA: Float64 = 0.0
    var invIB: Float64 = 0.0
    var `type`: B2ManifoldType = CIRCLES
    var radiusA: Float64 = 0.0
    var radiusB: Float64 = 0.0
    var pointCount = 0
    
    init() {
        localPoints = ArrayList<B2Vec2>()
        for (i in 0..b2MaxManifoldPoints) {
            localPoints.add(B2Vec2())
        }
    }
}

class B2PositionSolverManifold {
    func initialize( pc: B2ContactPositionConstraint,  xfA: B2Transform,  xfB: B2Transform,  index: Int64) {
        match ( (pc.`type`)) {
        case B2ManifoldType.CIRCLES =>
            let pointA = b2MulT2(xfA, pc.localPoint)
            let pointB = b2MulT2(xfB, pc.localPoints[0])
            normal = subtract(pointB, pointA)
            normal.normalize()
            point = multM(add(pointA, pointB), half)
            separation = b2Dot22(subtract(pointB, pointA), normal) - pc.radiusA - pc.radiusB
        case B2ManifoldType.FACEA =>
            normal = b2MulR2(xfA.q, pc.localNormal)
            let planePoint0 = b2MulT2(xfA, pc.localPoint)
            let clipPoint0 = b2MulT2(xfB, pc.localPoints[index])
            separation = b2Dot22(subtract(clipPoint0, planePoint0), normal) - pc.radiusA - pc.radiusB
            point = clipPoint0
        case B2ManifoldType.FACEB =>
            normal = b2MulR2(xfB.q, pc.localNormal)
            let planePoint = b2MulT2(xfB, pc.localPoint)
            let clipPoint = b2MulT2(xfA, pc.localPoints[index])
            separation = b2Dot22(subtract(clipPoint, planePoint), normal) - pc.radiusA - pc.radiusB
            point = clipPoint
            normal = minus(normal)
        case _ =>
            throw Exception("invalid params to initialize")
        }
    }
    var normal = B2Vec2()
    var point = B2Vec2()
    var separation: Float64 = 0.0
}

