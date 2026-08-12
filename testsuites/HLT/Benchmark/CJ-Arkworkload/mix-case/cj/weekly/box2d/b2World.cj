/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.math.*
import std.collection.*

open class B2World {
    var mIsland: ?B2Island = Option<B2Island>.None
    var mToiIsland: ?B2Island = Option<B2Island>.None
    var mFlags = FlagsW.clearForces
    var mContactManager = B2ContactManager()
    var mBodyList: ?B2Body = Option<B2Body>.None
    var mJointList: ?B2Joint = Option<B2Joint>.None
    var mBodyCount = 0
    var mJointCount = 0
    var mGravity: B2Vec2
    var mAllowSleep = true
    var mDestructionListener: ?B2DestructionListener = Option<B2DestructionListener>.None
    var mInvDt0: Float64 = 0.0
    var mWarmStarting = true
    var mContinuousPhysics = true
    var mSubStepping = false
    var mStepComplete = true
    var mProfile = B2Profile()
    public init( gravity: B2Vec2) {
        mDestructionListener = Option<B2DestructionListener>.None
        mBodyList = Option<B2Body>.None
        mJointList = Option<B2Joint>.None
        mBodyCount = 0
        mJointCount = 0
        mWarmStarting = true
        mContinuousPhysics = true
        mSubStepping = false
        mStepComplete = true
        mAllowSleep = true
        mGravity = gravity
        mFlags = FlagsW.clearForces
        mInvDt0 = 0.0
        mContactManager = B2ContactManager()
    }
    
    public open func setDestructionListener( listener: B2DestructionListener) {
        mDestructionListener = listener
    }
    
    public open func setContactFilter( filter: B2ContactFilter) {
        mContactManager.mContactFilter = filter
    }
    
    public open func setContactListener( listener: B2ContactListener) {
        mContactManager.mContactListener = listener
    }
    
    public open func createBody( def: B2BodyDef) : B2Body {
        if (isLocked()) {
            throw Exception("world is locked")
        }
        let b = B2Body(def, this)
        b.mPrev = Option<B2Body>.None
        b.mNext = mBodyList
        if (mBodyList.isSome()) {
            mBodyList.getOrThrow().mPrev = b
        }
        mBodyList = b
        mBodyCount += 1
        return b
    }
    
    public open func destroyBody( b: B2Body) {
        if (isLocked()) {
            return
        }
        var je = b.mJointList
        while (je.isSome()) {
            let je0 = je
            je = je.getOrThrow().next
            if (mDestructionListener.isSome()) {
                mDestructionListener.getOrThrow().sayGoodbye(je0.getOrThrow().joint)
            }
            b.mJointList = je
        }
        b.mJointList = Option<B2JointEdge>.None
        var ce = b.mContactList
        while (ce.isSome()) {
            let ce0 = ce
            ce = ce.getOrThrow().next
            mContactManager.destroy(ce0.getOrThrow().contact)
        }
        b.mContactList = Option<B2ContactEdge>.None
        var f = b.mFixtureList
        while (f.isSome()) {
            let f0 = f.getOrThrow()
            f = f.getOrThrow().mNext
            if (mDestructionListener.isSome()) {
                mDestructionListener.getOrThrow().sayGoodbye(f0)
            }
            f0.destroyProxies(mContactManager.mBroadPhase)
            f0.destroy()
            b.mFixtureList = f
            b.mFixtureCount -= 1
        }
        b.mFixtureList = Option<B2Fixture>.None
        b.mFixtureCount = 0
        if (b.mPrev.isSome()) {
            b.mPrev.getOrThrow().mNext = b.mNext
        }
        if (b.mNext.isSome()) {
            b.mNext.getOrThrow().mPrev = b.mPrev
        }
        if ( refEq(b,mBodyList.getOrThrow())) {
            mBodyList = b.mNext
        }
        mBodyCount -= 1
    }
    
    public open func step( dt: Float64,  velocityIterations: Int64,  positionIterations: Int64) {
        if ((mFlags & FlagsW.newFixture) != 0) {
            mContactManager.findNewContacts()
            mFlags &= !FlagsW.newFixture
        }
        mFlags |= FlagsW.locked
        let step = B2TimeStep()
        step.dt = dt
        step.velocityIterations    = velocityIterations
        step.positionIterations = positionIterations
        if (dt > 0.0) {
            step.invDt = 1.0 / dt
        } else {
            step.invDt = 0.0
        }
        step.dtRatio = mInvDt0 * dt
        step.warmStarting = mWarmStarting
        mContactManager.collide()
        if (mStepComplete && step.dt > 0.0) {
            solve(step)
        }
        if (mContinuousPhysics && step.dt > 0.0) {
            solveToi(step)
        }
        if (step.dt > 0.0) {
            mInvDt0 = step.invDt
        }
        if ((mFlags & FlagsW.clearForces) != 0) {
            clearForces()
        }
        mFlags &= !FlagsW.locked
    }
    
    public open func clearForces() {
        var body = mBodyList
        while (body.isSome()) {
            body.getOrThrow().mForce.setZero()
            body.getOrThrow().mTorque = 0.0
            body = body.getOrThrow().getNext()
        }
    }
        
    public open func queryAaBb( callback: B2QueryCallback,  aabb: B2AaBb) {
        let wrapper = B2WorldQueryWrapper()
        wrapper.broadPhase = mContactManager.mBroadPhase
        wrapper.callback = callback
        mContactManager.mBroadPhase.query(wrapper, aabb)
    }
    
    public open func queryAaBb2( aabb: B2AaBb,  callback: B2QueryCallbackFunction) {
        queryAaBb(B2QueryCallbackProxy(callback), aabb)
    }
    
    public open func rayCast( callback: B2RayCastCallback,  point1: B2Vec2,  point2: B2Vec2) {
        let wrapper = B2WorldRayCastWrapper()
        wrapper.broadPhase = mContactManager.mBroadPhase
        wrapper.callback = callback
        let input = B2RayCastInput()
        input.maxFraction = 1.0
        input.p1 = point1
        input.p2 = point2
        mContactManager.mBroadPhase.rayCast(wrapper, input)
    }
    
    public open func rayCast2( point1: B2Vec2,  point2: B2Vec2,  callback: B2RayCastCallbackFunction) {
        rayCast(B2RayCastCallbackProxy(callback), point1, point2)
    }
    
    public open func getBodyList():?B2Body {        
        return  mBodyList
        
    }
    
    public open func getJointList() : ?B2Joint {
        return mJointList
    }
    
    public open func getContactList() : ?B2Contact {
        return mContactManager.mContactList
    }
    
    public open func setAllowSleeping( flag: Bool) {
        if (flag == mAllowSleep) {
            return
        }
        mAllowSleep = flag
        if (mAllowSleep == false) {
            var b = mBodyList
            while (b.isSome()) {
                b.getOrThrow().setAwake(true)
                b = b.getOrThrow().mNext
            }
        }
    }
    
    public open mut prop allowSleeping: Bool {
        get() {
            mAllowSleep
        }
        set(newValue) {
            setAllowSleeping(newValue)
        }
    }
    
    public open func setWarmStarting( flag: Bool) {
        mWarmStarting = flag
    }
    
  
    
    public open func setContinuousPhysics( flag: Bool) {
        mContinuousPhysics = flag
    }
    
    public open mut prop continuousPhysics: Bool {
        get() {
            mContinuousPhysics
        }
        set(newValue) {
            setContinuousPhysics(newValue)
        }
    }
    
    public open func setSubStepping( flag: Bool) {
        mSubStepping = flag
    }
    
    public open mut prop subStepping: Bool {
        get() {
            mSubStepping
        }
        set(newValue) {
            setSubStepping(newValue)
        }
    }
    
    public open func proxyCount(): Int64 {
        return mContactManager.mBroadPhase.getProxyCount()
        
    }
    
    public open func bodyCount(): Int64 {
        
        return mBodyCount
        
    }
    
    public open func jointCount(): Int64 {
        return mJointCount
    }
    
    public open func contactCount(): Int64 {
        return mContactManager.mContactCount
    }
    
    public open func treeHeight(): Int64 {
        
        return mContactManager.mBroadPhase.getTreeHeight()
        
    }
    
    public open func treeBalance(): Int64 {
        return mContactManager.mBroadPhase.getTreeBalance()
        
    }
    
    public open func treeQuality(): Float64 {
        return mContactManager.mBroadPhase.getTreeQuality()
    }
    
    public open func setGravity( gravity: B2Vec2) {
        mGravity = gravity
    }
    
    public open mut prop gravity: B2Vec2 {
        get() {
            mGravity
        }
        set(newValue) {
            setGravity(newValue)
        }
    }
    
    public open func isLocked():Bool {
        return (mFlags & FlagsW.locked) == FlagsW.locked
        
    }
    
    public open func setAutoClearForces( flag: Bool) {
        if (flag) {
            mFlags |= FlagsW.clearForces
        } else {
            mFlags &= !FlagsW.clearForces
        }
    }
    

    
    public open func shiftOrigin( newOrigin: B2Vec2) {
        if ((mFlags & FlagsW.locked) == FlagsW.locked) {
            return
        }
        var b = mBodyList
        while (b.isSome()) {
            subtractEqual(b.getOrThrow().mXF.p, newOrigin)
            subtractEqual(b.getOrThrow().mSweep.c0, newOrigin)
            subtractEqual(b.getOrThrow().mSweep.c, newOrigin)
            b = b.getOrThrow().mNext
        }
        var j = mJointList
        while (j.isSome()) {
            j.getOrThrow().shiftOrigin(newOrigin)
            j = j.getOrThrow().mNext
        }
        mContactManager.mBroadPhase.shiftOrigin(newOrigin)
    }
    

    
    func solve( step: B2TimeStep) {
        mProfile.solveInit = 0.0
        mProfile.solveVelocity = 0.0
        mProfile.solvePosition = 0.0
        
        if (mIsland.isNone()) {
            mIsland = B2Island(mBodyCount, mContactManager.mContactCount, mJointCount, mContactManager.mContactListener)
        } else {
            mIsland.getOrThrow().reset(mBodyCount, mContactManager.mContactCount, mJointCount, mContactManager.mContactListener)
        }
        let island = mIsland
        var b = mBodyList
        while (b.isSome()) {
            b.getOrThrow().mFlags &= Flags.islandFlag
            b = b.getOrThrow().mNext
        }
        var c = mContactManager.mContactList
        while (c.isSome()) {
            c.getOrThrow().mFlags &= FlagContacts.ISLANDFLAG.getValue()
            c = c.getOrThrow().mNext
        }
        var j = mJointList
        while (j.isSome()) {
            j.getOrThrow().mIslandFlag = false
            j = j.getOrThrow().mNext
        }
        var stack = ArrayList<B2Body>()
        var seed = mBodyList
        while (seed.isSome()) {
            if ((seed.getOrThrow().mFlags & Flags.islandFlag) != 0) {
                seed = seed.getOrThrow().mNext
                continue
            }
            if (seed.getOrThrow().isAwake() == false || seed.getOrThrow().isActive == false) {
                seed = seed.getOrThrow().mNext
                continue
            }
            if (seed.getOrThrow().typeBody.getvalue() == B2BodyType.STATICBODY.getvalue()) {
                seed = seed.getOrThrow().mNext
                continue
            }
            island.getOrThrow().removeAll()
            stack.add(seed.getOrThrow())
            seed.getOrThrow().mFlags |= Flags.islandFlag
            while (stack.size > 0) {
                var index = stack.size - 1
                let b = stack.remove(at: index)
                island.getOrThrow().addB(b)
                b.setAwake(true)
                if (b.typeBody.getvalue() == B2BodyType.STATICBODY.getvalue()) {
                    continue
                }
                var ce = b.mContactList
                while (ce.isSome()) {
                    let contact = ce.getOrThrow().contact
                    if ((contact.mFlags & FlagContacts.ISLANDFLAG.getValue()) != 0) {
                        ce = ce.getOrThrow().next
                        continue
                    }
                    if (contact.isEnabled == false || contact.isTouching == false) {
                        ce = ce.getOrThrow().next
                        continue
                    }
                    let sensorA = contact.mFixtureA.getOrThrow().mIsSensor
                    let sensorB = contact.mFixtureB.getOrThrow().mIsSensor
                    if (sensorA || sensorB) {
                        ce = ce.getOrThrow().next
                        continue
                    }
                    island.getOrThrow().addC(contact)
                    contact.mFlags |= FlagContacts.ISLANDFLAG.getValue()
                    let other = ce.getOrThrow().other
                    if (((other.getOrThrow().mFlags) & Flags.islandFlag) != 0) {
                        ce = ce.getOrThrow().next
                        continue
                    }
                    stack.add(other.getOrThrow())
                    other?.mFlags |= Flags.islandFlag
                    ce = ce.getOrThrow().next
                }
                var je = b.mJointList
                while (je.isSome()) {
                    if (je.getOrThrow().joint.mIslandFlag == true) {
                        je = je.getOrThrow().next
                        continue
                    }
                    let other: B2Body = je.getOrThrow().other.getOrThrow()
                    if (other.isActive == false) {
                        je = je.getOrThrow().next
                        continue
                    }
                    
                    island.getOrThrow().addJ(je.getOrThrow().joint)
                    je.getOrThrow().joint.mIslandFlag = true
                    
                    if ((other.mFlags & Flags.islandFlag) != 0) {
                        je = je.getOrThrow().next
                        continue
                    }
                    stack.add(other)
                    other.mFlags |= Flags.islandFlag
                }
            }
            island.getOrThrow().solve(step, mGravity, mAllowSleep)
            for (i in 0 .. island.getOrThrow().mBodyCount) {
                let b = island.getOrThrow().mBodies[i]
                if (b.typeBody.getvalue() == B2BodyType.STATICBODY.getvalue()) {
                    b.mFlags &= !Flags.islandFlag
                }
            }
            seed = seed.getOrThrow().mNext
        }
        stack.clear()
        var locB = this.mBodyList
        while (locB.isSome()) {
            if ((locB.getOrThrow().mFlags & Flags.islandFlag) == 0) {
                locB = locB.getOrThrow().getNext()
                continue
            }
            if (locB.getOrThrow().typeBody.getvalue() == B2BodyType.STATICBODY.getvalue()) {
                locB = locB.getOrThrow().getNext()
                continue
            }
            locB.getOrThrow().synchronizeFixtures()
            locB = locB.getOrThrow().getNext()
        }
        mContactManager.findNewContacts()
    }
    
    func solveToi( step: B2TimeStep) {
        if (mToiIsland.isNone()) {
            mToiIsland = B2Island(indexTwo * b2MaxTOIContacts, b2MaxTOIContacts, 0, mContactManager.mContactListener)
        } else {
            mToiIsland.getOrThrow().reset(indexTwo * b2MaxTOIContacts, b2MaxTOIContacts, 0, mContactManager.mContactListener)
        }
        let island = mToiIsland
        if (mStepComplete) {
            var b = mBodyList
            while (b.isSome()) {
                b.getOrThrow().mFlags &= !Flags.islandFlag
                b.getOrThrow().mSweep.alpha0 = 0.0
                b = b.getOrThrow().mNext
            }
            var c = mContactManager.mContactList
            while (c.isSome()) {
                c.getOrThrow().mFlags &= !(FlagContacts.TOIFLAG.getValue() | FlagContacts.ISLANDFLAG.getValue())
                c.getOrThrow().mToiCount = 0
                c.getOrThrow().mToi = 1.0
                c = c.getOrThrow().mNext
            }
        }
        while (true) {
            var minContact: ?B2Contact = Option<B2Contact>.None
            var minAlpha: Float64 = 1.0
            var c = mContactManager.mContactList
            while (c.isSome()) {
                if (c.getOrThrow().isEnabled == false) {
                    c = c.getOrThrow().mNext
                    continue
                }
                if (c.getOrThrow().mToiCount > b2MaxSubSteps) {
                    c = c.getOrThrow().mNext
                    continue
                }
                var alpha: Float64 = 1.0
                if ((c.getOrThrow().mFlags & FlagContacts.TOIFLAG.getValue()) != 0) {
                    alpha = c.getOrThrow().mToi
                } else {
                    let fA = c.getOrThrow().fixtureA
                    let fB = c.getOrThrow().fixtureB
                    if (fA.isSensor || fB.isSensor) {
                        c = c.getOrThrow().mNext
                        continue
                    }
                    let bA = fA.body()
                    let bB = fB.body()
                    let typeA = bA.mType
                    let typeB = bB.mType
                    let activeA = bA.isAwake() && typeA.getvalue() != B2BodyType.STATICBODY.getvalue()
                    let activeB = bB.isAwake() && typeB.getvalue() != B2BodyType.STATICBODY.getvalue()
                    if (activeA == false && activeB == false) {
                        c = c.getOrThrow().mNext
                        continue
                    }
                    let collideA = bA.isBullet || typeA.getvalue() != B2BodyType.DYNAMICBODY.getvalue()
                    let collideB = bB.isBullet || typeB.getvalue() != B2BodyType.DYNAMICBODY.getvalue()
                    if (collideA == false && collideB == false) {
                        c = c.getOrThrow().mNext
                        continue
                    }
                    var alpha0 = bA.mSweep.alpha0
                    if (bA.mSweep.alpha0 < bB.mSweep.alpha0) {
                        alpha0 = bB.mSweep.alpha0
                        bA.mSweep.advance(alpha0)
                    } else if (bB.mSweep.alpha0 < bA.mSweep.alpha0) {
                        alpha0 = bA.mSweep.alpha0
                        bB.mSweep.advance(alpha0)
                    }
                    let input = B2ToiInput()
                    input.proxyA.set(fA.shape.getOrThrow())
                    input.proxyB.set(fB.shape.getOrThrow())
                    input.sweepA = bA.mSweep
                    input.sweepB = bB.mSweep
                    input.tMax = 1.0
                    var output = B2ToiOutput()
                    b2TimeOfImpact(output, input)
                    let beta = output.t
                    if (output.state.getValue() == State.TOUCHING.getValue()) {
                        alpha = min(alpha0 + (1.0 - alpha0) * beta, 1.0)
                    } else {
                        alpha = 1.0
                    }
                    c.getOrThrow().mToi = alpha
                    c.getOrThrow().mFlags |= FlagContacts.TOIFLAG.getValue()
                }
                if (alpha < minAlpha) {
                    minContact = c
                    minAlpha = alpha
                }
                c = c.getOrThrow().mNext
            }
            if (minContact.isNone() || 1.0 - float10 * b2Epsilon < minAlpha) {
                mStepComplete = true
                break
            }
            let fA = minContact.getOrThrow().fixtureA
            let fB = minContact.getOrThrow().fixtureB
            let bA = fA.body()
            let bB = fB.body()
            let backup1 = bA.mSweep
            let backup2 = bB.mSweep
            bA.advance(minAlpha)
            bB.advance(minAlpha)
            minContact.getOrThrow().update(mContactManager.mContactListener)
            minContact.getOrThrow().mFlags &= !FlagContacts.TOIFLAG.getValue()
            minContact.getOrThrow().mToiCount += 1
            if (minContact.getOrThrow().isEnabled == false || minContact.getOrThrow().isTouching == false) {
                minContact.getOrThrow().setEnabled(false)
                bA.mSweep = backup1
                bB.mSweep = backup2
                bA.synchronizeTransform()
                bB.synchronizeTransform()
                continue
            }
            bA.setAwake(true)
            bB.setAwake(true)
            island.getOrThrow().removeAll()
            island.getOrThrow().addB(bA)
            island.getOrThrow().addB(bB)
            island.getOrThrow().addC(minContact.getOrThrow())
            bA.mFlags |= Flags.islandFlag
            bB.mFlags |= Flags.islandFlag
            minContact.getOrThrow().mFlags |= FlagContacts.ISLANDFLAG.getValue()
            let bodies = [bA, bB]
            for (i in 0 .. indexTwo) {
                let body = bodies[i]
                if (body.getMType().getvalue() == B2BodyType.DYNAMICBODY.getvalue()) {
                    var ce = body.mContactList
                    while (ce.isSome()) {
                        if (island.getOrThrow().mBodyCount == island.getOrThrow().mBodyCapacity) {
                            break
                        }
                        if (island.getOrThrow().mContactCount == island.getOrThrow().mContactCapacity) {
                            break
                        }
                        let contact = ce.getOrThrow().contact
                        if ((contact.mFlags & FlagContacts.ISLANDFLAG.getValue()) != 0) {
                            ce = ce.getOrThrow().next
                            continue
                        }
                        let other = ce.getOrThrow().other.getOrThrow()
                        if (other.mType.getvalue() == B2BodyType.DYNAMICBODY.getvalue() && body.isBullet == false && other.isBullet == false) {
                            ce = ce.getOrThrow().next
                            continue
                        }
                        let sensorA = contact.mFixtureA.getOrThrow().mIsSensor
                        let sensorB = contact.mFixtureB.getOrThrow().mIsSensor
                        if (sensorA || sensorB) {
                            ce = ce.getOrThrow().next
                            continue
                        }
                        let backup = other.mSweep
                        if ((other.mFlags & Flags.islandFlag) == 0) {
                            other.advance(minAlpha)
                        }
                        contact.update(mContactManager.mContactListener)
                        if (contact.isEnabled == false) {
                            other.mSweep = backup
                            other.synchronizeTransform()
                            ce = ce.getOrThrow().next
                            continue
                        }
                        if (contact.isTouching == false) {
                            other.mSweep = backup
                            other.synchronizeTransform()
                            ce = ce.getOrThrow().next
                            continue
                        }
                        contact.mFlags |= FlagContacts.ISLANDFLAG.getValue()
                        island.getOrThrow().addC(contact)
                        if ((other.mFlags & Flags.islandFlag) != 0) {
                            ce = ce.getOrThrow().next
                            continue
                        }
                        other.mFlags |= Flags.islandFlag
                        if (other.mType.getvalue() != B2BodyType.STATICBODY.getvalue()) {
                            other.setAwake(true)
                        }
                        island.getOrThrow().addB(other)
                        ce = ce.getOrThrow().next
                    }
                }


            }
            let subStep = B2TimeStep()
            subStep.dt = (1.0 - minAlpha) * step.dt
            subStep.invDt = 1.0 / subStep.dt
            subStep.dtRatio = 1.0
            subStep.positionIterations = posIter
            subStep.velocityIterations = step.velocityIterations
            subStep.warmStarting = false
            island.getOrThrow().solveToi(subStep, bA.mIslandIndex, bB.mIslandIndex)
            for (i in 0 .. island.getOrThrow().mBodyCount) {
                let body = island.getOrThrow().mBodies[i]
                body.mFlags &= !Flags.islandFlag
                if (body.mType.getvalue() != B2BodyType.DYNAMICBODY.getvalue()) {
                    continue
                }
                body.synchronizeFixtures()
                var ce = body.mContactList
                while (ce.isSome()) {
                    ce.getOrThrow().contact.mFlags &= !(FlagContacts.TOIFLAG.getValue() | FlagContacts.ISLANDFLAG.getValue())
                    ce = ce.getOrThrow().next
                }
            }
            mContactManager.findNewContacts()
            if (mSubStepping) {
                mStepComplete = false
                break
            }
        }
    }
}

class FlagsW {
   static let newFixture: Int64    = hex1
   static let locked: Int64        = hex2
   static let clearForces: Int64   = hex4
}

class B2WorldQueryWrapper <: B2QueryWrapper {
    var broadPhase: ?B2BroadPhase = Option<B2BroadPhase>.None
    var callback: ?B2QueryCallback = Option<B2QueryCallback>.None
    public func queryCallback( proxyId: Int64) : Bool {
        let proxy = broadPhase.getOrThrow().getUserData(proxyId)
        return callback.getOrThrow().reportFixture(proxy.getOrThrow().fixture)
    }
}

class B2WorldRayCastWrapper <: B2RayCastWrapper {
    var broadPhase: ?B2BroadPhase = Option<B2BroadPhase>.None
    var callback: ?B2RayCastCallback = Option<B2RayCastCallback>.None
    public func rayCastCallback( input: B2RayCastInput,  proxyId: Int64) : Float64 {
        let proxy = broadPhase.getOrThrow().getUserData(proxyId)
        let fixture = proxy.getOrThrow().fixture
        let index = proxy.getOrThrow().childIndex
        var output = B2RayCastOutput()
        let hit = fixture.rayCast(output, input, index)
        if (hit) {
            let fraction = output.fraction
            let point = add(multM(input.p1, 1.0 - fraction), multM(input.p2, fraction))
            return callback.getOrThrow().reportFixture(fixture, point, output.normal, fraction)
        }
        return input.maxFraction
    }
}
