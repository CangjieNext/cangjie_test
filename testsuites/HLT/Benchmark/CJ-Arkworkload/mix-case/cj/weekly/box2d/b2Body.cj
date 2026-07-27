/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


public enum B2BodyType{
    | STATICBODY
    | KINEMATICBODY 
    | DYNAMICBODY
    func getvalue():Int64{
        match(this){
            case STATICBODY =>  0
            case KINEMATICBODY =>  1
            case DYNAMICBODY =>  2
        }

    }
}
open class B2BodyDef {
    var `type` = B2BodyType.STATICBODY
    var position = B2Vec2()
    var angle: Float64 = 0.0
    var linearVelocity = B2Vec2()
    var angularVelocity: Float64 = 0.0
    var linearDamping: Float64 = 0.0
    var angularDamping: Float64 = 0.0
    var allowSleep = true
    var awake = true
    var fixedRotation = false
    var bullet = false
    var active = true
    var userData : ?Object = None
    var gravityScale: Float64 = 1.0
    public init() {}
}
open class B2Body {
    public var mType: B2BodyType
    public var mFlags: Int64 = 0
    public var mIslandIndex = 0
    public var mXF: B2Transform
    public var mSweep: B2Sweep
    public var mLinearVelocity: B2Vec2
    public var mAngularVelocity: Float64
    public var mForce: B2Vec2
    public var mTorque: Float64
    public var mWorld: B2World
    public var mPrev: ?B2Body = None
    public var mNext: ?B2Body = None
    public var mFixtureList: ?B2Fixture =None
    public var mFixtureCount: Int64 = 0
    public var mJointList: ?B2JointEdge = None
    public var mContactList: ?B2ContactEdge = None
    public var mMass: Float64
    public var mInvMass: Float64
    public var mI: Float64
    public var mInvI: Float64
    public var mLinearDamping: Float64
    public var mAngularDamping: Float64
    public var mGravityScale: Float64
    public var mSleepTime: Float64
    public var mUserData: ?Object
    public  func createFixture( def: B2FixtureDef) : B2Fixture {
        if ( mWorld.isLocked() == true) {
            throw Exception("world is locked")
        }
        let fixture = B2Fixture(this, def)
        if ( (mFlags & Flags.activeFlag) != 0) {
            let broadPhase = mWorld.mContactManager.mBroadPhase
            fixture.createProxies(broadPhase, mXF)
        }
        fixture.mNext = mFixtureList
        mFixtureList = fixture
        mFixtureCount += 1
        fixture.mBody = this
        if ( fixture.mDensity > 0.0) {
            resetMassData()
        }
        mWorld.mFlags |= FlagsW.newFixture
        return fixture
    }
    
    public func createFixture2( shape: B2Shape,  density: Float64) : B2Fixture {
        let def = B2FixtureDef()
        def.shape = shape
        def.density = density
        return createFixture(def)
    }
    
    public func destroyFixture( fixture: B2Fixture) {
        if ( mWorld.isLocked() == true) {
            return
        }
        var prev: ?B2Fixture =None
        var f = mFixtureList
        while (f.isSome()) {
            if (refEq(f.getOrThrow(), fixture)) {
                if (prev.isSome()) {
                    prev.getOrThrow().mNext = f.getOrThrow().mNext
                } else {
                    mFixtureList = f.getOrThrow().mNext
                }
            }
            prev = f
            f = f.getOrThrow().mNext
        }
        
        var edge: ?B2ContactEdge = mContactList
        while ( edge.isSome()) {
            let c = edge.getOrThrow().contact
            edge = edge.getOrThrow().next
            let fixtureA = c.fixtureA
            let fixtureB = c.fixtureB
            if (refEq(fixture, fixtureA)||refEq(fixture, fixtureB)) {
                mWorld.mContactManager.destroy(c)
            }
        }
        if ( (mFlags & Flags.activeFlag) != 0) {
            let broadPhase = mWorld.mContactManager.mBroadPhase
            fixture.destroyProxies(broadPhase)
        }
        fixture.destroy()
        fixture.mNext = None
        mFixtureCount -= 1
        resetMassData()
    }
    
    public func setTransform( position: B2Vec2,  angle: Float64) {
        if ( mWorld.isLocked() == true) {
            return
        }
        mXF.q.set(angle)
        mXF.p = position
        mSweep.c = b2MulT2(mXF, mSweep.localCenter)
        mSweep.a = angle
        mSweep.c0 = mSweep.c
        mSweep.a0 = angle
        let broadPhase = mWorld.mContactManager.mBroadPhase
        var f: ?B2Fixture = mFixtureList
        while ( f.isSome()) {
            f.getOrThrow().synchronize(broadPhase, mXF, mXF)
            f = f.getOrThrow().mNext
        }
    }
    
    public func transform(): B2Transform {
        return mXF
    }
    
    public func position(): B2Vec2 {
        return mXF.p
    }
    
    public func angle(): Float64 {
        return mSweep.a
    }
    
    public func worldCenter(): B2Vec2 {
        return mSweep.c
    }
    
    public func localCenter(): B2Vec2 {
        return mSweep.localCenter
    }
    
    public func setLinearVelocity( v: B2Vec2) {
        if (this.mType.getvalue() == B2BodyType.STATICBODY.getvalue()) {
            return
        }
        if ( b2Dot22(v, v) > 0.0) {
            setAwake(true)
        }
        mLinearVelocity = v
    }
    
    public mut prop linearVelocity: B2Vec2 {
        get(){
            mLinearVelocity
        }
        set(v){
            setLinearVelocity(v)
        }
    } 
    
    public func setAngularVelocity( omega: Float64) {
        if ( mType.getvalue() == B2BodyType.STATICBODY.getvalue()) {
            return
        }
        if ( omega * omega > 0.0) {
            setAwake(true)
        }
        mAngularVelocity = omega
    }
    
    public mut prop angularVelocity: Float64 {
        get(){
            mAngularVelocity
        }
        set(v){
            setAngularVelocity(v)
        }
    } 
    
    public func applyForce(force: B2Vec2,  point: B2Vec2,  wake: Bool) {
        if ( mType.getvalue() != B2BodyType.DYNAMICBODY.getvalue()) {
            return
        }
        if ( wake && (mFlags & Flags.awakeFlag) == 0) {
            setAwake(true)
        }
        if ( (mFlags & Flags.awakeFlag) != 0) {
            addEqual(mForce, force)
            mTorque += b2Cross(subtract(point,mSweep.c), force)
        }
    }
    
    public func applyForceToCenter( force: B2Vec2,  wake: Bool) {
        if ( mType.getvalue() != B2BodyType.DYNAMICBODY.getvalue()) {
            return
        }
        if ( wake && (mFlags & Flags.awakeFlag) == 0) {
            setAwake(true)
        }
        if ( (mFlags & Flags.awakeFlag) != 0) {
            addEqual(mForce, force)
        }
    }
    
    public func applyTorque( torque: Float64,  wake: Bool) {
        if ( mType.getvalue() != B2BodyType.DYNAMICBODY.getvalue()) {
            return
        }
        if ( wake && (mFlags & Flags.awakeFlag) == 0) {
            setAwake(true)
        }
        if ( (mFlags & Flags.awakeFlag) != 0) {
            mTorque += torque
        }
    }
    
    public func applyLinearImpulse( impulse: B2Vec2,  point: B2Vec2,  wake: Bool) {
        if ( mType.getvalue() != B2BodyType.DYNAMICBODY.getvalue()) {
            return
        }
        if ( wake && (mFlags & Flags.awakeFlag) == 0) {
            setAwake(true)
        }
        if ( (mFlags & Flags.awakeFlag) != 0) {
            addEqual(mLinearVelocity, multM(impulse, mInvMass))
            mAngularVelocity += mInvI * b2Cross(subtract(point, mSweep.c), impulse)
        }
    }
    
    public func applyAngularImpulse( impulse: Float64,  wake: Bool) {
        if ( mType.getvalue() != B2BodyType.DYNAMICBODY.getvalue()) {
            return
        }
        if ( wake && (mFlags & Flags.awakeFlag) == 0) {
            setAwake(true)
        }
        if ( (mFlags & Flags.awakeFlag) != 0) {
            mAngularVelocity += mInvI * impulse
        }
    }
    public mut prop mass: Float64 {
        get(){
            mMass
        }
        set(v){
        }
    } 

    public mut prop inertia: Float64 {
        get(){
            mI + mMass * b2Dot22(mSweep.localCenter, mSweep.localCenter)
        }
        set(v){
        }
    } 
    public mut prop massData: B2MassData {
        get(){
            var data = B2MassData()
            data.mass = mMass
            data.aI = mI + mMass * b2Dot22(mSweep.localCenter, mSweep.localCenter)
            data.center = mSweep.localCenter
            return data
        }
        set(v){
            setMassData(v)
        }
    } 
    
    public func setMassData( massData: B2MassData) {
        if ( mWorld.isLocked() == true) {
            return
        }
        if ( mType.getvalue() != B2BodyType.DYNAMICBODY.getvalue()) {
            return
        }
        mInvMass = 0.0
        mI = 0.0
        mInvI = 0.0
        mMass = massData.mass
        if ( mMass <= 0.0) {
            mMass = 1.0
        }
        mInvMass = 1.0 / mMass
        if ( massData.aI > 0.0 && (mFlags & Flags.fixedRotationFlag) == 0) {
            mI = massData.aI - mMass * b2Dot22(massData.center, massData.center)
            mInvI = 1.0 / mI
        }
        let oldCenter = mSweep.c
        mSweep.localCenter =  massData.center
        mSweep.c0 = b2MulT2(mXF, mSweep.localCenter)
        mSweep.c = mSweep.c0
        addEqual(mLinearVelocity, b2Cross21(mAngularVelocity, subtract(mSweep.c, oldCenter)))
    }
    
    public func resetMassData() {
        mMass = 0.0
        mInvMass = 0.0
        mI = 0.0
        mInvI = 0.0
        mSweep.localCenter.setZero()
        if ( mType.getvalue() == B2BodyType.STATICBODY.getvalue() || mType.getvalue() == B2BodyType.KINEMATICBODY.getvalue()) {
            mSweep.c0 = mXF.p
            mSweep.c = mXF.p
            mSweep.a0 = mSweep.a
            return
        }
        var localCenter = b2Vec2Zero
        var f: ?B2Fixture = mFixtureList
        while ( f.isSome()) {
            if ( f.getOrThrow().mDensity == 0.0) {
                f = f.getOrThrow().mNext
                continue
            }
            let massData = f.getOrThrow().massData()
            mMass += massData.getOrThrow().mass
            addEqual(localCenter, multM(massData.getOrThrow().center, massData.getOrThrow().mass))
            mI += massData.getOrThrow().aI
            f = f.getOrThrow().mNext
        }
        if ( mMass > 0.0) {
            mInvMass = 1.0 / mMass
            mulEqual(a:localCenter,b: mInvMass)
        } else {
            mMass = 1.0
            mInvMass = 1.0
        }
        if ( mI > 0.0 && (mFlags & Flags.fixedRotationFlag) == 0) {
            mI -= mMass * b2Dot22(localCenter, localCenter)
            mInvI = 1.0 / mI
        } else {
            mI = 0.0
            mInvI = 0.0
        }
        let oldCenter = mSweep.c
        mSweep.localCenter = localCenter
        mSweep.c0 = b2MulT2(mXF, mSweep.localCenter)
        mSweep.c = mSweep.c0
        addEqual(mLinearVelocity, b2Cross21(mAngularVelocity, subtract(mSweep.c, oldCenter)))
    }
    
    public func getWorldPoint( localPoint: B2Vec2) : B2Vec2 {
        return b2MulT2(mXF, localPoint)
    }
    
    public func getWorldVector( localVector: B2Vec2) : B2Vec2 {
        return b2MulR2(mXF.q, localVector)
    }
    
    public func getLocalPoint( worldPoint: B2Vec2) : B2Vec2 {
        return b2MulTT2(mXF, worldPoint)
    }
    
    public func getLocalVector( worldVector: B2Vec2) : B2Vec2 {
        return b2MulTR2(mXF.q, worldVector)
    }
    
    public func getLinearVelocityFromWorldPoint( worldPoint: B2Vec2) : B2Vec2 {
        return add(mLinearVelocity, b2Cross21(mAngularVelocity, subtract(worldPoint, mSweep.c)))
    }
    
    public func getLinearVelocityFromLocalPoint( localPoint: B2Vec2) : B2Vec2 {
        return getLinearVelocityFromWorldPoint(getWorldPoint(localPoint))
    }
    
    public mut prop linearDamping: Float64 {
        get(){
            mLinearDamping
        }
        set(v){
            setLinearDamping(v)
        }
    }   
    
    public func setLinearDamping( linearDamping: Float64) {
        mLinearDamping = linearDamping
    }
    
    public mut prop angularDamping: Float64{
        get(){
            mGravityScale
        }
        set(v){
            setAngularDamping(v)
        }
    } 
    
    public func setAngularDamping( angularDamping: Float64) {
        mAngularDamping = angularDamping
    }
    
    public mut prop gravityScale: Float64{
        get(){
            mGravityScale
        }
        set(v){
            setGravityScale(v)
        }
    } 
    
    public func setGravityScale( scale: Float64) {
        mGravityScale = scale
    }
    
    public func setType( `type`: B2BodyType) {
        if ( mWorld.isLocked() == true) {
            return
        }
        if ( mType.getvalue() == `type`.getvalue()) {
            return
        }
        mType = `type`
        resetMassData()
        if ( mType.getvalue() == B2BodyType.STATICBODY.getvalue()) {
            mLinearVelocity.setZero()
            mAngularVelocity = 0.0
            mSweep.a0 = mSweep.a
            mSweep.c0 = mSweep.c
            synchronizeFixtures()
        }
        setAwake(true)
        mForce.setZero()
        mTorque = 0.0
        var ce: ?B2ContactEdge = mContactList
        while ( ce.isSome()) {
            let ce0 = ce.getOrThrow()
            ce = ce.getOrThrow().next
            mWorld.mContactManager.destroy(ce0.contact)
        }
        mContactList = None
        let broadPhase = mWorld.mContactManager.mBroadPhase
        var f: ?B2Fixture = mFixtureList
        while ( f.isSome()) {
            let proxyCount = f.getOrThrow().mProxyCount
            for ( i in 0 .. proxyCount) {
                broadPhase.touchProxy(f.getOrThrow().mProxies[i].proxyId)
            }
            f = f.getOrThrow().mNext
        }
    }
    
    public mut prop typeBody: B2BodyType{
        get(){
            mType
        }
        set(v){
            setType(v)
        }
    } 
    public func getMType():B2BodyType{
        return mType
    }
    public func setBullet( flag: Bool) {
        if ( flag) {
            mFlags |= Flags.bulletFlag
        } else {
            mFlags &= !Flags.bulletFlag
        }
    }
    
    public mut prop isBullet: Bool{
        get(){
            (mFlags & Flags.bulletFlag) == Flags.bulletFlag
        }
        set(v){
            setBullet(v)
        }
    } 
    
    public func setSleepingAllowed( flag: Bool) {
        if ( flag) {
            mFlags |= Flags.autoSleepFlag
        } else {
            mFlags &= !Flags.autoSleepFlag
            setAwake(true)
        }
    }
    
    public mut prop isSleepingAllowed: Bool{
        get(){
            (mFlags & Flags.autoSleepFlag) == Flags.autoSleepFlag
        }
        set(v){
            setSleepingAllowed(v)
        }
    } 
    
    public func setAwake( flag: Bool) {
        if ( flag) {
            if ( (mFlags & Flags.awakeFlag) == 0) {
                mFlags |= Flags.awakeFlag
                mSleepTime = 0.0
            }
        } else {
            mFlags &= !Flags.awakeFlag
            mSleepTime = 0.0
            mLinearVelocity.setZero()
            mAngularVelocity = 0.0
            mForce.setZero()
            mTorque = 0.0
        }
    }

    public func isAwake(): Bool{
        return (mFlags & Flags.awakeFlag) == Flags.awakeFlag
    } 
    
    public func setActive( flag: Bool) {
        if ( flag == isActive) {
            return
        }
        if ( flag) {
            mFlags |= Flags.activeFlag
            let broadPhase = mWorld.mContactManager.mBroadPhase
            var f: ?B2Fixture = mFixtureList
            while ( f.isSome()) {
                f.getOrThrow().createProxies(broadPhase, mXF)
                f = f.getOrThrow().mNext
            }
        } else {
            mFlags &= !Flags.activeFlag
            let broadPhase = mWorld.mContactManager.mBroadPhase
            var f: ?B2Fixture = mFixtureList
            while ( f.isSome()) {
                f.getOrThrow().destroyProxies(broadPhase)
                if ( (f.getOrThrow().mNext.isSome())) {
                    f = f.getOrThrow().mNext
                } else {
                    break
                }
            }
            var ce = mContactList
            while ( ce.isSome()) {
                let ce0 = ce.getOrThrow()
                ce = ce.getOrThrow().next
                mWorld.mContactManager.destroy(ce0.contact)
            }
            mContactList = None
        }
    }

    public mut prop isActive: Bool{
        get(){
            (mFlags & Flags.activeFlag) == Flags.activeFlag
        }
        set(v){
        }
    } 
    
    public func setFixedRotation( flag : Bool) {
        let status = (mFlags & Flags.fixedRotationFlag) == Flags.fixedRotationFlag
        if ( status == flag) {
            return
        }
        if ( flag) {
            mFlags |= Flags.fixedRotationFlag
        } else {
            mFlags &= !Flags.fixedRotationFlag
        }
        mAngularVelocity = 0.0
        resetMassData()
    }

    public mut prop isFixedRotation: Bool{
        get(){
            (mFlags & Flags.fixedRotationFlag) == Flags.fixedRotationFlag
        }
        set(v){
        }
    } 
    
    public func getFixtureList() : ?B2Fixture {
        return mFixtureList
    }
    
    public func getJointList() : ?B2JointEdge {
        return mJointList
    }
    
    public func getContactList() : ?B2ContactEdge {
        return mContactList
    }
    
    public func getNext() : ?B2Body {
        return mNext
    }
    
    public mut prop userData: ?Object {
        get(){
            mUserData
        }
        set(v){
            setUserData(v)
        }
    }
    
    public func setUserData( data: ?Object) {
        mUserData = data
    }

    public mut prop world: ?B2World{
        get(){
            mWorld
        }
        set(v){
        }
    } 
    
    init( def: B2BodyDef,  world: B2World) {
        mFlags = 0
        if ( (def.bullet)) {
            mFlags |= Flags.bulletFlag
        }
        if ( (def.fixedRotation)) {
            mFlags |= Flags.fixedRotationFlag
        }
        if ( (def.allowSleep)) {
            mFlags |= Flags.autoSleepFlag
        }
        if ( (def.awake)) {
            mFlags |= Flags.awakeFlag
        }
        if ( (def.active)) {
            mFlags |= Flags.activeFlag
        }
        mWorld = world
        mXF = B2Transform()
        mXF.p = def.position
        mXF.q.set(def.angle)
        mSweep = B2Sweep()
        mSweep.localCenter = B2Vec2(x0:0.0, y0:0.0)
        mSweep.c0 = mXF.p
        mSweep.c = mXF.p
        mSweep.a0 = def.angle
        mSweep.a = def.angle
        mSweep.alpha0 = 0.0
        mPrev = None
        mNext = None
        mLinearVelocity = def.linearVelocity
        mAngularVelocity = def.angularVelocity
        mLinearDamping = def.linearDamping
        mAngularDamping = def.angularDamping
        mGravityScale = def.gravityScale
        mForce = B2Vec2(x0:0.0, y0:0.0)
        mTorque = 0.0
        mSleepTime = 0.0
        mType = def.`type`
        if ( mType.getvalue() == B2BodyType.DYNAMICBODY.getvalue()) {
            mMass = 1.0
            mInvMass = 1.0
        } else {
            mMass = 0.0
            mInvMass = 0.0
        }
        mI = 0.0
        mInvI = 0.0
        mUserData = def.userData
        mFixtureList = None
        mFixtureCount = 0
    }
    
    func synchronizeFixtures() {
        var xf1 = B2Transform()
        xf1.q.set(mSweep.a0)
        xf1.p = subtract(mSweep.c0, b2MulR2(xf1.q, mSweep.localCenter))
        let broadPhase = mWorld.mContactManager.mBroadPhase
        var f: ?B2Fixture = mFixtureList
        while ( f.isSome()) {
            f.getOrThrow().synchronize(broadPhase, xf1, mXF)
            f = f.getOrThrow().mNext
        }
    }
    
    func synchronizeTransform () {
        mXF.q.set(mSweep.a)
        mXF.p = subtract(mSweep.c, b2MulR2(mXF.q, mSweep.localCenter))
        let tVec = mSweep.localCenter
        let tMat = B2Mat22()
        tMat.setMat(mSweep.a)
        mXF.p.y = mSweep.c.y - (tMat.ex.y * tVec.x + tMat.ey.y * tVec.y)
    }
    
    func shouldCollide( other: B2Body) : Bool {
        if (mType.getvalue() != B2BodyType.DYNAMICBODY.getvalue() && other.mType.getvalue() != B2BodyType.DYNAMICBODY.getvalue()) {
            return false
        }
        var jn: ?B2JointEdge = mJointList
        while (jn.isSome()) {
            if (refEq(jn.getOrThrow().other.getOrThrow(),other)) {
                if (jn.getOrThrow().joint.mCollideConnected == false) {
                    return false
                }
            }
            jn = jn.getOrThrow().next
        }
        return true
    }
    func advance( alpha: Float64) {
        mSweep.advance(alpha)
        mSweep.c = mSweep.c0
        mSweep.a = mSweep.a0
        mXF.q.set(mSweep.a)
        mXF.p = subtract(mSweep.c, b2MulR2(mXF.q, mSweep.localCenter))
    }
}
public class Flags {
    static let islandFlag             = hex1
    static let awakeFlag              = hex2
    static let autoSleepFlag          = hex4
    static let bulletFlag             = hex8
    static let fixedRotationFlag      = hex10
    static let activeFlag             = hex20
    static let toiFlag                = hex40
}

