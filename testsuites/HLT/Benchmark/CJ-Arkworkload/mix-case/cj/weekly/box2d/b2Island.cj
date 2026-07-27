/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.math.*
import std.collection.*

open class B2Island {
    var mListener: ?B2ContactListener
    var mBodies: ArrayList<B2Body>
    var mContacts: ArrayList<B2Contact>
    var mJoints: ArrayList<B2Joint>
    var mPositions: B2Array<B2Position>
    var mVelocities: B2Array<B2Velocity>
    public prop mBodyCount: Int64 { 
        get() {
            mBodies.size
	}
    }
    public prop mJointCount: Int64  { 
        get() {
	    mJoints.size
	}
    }
    public prop mContactCount: Int64  { 
        get() {
            mContacts.size
	}
    }
    var mBodyCapacity: Int64
    var mContactCapacity: Int64
    var mJointCapacity: Int64
    init( bodyCapacity: Int64,  contactCapacity: Int64,  jointCapacity: Int64,  listener: ?B2ContactListener) {
        mBodyCapacity = bodyCapacity
        mContactCapacity = contactCapacity
        mJointCapacity     = jointCapacity
        mListener = listener
        mBodies = ArrayList<B2Body>()
        mContacts = ArrayList<B2Contact>()
        mJoints = ArrayList<B2Joint>()
        mVelocities = B2Array<B2Velocity>()
        mPositions = B2Array<B2Position>()
    }
    
    func reset( bodyCapacity: Int64,  contactCapacity: Int64,  jointCapacity: Int64,  listener: ?B2ContactListener) {
        mBodyCapacity = bodyCapacity
        mContactCapacity = contactCapacity
        mJointCapacity     = jointCapacity
        mListener = listener
        mBodies.clear()
        mContacts.clear()
        mJoints.clear()
        mVelocities.removeAll()
        mPositions.removeAll()
    }
    
    func removeAll() {
        mBodies.clear()
        mContacts.clear()
        mJoints.clear()
    }
    
    func solve( step: B2TimeStep,  gravity: B2Vec2,  allowSleep: Bool) {
        let h = step.dt
        mPositions.removeAll()
        mVelocities.removeAll()
        for (i in 0 .. mBodyCount) {
            let b = mBodies[i]
            let c = b.mSweep.c
            let a = b.mSweep.a
            var v = b.mLinearVelocity
            var w = b.mAngularVelocity
            b.mSweep.c0 = b.mSweep.c
            b.mSweep.a0 = b.mSweep.a
            if (b.mType.getvalue() == B2BodyType.DYNAMICBODY.getvalue()) {
                v = addEqual(v, multM(add(multM(gravity, b.mGravityScale), multM(b.mForce, b.mInvMass)), h))
                w += h * b.mInvI * b.mTorque
                v = mulEqual(a:v,b: 1.0 / (1.0 + h * b.mLinearDamping))
                w *= 1.0 / (1.0 + h * b.mAngularDamping)
            }
            mPositions.append(newElement:B2Position(c, a))
            mVelocities.append(newElement:B2Velocity(v, w))
        }
        var solverData = B2SolverData()
        solverData.step = step
        solverData.positions = mPositions
        solverData.velocities = mVelocities
        var contactSolverDef = B2ContactSolverDef()
        contactSolverDef.step = step
        contactSolverDef.contacts = mContacts
        contactSolverDef.count = mContactCount
        contactSolverDef.positions = mPositions
        contactSolverDef.velocities = mVelocities
        let contactSolver = B2ContactSolver(contactSolverDef)
        contactSolver.initializeVelocityConstraints()
        if (step.warmStarting) {
            contactSolver.warmStart()
        }
        for (i in 0 .. mJointCount) {
            solverData = mJoints[i].initVelocityConstraints(solverData)
        }
        for (i in 0 .. step.velocityIterations) {
            for (j in 0 .. mJointCount) {
                solverData = mJoints[j].solveVelocityConstraints(solverData)
            }
            contactSolver.solveVelocityConstraints()
        }
        contactSolver.storeImpulses()
        for (i in 0 .. mBodyCount) {
            var c = mPositions.get(index:i).c
            var a = mPositions.get(index:i).a
            var v = mVelocities.get(index:i).v
            var w = mVelocities.get(index:i).w
            let translation = multM(v, h)
            if (b2Dot22(translation, translation) > b2MaxTranslationSquared) {
                let ratio = b2MaxTranslation / translation.length()
                v = mulEqual(a:v, b:ratio)
            }
            let rotation = h * w
            if (rotation * rotation > b2MaxRotationSquared) {
                let ratio = b2MaxRotation / abs(rotation)
                w *= ratio
            }
            c = add(c, multM(v, h))
            a += h * w
            mPositions.get(index:i).c = c
            mPositions.get(index:i).a = a
            mVelocities.get(index:i).v = v
            mVelocities.get(index:i).w = w
            let b = mBodies[i]
            b.mSweep.c0.set(b.mSweep.c.x, b.mSweep.c.y)
            b.mSweep.a0 = b.mSweep.a
            b.mSweep.c.x += step.dt * b.mLinearVelocity.x
            b.mSweep.c.y += step.dt * b.linearVelocity.y
            b.mSweep.a += step.dt * b.angularVelocity
            b.synchronizeTransform()
        }
        var positionSolved = false
        for (i in 0 .. step.positionIterations) {
            let contactsOkay = contactSolver.solvePositionConstraints()
            var jointsOkay = true
            for (i2 in 0 .. mJointCount) {
                var jointOkay = mJoints[i2].solvePositionConstraints(solverData)
                jointsOkay = jointsOkay && jointOkay
            }
            if (contactsOkay && jointsOkay) {
                positionSolved = true
                break
            }
        }
        for (i in 0 .. mBodyCount) {
            let body = mBodies[i]
            body.mSweep.c = mPositions.get(index:i).c
            body.mSweep.a = mPositions.get(index:i).a
            body.mLinearVelocity = mVelocities.get(index:i).v
            body.mAngularVelocity = mVelocities.get(index:i).w
            body.synchronizeTransform()
        }
        report(contactSolver.mVelocityConstraints)
        if (allowSleep) {
            var minSleepTime = b2MaxFloat
            let linTolSqr = b2LinearSleepTolerance * b2LinearSleepTolerance
            let angTolSqr = b2AngularSleepTolerance * b2AngularSleepTolerance
            for (i in 0 .. mBodyCount) {
                let b = mBodies[i]
                if (b.typeBody.getvalue() == B2BodyType.STATICBODY.getvalue()) {
                    continue
                }
                let ats = b.mAngularVelocity * b.mAngularVelocity > angTolSqr
                let lts = b2Dot22(b.mLinearVelocity, b.mLinearVelocity) > linTolSqr
                if ((b.mFlags & Flags.autoSleepFlag) == 0 || ats || lts) {
                    b.mSleepTime = 0.0
                    minSleepTime = 0.0
                } else {
                    b.mSleepTime += h
                    minSleepTime = min(minSleepTime, b.mSleepTime)
                }
            }
            if (minSleepTime >= b2TimeToSleep && positionSolved) {
                for (i in 0 .. mBodyCount) {
                    let b = mBodies[i]
                    b.setAwake(false)
                }
            }
        }
    }
    func solveToi( subStep: B2TimeStep,  toiIndexA: Int64,  toiIndexB: Int64) {
        mPositions.removeAll()
        mVelocities.removeAll()
        for (i in 0 .. mBodyCount) {
            let b = mBodies[i]
            mPositions.append(newElement:B2Position(b.mSweep.c, b.mSweep.a))
            mVelocities.append(newElement:B2Velocity(b.mLinearVelocity, b.mAngularVelocity))
        }
        let contactSolverDef = B2ContactSolverDef()
        contactSolverDef.contacts = mContacts
        contactSolverDef.count = mContactCount
        contactSolverDef.step = subStep
        contactSolverDef.positions = mPositions
        contactSolverDef.velocities = mVelocities
        let contactSolver = B2ContactSolver(contactSolverDef)
        for (i in 0 .. subStep.positionIterations) {
            let contactsOkay = contactSolver.solveToiPositionConstraints(toiIndexA, toiIndexB)
            if (contactsOkay) {
                break
            }
        }
        mBodies[toiIndexA].mSweep.c0 = mPositions.get(index:toiIndexA).c
        mBodies[toiIndexA].mSweep.a0 = mPositions.get(index:toiIndexA).a
        mBodies[toiIndexB].mSweep.c0 = mPositions.get(index:toiIndexB).c
        mBodies[toiIndexB].mSweep.a0 = mPositions.get(index:toiIndexB).a
        contactSolver.initializeVelocityConstraints()
        for (i in 0 .. subStep.velocityIterations) {
            contactSolver.solveVelocityConstraints()
        }
        let h = subStep.dt
        for (i in 0 .. mBodyCount) {
            var c = mPositions.get(index:i).c
            var a = mPositions.get(index:i).a
            var v = mVelocities.get(index:i).v
            var w = mVelocities.get(index:i).w
            let translation = multM(v, h)
            if (b2Dot22(translation, translation) > b2MaxTranslationSquared) {
                let ratio = b2MaxTranslation / translation.length()
                v = mulEqual(a:v, b:ratio)
            }
            let rotation = h * w
            if (rotation * rotation > b2MaxRotationSquared) {
                let ratio = b2MaxRotation / abs(rotation)
                w *= ratio
            }
            c = addEqual(c, multM(v, h))
            a += h * w
            mPositions.get(index:i).c = c
            mPositions.get(index:i).a = a
            mVelocities.get(index:i).v = v
            mVelocities.get(index:i).w = w
            let body = mBodies[i]
            body.mSweep.c = c
            body.mSweep.a = a
            body.mLinearVelocity = v
            body.mAngularVelocity = w
            body.synchronizeTransform()
        }
        report(contactSolver.mVelocityConstraints)
    }
    
    func addB( body: B2Body) {
        body.mIslandIndex = mBodyCount
        mBodies.add(body)
    }
    
    func addC( contact: B2Contact) {
        mContacts.add(contact)
    }
    
    func addJ( joint: B2Joint) {
        mJoints.add(joint)
    }
    
    func report( constraints: ArrayList<B2ContactVelocityConstraint>) {
        if (mListener.isNone()) {
            return
        }
        for (i in 0 .. mContactCount) {
            let c = mContacts[i]
            let vc = constraints[i]
            let impulse = B2ContactImpulse()
            impulse.count = vc.pointCount
            for (j in 0 .. vc.pointCount) {
                impulse.normalImpulses[j] = vc.points[j].normalImpulse
                impulse.tangentImpulses[j] = vc.points[j].tangentImpulse
            }
            mListener.getOrThrow().postSolve(c, impulse)
        }
    }

}
