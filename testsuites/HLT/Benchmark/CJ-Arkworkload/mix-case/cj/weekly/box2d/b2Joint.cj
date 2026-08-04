/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.math.*

public enum B2JointType {
    | UNKNOWNJOINT
    | REVOLUTEJOINT
    | PRISMATICJOINT
    | DISTANCEJOINT
    | PULLEYJOINT
    | MOUSEJOINT
    | GEARJOINT
    | WHEELJOINT
    | WELDJOINT
    | FRICTIONJOINT
    | ROPEJOINT
    | MOTORJOINT
    public func getValue(){
        match(this){
        case UNKNOWNJOINT => return 0
        case REVOLUTEJOINT => return 1
        case PRISMATICJOINT => return 2
        case DISTANCEJOINT => return 3
        case PULLEYJOINT => return 4
        case MOUSEJOINT => return 5
        case GEARJOINT => return 6
        case WHEELJOINT => return 7
        case WELDJOINT => return 8
        case FRICTIONJOINT => return 9
        case ROPEJOINT => return 10
        case MOTORJOINT => return 11
        case _ => throw Exception("invalid value for input of getRawValue")
        }
    }
}

public enum B2LimitState {
    | INACTIVELIMIT
    | ATLOWERLIMIT
    | ATUPPERLIMIT
    | EQUALLIMITS
    public func getValue():Int64{
        match(this){
            case INACTIVELIMIT => 0
            case ATLOWERLIMIT  => 1
            case ATUPPERLIMIT  => 2
            case EQUALLIMITS  => 3
        }
    }
}

open class B2JointEdge {
    init( joint: B2Joint) {
        this.joint = joint
    }
    var other: ?B2Body = Option<B2Body>.None
    var joint: B2Joint
    var prev: ?B2JointEdge = Option<B2JointEdge>.None
    var next: ?B2JointEdge = Option<B2JointEdge>.None
}

open class B2JointDef {
    public init() {
        `type` = B2JointType.UNKNOWNJOINT
        userData = Option<Object>.None
        bodyA = Option<B2Body>.None
        bodyB = Option<B2Body>.None
        collideConnected = false
    }
    var `type`: B2JointType
    var userData: ?Object
    var bodyA: ?B2Body
    var bodyB: ?B2Body
    var collideConnected: Bool
}

open class B2Joint {
    var mType: B2JointType = B2JointType.UNKNOWNJOINT
    var mPrev: ?B2Joint = Option<B2Joint>.None
    var mNext: ?B2Joint = Option<B2Joint>.None
    var mEdgeA :?B2JointEdge
    var mEdgeB :?B2JointEdge
    var mBodyA: B2Body
    var mBodyB: B2Body
    var mIndex: Int64 = 0
    var mIslandFlag: Bool = false
    var mCollideConnected: Bool = false
    var mUserData: ?Object = Option<Object>.None
    public prop typeJoint: B2JointType  { 
        get() {
            mType      
	}
    }
    public func bodyA(): B2Body  { 
	    return mBodyA
	 
    }
    public func bodyB(): B2Body  {     
	    return mBodyB
    }
    public open prop anchorA: B2Vec2  { 
        get() {
            throw Exception("must override")
        }
    }
    public open prop anchorB: B2Vec2  { 
        get() {
            throw Exception("must override")
	}
    }
    init( def: B2JointDef) {
        mType = def.`type`
        mPrev = Option<B2Joint>.None
        mNext = Option<B2Joint>.None
        mBodyA = def.bodyA.getOrThrow()
        mBodyB = def.bodyB.getOrThrow()
        mIndex = 0
        mCollideConnected = def.collideConnected
        mIslandFlag = false
        mUserData = def.userData
        mEdgeA = None

        mEdgeB = None

    }
    func setup(){
        mEdgeA = B2JointEdge(this)
        mEdgeA.getOrThrow().other = Option<B2Body>.None
        mEdgeA.getOrThrow().prev = Option<B2JointEdge>.None
        mEdgeA.getOrThrow().next = Option<B2JointEdge>.None
        mEdgeB = B2JointEdge(this)
        mEdgeB.getOrThrow().other = Option<B2Body>.None
        mEdgeB.getOrThrow().prev = Option<B2JointEdge>.None
        mEdgeB.getOrThrow().next = Option<B2JointEdge>.None

    }
    public open func getReactionForce( invdt: Float64) : B2Vec2 {
        throw Exception("must override")
    }
    public open func getReactionTorque( invdt: Float64) : Float64 {
        throw Exception("must override")
    }
    func getNext() : ?B2Joint {
        return mNext
    }
    public mut prop userData: ?Object {
        get() {
            mUserData
        }
        set(v) {
            setUserData(v)
        }
    }
    func setUserData( data: ?Object) {
        mUserData = data
    }
    public prop  isActive: Bool {
        get() {
            mBodyA.isActive && mBodyB.isActive
	}
    }
    public prop collideConnected: Bool {
        get() {
	    mCollideConnected
	}
    }
    public open func shiftOrigin( newOrigin: B2Vec2):Unit {}
    func create( def: B2JointDef): B2Joint {
        var joint: B2Joint
        match ( def.`type`) {
        case B2JointType.DISTANCEJOINT =>
            joint = B2DistanceJoint((def as B2DistanceJointDef).getOrThrow())
        case B2JointType.MOUSEJOINT =>
            joint = B2MouseJoint((def as B2MouseJointDef).getOrThrow())
        case B2JointType.PRISMATICJOINT =>
            joint = B2PrismaticJoint((def as B2PrismaticJointDef).getOrThrow())
        case B2JointType.REVOLUTEJOINT =>
            joint = B2RevoluteJoint((def as B2RevoluteJointDef).getOrThrow())
        case B2JointType.PULLEYJOINT =>
            joint = B2PulleyJoint((def as B2PulleyJointDef).getOrThrow())
        case B2JointType.GEARJOINT =>
            joint = B2GearJoint((def as B2GearJointDef).getOrThrow())
        case B2JointType.WELDJOINT =>
            joint = B2WeldJoint((def as B2WeldJointDef).getOrThrow())
        case B2JointType.FRICTIONJOINT =>
            joint = B2FrictionJoint((def as B2FrictionJointDef).getOrThrow())
        case _ =>
            throw Exception("unknown joint type")
        }
        return joint
    }
    func destroy( joint: B2Joint) {}
    public open func initVelocityConstraints( data: B2SolverData): B2SolverData {
        throw Exception("must override")
    }
    public open func solveVelocityConstraints( data: B2SolverData): B2SolverData {
        throw Exception("must override")
    }
    public open func solvePositionConstraints( data: B2SolverData) : Bool {
        throw Exception("must override")
    }
}

open class B2WeldJointDef <: B2JointDef {
   public init() {
        super()
       localAnchorA = B2Vec2(x0: 0.0, y0: 0.0)
       localAnchorB = B2Vec2(x0: 0.0, y0: 0.0)
       referenceAngle = 0.0
       frequencyHz = 0.0
       dampingRatio = 0.0
       `type` = B2JointType.WELDJOINT
   }
   
   public open func initialize( bodyA: B2Body,  bodyB: B2Body,  anchor: B2Vec2) {
       this.bodyA = bodyA
       this.bodyB = bodyB
       this.localAnchorA = bodyA.getLocalPoint(anchor)
       this.localAnchorB = bodyB.getLocalPoint(anchor)
       this.referenceAngle = bodyB.angle() - bodyA.angle()
   }
   var localAnchorA: B2Vec2
   var localAnchorB: B2Vec2
   var referenceAngle: Float64
   var frequencyHz: Float64
   var dampingRatio: Float64
}

open class B2WeldJoint <: B2Joint {
   var mFrequencyHz: Float64 = 0.0
   var mDampingRatio: Float64 = 0.0
   var mBias: Float64 = 0.0
   var mLocalAnchorA = B2Vec2()
   var mLocalAnchorB = B2Vec2()
   var mReferenceAngle: Float64 = 0.0
   var mGamma: Float64 = 0.0
   var mImpulse = B2Vec3()
   var mIndexA: Int64 = 0
   var mIndexB: Int64 = 0
   var mrA = B2Vec2()
   var mrB = B2Vec2()
   var mLocalCenterA = B2Vec2()
   var mLocalCenterB = B2Vec2()
   var mInvMassA: Float64 = 0.0
   var mInvMassB: Float64 = 0.0
   var mInvIA: Float64 = 0.0
   var mInvIB: Float64 = 0.0
   var mMass = B2Mat33()
   public prop anchorA: B2Vec2 {
       get() {
           mBodyA.getWorldPoint(mLocalAnchorA)
       }
   }
   public prop anchorB: B2Vec2 {
       get() {
           mBodyB.getWorldPoint(mLocalAnchorB)
       }
   }
   public override func getReactionForce( invdt: Float64) : B2Vec2 {
       let mP = B2Vec2(x0:mImpulse.x,y0: mImpulse.y)
       return multM(mP, invdt)
   }
   public override func getReactionTorque( invdt: Float64) : Float64 {
       return invdt * mImpulse.z
   }
   public prop localAnchorA: B2Vec2 { 
       get() {
           mLocalAnchorA
       }
   }
   public prop localAnchorB: B2Vec2  { 
       get() {
           mLocalAnchorB
       }
   }
   public prop referenceAngle: Float64  { 
       get() {
           mReferenceAngle
       }
   }
   public func setFrequency( hz: Float64) {
       mFrequencyHz = hz
   }
   public prop frequency: Float64 {
       get() {
           mFrequencyHz
       }
   }
   public func setDampingRatio( ratio: Float64) {
       mDampingRatio = ratio
   }
   public prop dampingRatio: Float64  { 
       get() {
           mDampingRatio 
       }
   }
   init( def: B2WeldJointDef) {
       super(def)
       mLocalAnchorA = def.localAnchorA
       mLocalAnchorB = def.localAnchorB
       mReferenceAngle = def.referenceAngle
       mFrequencyHz = def.frequencyHz
       mDampingRatio = def.dampingRatio
       mImpulse = B2Vec3(x1:0.0, y1:0.0, z1:0.0)
       
   }
   
   public override func initVelocityConstraints( data: B2SolverData): B2SolverData {
       mIndexA = mBodyA.mIslandIndex
       mIndexB = mBodyB.mIslandIndex
       mLocalCenterA = mBodyA.mSweep.localCenter
       mLocalCenterB = mBodyB.mSweep.localCenter
       mInvMassA = mBodyA.mInvMass
       mInvMassB = mBodyB.mInvMass
       mInvIA = mBodyA.mInvI
       mInvIB = mBodyB.mInvI
       let aA = data.positions.get(index:mIndexA).a
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       let aB = data.positions.get(index:mIndexB).a
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let qA = B2Rot(angle:aA)
       let qB = B2Rot(angle:aB)
       mrA = b2MulR2(qA, subtract(mLocalAnchorA, mLocalCenterA))
       mrB = b2MulR2(qB, subtract(mLocalAnchorB, mLocalCenterB))
       let mA = mInvMassA
       let mB = mInvMassB
       let iA = mInvIA
       let iB = mInvIB
       let mat = B2Mat33()
       mat.ex.x = mA + mB + mrA.y * mrA.y * iA + mrB.y * mrB.y * iB
       mat.ey.x = -mrA.y * mrA.x * iA - mrB.y * mrB.x * iB
       mat.ez.x = -mrA.y * iA - mrB.y * iB
       mat.ex.y = mat.ey.x
       mat.ey.y = mA + mB + mrA.x * mrA.x * iA + mrB.x * mrB.x * iB
       mat.ez.y = mrA.x * iA + mrB.x * iB
       mat.ex.z = mat.ez.x
       mat.ey.z = mat.ez.y
       mat.ez.z = iA + iB
       if (mFrequencyHz > 0.0) {
           mMass = mat.getInverse22()
           var invM = iA + iB
           var m = 0.0
           if(invM > 0.0){
               m = 1.0 / invM
           } else{
               m = 0.0
           }
           let c = aB - aA - mReferenceAngle
           let omega = float2 * b2PI * mFrequencyHz
           let d = float2 * m * mDampingRatio * omega
           let k = m * omega * omega
           let h = data.step.dt
           mGamma = h * (d + h * k)
           if (mGamma != 0.0){
               mGamma = 1.0 / mGamma
           } else{
               mGamma = 0.0
           }
           mBias = c * h * k * mGamma
           invM += mGamma

           if (invM != 0.0){
               mMass.ez.z = 1.0 / invM
           } else{
               mMass.ez.z = 0.0
           }
       } else {
           mMass = mat.getSymInverse33()
           mGamma = 0.0
           mBias = 0.0
       }
       if (data.step.warmStarting) {
           mulMEqual3(mImpulse, data.step.dtRatio)
           let mP = B2Vec2(x0:mImpulse.x,y0: mImpulse.y)
           subtractEqual(vA, multM(mP, mA))
           wA -= iA * (b2Cross(mrA, mP) + mImpulse.z)
           addEqual(vB, multM(mP, mB))
           wB += iB * (b2Cross(mrB, mP) + mImpulse.z)
       } else {
           mImpulse.setZero()
       }
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
   }
   
   public override func solveVelocityConstraints( data: B2SolverData): B2SolverData {
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let mA = mInvMassA
       let mB = mInvMassB
       let iA = mInvIA
       let iB = mInvIB
       if (mFrequencyHz > 0.0) {
           let cdot2 = wB - wA
           let impulse2 = -mMass.ez.z * (cdot2 + mBias + mGamma * mImpulse.z)
           mImpulse.z += impulse2
           wA -= iA * impulse2
           wB += iB * impulse2
           let cdot1 = subtract(subtract(add(vB, b2Cross21(wB, mrB)), vA), b2Cross21(wA, mrA))
           let impulse1 = minus(b2Mul32(mMass, cdot1))
           mImpulse.x += impulse1.x
           mImpulse.y += impulse1.y
           let mP = impulse1
           subtractEqual(vA, multM(mP, mA))
           wA -= iA * b2Cross(mrA, mP)
           addEqual(vB, multM(mP, mB))
           wB += iB * b2Cross(mrB, mP)
       } else {
           let cdot1 = subtract(subtract(add(vB, b2Cross21(wB, mrB)), vA), b2Cross21(wA, mrA))
           let cdot2 = wB - wA
           let cdot = B2Vec3(x1:cdot1.x, y1:cdot1.y, z1:cdot2)
           let impulse = minus3(b2Mul33(mMass, cdot))
           addEqual3(mImpulse, impulse)
           let mP = B2Vec2(x0:impulse.x,y0: impulse.y)
           subtractEqual(vA, multM(mP, mA))
           wA -= iA * (b2Cross(mrA, mP) + impulse.z)
           addEqual(vB, multM(mP, mB))
           wB += iB * (b2Cross(mrB, mP) + impulse.z)
       }
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
    }
   
   public override func solvePositionConstraints( data: B2SolverData) : Bool {
       var cA = data.positions.get(index:mIndexA).c
       var aA = data.positions.get(index:mIndexA).a
       var cB = data.positions.get(index:mIndexB).c
       var aB = data.positions.get(index:mIndexB).a
       let qA = B2Rot(angle:aA)
       let qB = B2Rot(angle:aB)
       let mA = mInvMassA
       let mB = mInvMassB
       let iA = mInvIA
       let iB = mInvIB
       let rA = b2MulR2(qA, subtract(mLocalAnchorA, mLocalCenterA))
       let rB = b2MulR2(qB, subtract(mLocalAnchorB, mLocalCenterB))
       var positionError: Float64
       var angularError: Float64
       let mK = B2Mat33()
       mK.ex.x = mA + mB + rA.y * rA.y * iA + rB.y * rB.y * iB
       mK.ey.x = -rA.y * rA.x * iA - rB.y * rB.x * iB
       mK.ez.x = -rA.y * iA - rB.y * iB
       mK.ex.y = mK.ey.x
       mK.ey.y = mA + mB + rA.x * rA.x * iA + rB.x * rB.x * iB
       mK.ez.y = rA.x * iA + rB.x * iB
       mK.ex.z = mK.ez.x
       mK.ey.z = mK.ez.y
       mK.ez.z = iA + iB
       if (mFrequencyHz > 0.0) {
           let mC1 = subtract(subtract(add(cB, rB), cA), rA)
           positionError = mC1.length()
           angularError = 0.0
           let mP = minus(mK.solve22(mC1))
           subtractEqual(cA, multM(mP, mA))
           aA -= iA * b2Cross(rA, mP)
           addEqual(cB, multM(mP, mB))
           aB += iB * b2Cross(rB, mP)
       } else {
           let mC1 = subtract(subtract(add(cB, rB), cA), rA)
           let mC2 = aB - aA - mReferenceAngle
           positionError = mC1.length()
           angularError = abs(mC2)
           let mC = B2Vec3(x1:mC1.x, y1:mC1.y, z1:mC2)
           let impulse = minus3(mK.solve33(mC))
           let mP = B2Vec2(x0:impulse.x, y0:impulse.y)
           subtractEqual(cA, multM(mP, mA))
           aA -= iA * (b2Cross(rA, mP) + impulse.z)
           addEqual(cB, multM(mP, mB))
           aB += iB * (b2Cross(rB, mP) + impulse.z)
       }
       data.positions.get(index:mIndexA).c = cA
       data.positions.get(index:mIndexA).a = aA
       data.positions.get(index:mIndexB).c = cB
       data.positions.get(index:mIndexB).a = aB
       return positionError <= b2LinearSlop && angularError <= b2AngularSlop
   }
}

class B2RevoluteJointDef <: B2JointDef {
   public init() {
       super()
       localAnchorA = B2Vec2(x0:0.0, y0:0.0)
       localAnchorB = B2Vec2(x0:0.0, y0:0.0)
       referenceAngle = 0.0
       lowerAngle = 0.0
       upperAngle = 0.0
       maxMotorTorque = 0.0
       motorSpeed = 0.0
       enableLimit = false
       enableMotor = false
       `type` = B2JointType.REVOLUTEJOINT
   }
   
   open func initialize( bodyA: B2Body,  bodyB: B2Body,  anchor: B2Vec2) {
       this.bodyA = bodyA
       this.bodyB = bodyB
       this.localAnchorA = bodyA.getLocalPoint(anchor)
       this.localAnchorB = bodyB.getLocalPoint(anchor)
       this.referenceAngle = bodyB.angle() - bodyA.angle()
   }
   var localAnchorA: B2Vec2
   var localAnchorB: B2Vec2
   var referenceAngle: Float64
   var maxMotorTorque: Float64
   var motorSpeed: Float64
   var lowerAngle: Float64
   var upperAngle: Float64
   var enableLimit: Bool
   var enableMotor: Bool
}

class B2RevoluteJoint <: B2Joint {
   public prop anchorA: B2Vec2  { 
       get() {
           mBodyA.getWorldPoint(mLocalAnchorA)
       }
   }
   public prop anchorB: B2Vec2 { 
       get() {
           mBodyB.getWorldPoint(mLocalAnchorB)
       }
   }
   public prop localAnchorA: B2Vec2  { 
       get() {
           mLocalAnchorA
       }
   }
   public prop localAnchorB: B2Vec2  { 
       get() {
           mLocalAnchorB
       }
   }
   public prop referenceAngle: Float64  { 
       get() {
           mReferenceAngle
       }
   }
   public prop jointAngle: Float64 { 
       get() {
           let bA = mBodyA
           let bB = mBodyB
           bB.mSweep.a - bA.mSweep.a - mReferenceAngle
       }
   }
   
   public prop jointSpeed: Float64  { 
       get() {
           let bA = mBodyA
           let bB = mBodyB
           bB.mAngularVelocity - bA.mAngularVelocity
       }
   }

   
   public mut prop isLimitEnabled: Bool {
       get() {
           mEnableLimit
       }
       set(v) {
           enableLimit(v)
       }
   }
   
   open func enableLimit( flag: Bool) {
       if (flag != mEnableLimit) {
           mBodyA.setAwake(true)
           mBodyB.setAwake(true)
           mEnableLimit = flag
           mImpulse.z = 0.0
       }
   }
   
   public prop lowerLimit: Float64  { 
       get() {
           mLowerAngle
       }
   }
   
   public prop upperLimit: Float64  { 
       get() {
           mUpperAngle
       }
   }

   
   open func setLimits( lower: Float64,  upper: Float64) {
       if (lower != mLowerAngle || upper != mUpperAngle) {
           mBodyA.setAwake(true)
           mBodyB.setAwake(true)
           mImpulse.z = 0.0
           mLowerAngle = lower
           mUpperAngle = upper
       }
   }
   
   public prop isMotorEnabled: Bool  { 
       get() {
           mEnableMotor
       }
   }
   
   open func enableMotor( flag: Bool) {
       mBodyA.setAwake(true)
       mBodyB.setAwake(true)
       mEnableMotor = flag
   }
   
   open func setMotorSpeed( speed: Float64) {
       mBodyA.setAwake(true)
       mBodyB.setAwake(true)
       mMotorSpeed = speed
   }
   
   public mut prop motorSpeed: Float64 {
       get() {
            mMotorSpeed
       }
       set(newValue) {
            setMotorSpeed(newValue)
       }
   }
   
   open func setMaxMotorTorque( torque: Float64) {
       mBodyA.setAwake(true)
       mBodyB.setAwake(true)
       mMaxMotorTorque = torque
   }
   public mut prop maxMotorTorque: Float64 {
       get() {
           mMaxMotorTorque
       }
       set(newValue) {
           setMaxMotorTorque(newValue)
       }
   }
   
   public override func getReactionForce( invdt: Float64) : B2Vec2 {
       let mP = B2Vec2(x0:mImpulse.x, y0:mImpulse.y)
       return multM(mP, invdt)
   }
   
   public override func getReactionTorque( invdt: Float64) : Float64 {
       return invdt * mImpulse.z
   }
   
   public func getMotorTorque( invdt: Float64) : Float64 {
       return invdt * mMotorImpulse
   }
   
   init( def: B2RevoluteJointDef) {
       super(def)
       mLocalAnchorA = def.localAnchorA
       mLocalAnchorB = def.localAnchorB
       mReferenceAngle = def.referenceAngle
       mImpulse = B2Vec3(x1:0.0, y1:0.0, z1:0.0)
       mMotorImpulse = 0.0
       mLowerAngle = def.lowerAngle
       mUpperAngle = def.upperAngle
       mMaxMotorTorque = def.maxMotorTorque
       mMotorSpeed = def.motorSpeed
       mEnableLimit = def.enableLimit
       mEnableMotor = def.enableMotor
       mLimitState = B2LimitState.INACTIVELIMIT
   }
   
    public func initVelocityConstraints( data: B2SolverData): B2SolverData {
       mIndexA = mBodyA.mIslandIndex
       mIndexB = mBodyB.mIslandIndex
       mLocalCenterA = mBodyA.mSweep.localCenter
       mLocalCenterB = mBodyB.mSweep.localCenter
       mInvMassA = mBodyA.mInvMass
       mInvMassB = mBodyB.mInvMass
       mInvIA = mBodyA.mInvI
       mInvIB = mBodyB.mInvI
       let aA = data.positions.get(index:mIndexA).a
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       let aB = data.positions.get(index:mIndexB).a
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let qA = B2Rot(angle:aA)
       let qB = B2Rot(angle:aB)
       mrA = b2MulR2(qA, subtract(mLocalAnchorA, mLocalCenterA))
       mrB = b2MulR2(qB, subtract(mLocalAnchorB, mLocalCenterB))
       let mA = mInvMassA
       let mB = mInvMassB
       let iA = mInvIA
       let iB = mInvIB
       let fixedRotation = (iA + iB == 0.0)
       mMass.ex.x = mA + mB + mrA.y * mrA.y * iA + mrB.y * mrB.y * iB
       mMass.ey.x = -mrA.y * mrA.x * iA - mrB.y * mrB.x * iB
       mMass.ez.x = -mrA.y * iA - mrB.y * iB
       mMass.ex.y = mMass.ey.x
       mMass.ey.y = mA + mB + mrA.x * mrA.x * iA + mrB.x * mrB.x * iB
       mMass.ez.y = mrA.x * iA + mrB.x * iB
       mMass.ex.z = mMass.ez.x
       mMass.ey.z = mMass.ez.y
       mMass.ez.z = iA + iB
       mMotorMass = iA + iB
       if (mMotorMass > 0.0) {
           mMotorMass = 1.0 / mMotorMass
       }
       if (mEnableMotor == false || fixedRotation) {
           mMotorImpulse = 0.0
        }
        if (mEnableLimit && fixedRotation == false) {
           let jointAngle = aB - aA - mReferenceAngle
           if (abs(mUpperAngle - mLowerAngle) < float2 * b2AngularSlop) {
               mLimitState = B2LimitState.EQUALLIMITS
           } else if (jointAngle <= mLowerAngle) {
               if (mLimitState.getValue() != B2LimitState.ATLOWERLIMIT.getValue()) {
                   mImpulse.z = 0.0
               }
               mLimitState = B2LimitState.ATLOWERLIMIT
           } else if (jointAngle >= mUpperAngle) {
               if (mLimitState.getValue() != B2LimitState.ATUPPERLIMIT.getValue()) {
                   mImpulse.z = 0.0
               }
               mLimitState = B2LimitState.ATUPPERLIMIT
           } else {
               mLimitState = B2LimitState.INACTIVELIMIT
               mImpulse.z = 0.0
           }
       } else {
           mLimitState = B2LimitState.INACTIVELIMIT
       }
       if (data.step.warmStarting) {
           mulMEqual3(mImpulse, data.step.dtRatio)
           mMotorImpulse *= data.step.dtRatio
           let mP = B2Vec2(x0:mImpulse.x, y0:mImpulse.y)
           subtractEqual(vA, multM(mP, mA))
           wA -= iA * (b2Cross(mrA, mP) + mMotorImpulse + mImpulse.z)
           addEqual(vB, multM(mP, mB))
           wB += iB * (b2Cross(mrB, mP) + mMotorImpulse + mImpulse.z)
       } else {
           mImpulse.setZero()
           mMotorImpulse = 0.0
       }
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
   }
   
   public override func solveVelocityConstraints( data: B2SolverData): B2SolverData {
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let mA = mInvMassA
       let mB = mInvMassB
       let iA = mInvIA
       let iB = mInvIB
       let fixedRotation = (iA + iB == 0.0)
       if (mEnableMotor && mLimitState.getValue()  != B2LimitState.EQUALLIMITS.getValue()  && fixedRotation == false) {
           let cdot = wB - wA - mMotorSpeed
           var impulse = -mMotorMass * cdot
           let oldImpulse = mMotorImpulse
           let maxImpulse = data.step.dt * mMaxMotorTorque
           mMotorImpulse = b2ClampF(mMotorImpulse + impulse, -maxImpulse, maxImpulse)
           impulse = mMotorImpulse - oldImpulse
           wA -= iA * impulse
           wB += iB * impulse
       }
       
       if (mEnableLimit && mLimitState.getValue()  != B2LimitState.INACTIVELIMIT.getValue()  && fixedRotation == false) {
           let cdot1 = subtract(subtract(add(vB, b2Cross21(wB, mrB)), vA), b2Cross21(wA, mrA))
           let cdot2 = wB - wA
           let cdot = B2Vec3(x1:cdot1.x, y1:cdot1.y, z1:cdot2)
           var impulse = minus3(mMass.solve33(cdot))
           if (mLimitState.getValue()  == B2LimitState.EQUALLIMITS.getValue() ) {
               addEqual3(mImpulse, impulse)
           } else if (mLimitState.getValue()  == B2LimitState.ATLOWERLIMIT.getValue() ) {
               let newImpulse = mImpulse.z + impulse.z
               if (newImpulse < 0.0) {
                   let rhs = add(minus(cdot1), multM(B2Vec2(x0:mMass.ez.x,y0: mMass.ez.y), mImpulse.z))
                   let reduced = mMass.solve22(rhs)
                   impulse.x = reduced.x
                   impulse.y = reduced.y
                   impulse.z = -mImpulse.z
                   mImpulse.x += reduced.x
                   mImpulse.y += reduced.y
                   mImpulse.z = 0.0
               } else {
                   addEqual3(mImpulse, impulse)
               }
           } else if (mLimitState.getValue()  == B2LimitState.ATUPPERLIMIT.getValue() ) {
               let newImpulse = mImpulse.z + impulse.z
               if (newImpulse > 0.0) {
                   let mass = B2Vec2(x0:mMass.ez.x, y0:mMass.ez.y)
                   let rhs = add(minus(cdot1), multM(mass, mImpulse.z))
                   let reduced = mMass.solve22(rhs)
                   impulse.x = reduced.x
                   impulse.y = reduced.y
                   impulse.z = -mImpulse.z
                   mImpulse.x += reduced.x
                   mImpulse.y += reduced.y
                   mImpulse.z = 0.0
               } else {
                   addEqual3(mImpulse, impulse)
               }
           }
           let mP = B2Vec2(x0:impulse.x, y0:impulse.y)
           subtractEqual(vA, multM(mP, mA))
           wA -= iA * (b2Cross(mrA, mP) + impulse.z)
           addEqual(vB, multM(mP, mB))
           wB += iB * (b2Cross(mrB, mP) + impulse.z)
       } else {
           let cdot = subtract(subtract(add(vB, b2Cross21(wB, mrB)), vA), b2Cross21(wA, mrA))
           let impulse = mMass.solve22(minus(cdot))
           mImpulse.x += impulse.x
           mImpulse.y += impulse.y
           subtractEqual(vA, multM(impulse, mA))
           wA -= iA * b2Cross(mrA, impulse)
           addEqual(vB, multM(impulse, mB))
           wB += iB * b2Cross(mrB, impulse)
       }
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
    }
   
    public override func solvePositionConstraints( data: B2SolverData) : Bool {
       var cA = data.positions.get(index:mIndexA).c
       var aA = data.positions.get(index:mIndexA).a
       var cB = data.positions.get(index:mIndexB).c
       var aB = data.positions.get(index:mIndexB).a
       var qA = B2Rot(angle:aA)
       var qB = B2Rot(angle:aB)
       var angularError: Float64 = 0.0
       var positionError: Float64 = 0.0
       let fixedRotation = (mInvIA + mInvIB == 0.0)
       if (mEnableLimit && mLimitState.getValue() != B2LimitState.INACTIVELIMIT.getValue() && fixedRotation == false) {
           let angle = aB - aA - mReferenceAngle
           var limitImpulse: Float64 = 0.0
           if (mLimitState.getValue() == B2LimitState.EQUALLIMITS.getValue()) {
               let mC = b2ClampF(angle - mLowerAngle, -b2MaxAngularCorrection, b2MaxAngularCorrection)
               limitImpulse = -mMotorMass * mC
               angularError = abs(mC)
           } else if (mLimitState.getValue() == B2LimitState.ATLOWERLIMIT.getValue()) {
               var mC = angle - mLowerAngle
               angularError = -mC
               mC = b2ClampF(mC + b2AngularSlop, -b2MaxAngularCorrection, 0.0)
               limitImpulse = -mMotorMass * mC
           } else if (mLimitState.getValue() == B2LimitState.ATUPPERLIMIT.getValue()) {
               var mC = angle - mUpperAngle
               angularError = mC
               mC = b2ClampF(mC - b2AngularSlop, 0.0, b2MaxAngularCorrection)
               limitImpulse = -mMotorMass * mC
           }
           aA -= mInvIA * limitImpulse
           aB += mInvIB * limitImpulse
       }
       qA.set(aA)
       qB.set(aB)
       let rA = b2MulR2(qA, subtract(this.mLocalAnchorA, this.mLocalCenterA))
       let rB = b2MulR2(qB, subtract(this.mLocalAnchorB, this.mLocalCenterB))
       let cC = subtract(subtract(add(cB, rB), cA), rA)
       positionError = cC.length()
       let mA = this.mInvMassA
       let mB = this.mInvMassB
       let iA = this.mInvIA
       let iB = this.mInvIB
       var mK = B2Mat22()
       mK.ex.x = mA + mB + iA * rA.y * rA.y + iB * rB.y * rB.y
       mK.ex.y = -iA * rA.x * rA.y - iB * rB.x * rB.y
       mK.ey.x = mK.ex.y
       mK.ey.y = mA + mB + iA * rA.x * rA.x + iB * rB.x * rB.x
       let impulse = minus(mK.solve(cC))
       subtractEqual(cA, multM(impulse, mA))
       aA -= iA * b2Cross(rA, impulse)
       addEqual(cB, multM(impulse, mB))
       aB += iB * b2Cross(rB, impulse)
       data.positions.get(index:mIndexA).c = cA
       data.positions.get(index:mIndexA).a = aA
       data.positions.get(index:mIndexB).c = cB
       data.positions.get(index:mIndexB).a = aB
       return positionError <= b2LinearSlop && angularError <= b2AngularSlop
   }
   var mLocalAnchorA: B2Vec2
   var mLocalAnchorB: B2Vec2
   var mImpulse: B2Vec3
   var mMotorImpulse: Float64
   var mEnableMotor: Bool
   var mMaxMotorTorque: Float64
   var mMotorSpeed: Float64
   var mEnableLimit: Bool
   var mReferenceAngle: Float64
   var mLowerAngle: Float64
   var mUpperAngle: Float64
   var mIndexA: Int64 = 0
   var mIndexB: Int64 = 0
   var mrA = B2Vec2()
   var mrB = B2Vec2()
   var mLocalCenterA = B2Vec2()
   var mLocalCenterB = B2Vec2()
   var mInvMassA: Float64 = 0.0
   var mInvMassB: Float64 = 0.0
   var mInvIA: Float64 = 0.0
   var mInvIB: Float64 = 0.0
   var mMass = B2Mat33()
   var mMotorMass: Float64 = 0.0
   var mLimitState = B2LimitState.INACTIVELIMIT
}

open class B2PulleyJointDef <: B2JointDef {
   public init() {
       super()
       groundAnchorA = B2Vec2(x0:-1.0,y0: 1.0)
       groundAnchorB = B2Vec2(x0:1.0,y0: 1.0)
       localAnchorA = B2Vec2(x0:-1.0, y0:0.0)
       localAnchorB = B2Vec2(x0:1.0,y0: 0.0)
       lengthA = 0.0
       lengthB = 0.0
       ratio = 1.0
       `type` = B2JointType.PULLEYJOINT
       collideConnected = true
   }
   
   public open func initialize( bodyA: B2Body,  bodyB: B2Body,  groundAnchorA: B2Vec2,  groundAnchorB: B2Vec2,  anchorA: B2Vec2,  anchorB: B2Vec2,  ratio: Float64) {
       this.bodyA = bodyA
       this.bodyB = bodyB
       this.groundAnchorA = groundAnchorA
       this.groundAnchorB = groundAnchorB
       this.localAnchorA = this.bodyA.getOrThrow().getLocalPoint(anchorA)
       this.localAnchorB = this.bodyB.getOrThrow().getLocalPoint(anchorB)
       let dA = subtract(anchorA, groundAnchorA)
       this.lengthA = dA.length()
       let dB = subtract(anchorB, groundAnchorB)
       this.lengthB = dB.length()
       this.ratio = ratio
   }
   
   var groundAnchorA: B2Vec2
   var groundAnchorB: B2Vec2
   var localAnchorA: B2Vec2
   var localAnchorB: B2Vec2
   var lengthA: Float64
   var lengthB: Float64
   var ratio: Float64
}

open class B2PulleyJoint <: B2Joint {
    var mGroundAnchorA: B2Vec2
    var mGroundAnchorB: B2Vec2
    var mLengthA: Float64
    var mLengthB: Float64
    var mLocalAnchorA: B2Vec2
    var mLocalAnchorB: B2Vec2
    var mConstant: Float64
    var mRatio: Float64
    var mImpulse: Float64
    var mIndexA: Int64 = 0
    var mIndexB: Int64 = 0
    var muA = B2Vec2()
    var muB = B2Vec2()
    var mrA = B2Vec2()
    var mrB = B2Vec2()
    var mLocalCenterA = B2Vec2()
    var mLocalCenterB = B2Vec2()
    var mInvMassA: Float64 = 0.0
    var mInvMassB: Float64 = 0.0
    var mInvIA: Float64 = 0.0
    var mInvIB: Float64 = 0.0
    var mMass: Float64 = 0.0
    public prop anchorA: B2Vec2 {
        get() {
	    mBodyA.getWorldPoint(mLocalAnchorA)
	}
    }
    public prop anchorB: B2Vec2 {
       get() {
           mBodyB.getWorldPoint(mLocalAnchorB)
       }
    }
    public override func getReactionForce( invdt: Float64) : B2Vec2 {
       let mP = multM(muB, mImpulse)
       return multM(mP, invdt)
    }
    public override func getReactionTorque( invdt: Float64) : Float64 {
       return 0.0
    }
    public prop groundAnchorA: B2Vec2  { 
        get() {
            mGroundAnchorA
	}
    }
    public prop groundAnchorB: B2Vec2  { 
       get() {
           mGroundAnchorB
       }
    }
    public prop lengthA: Float64  { 
       get() {
           mLengthA
       }
    }
    public prop lengthB: Float64  { 
       get() {
           mLengthB
       }
    }
    public prop ratio: Float64  { 
       get() {
           mRatio
       }
    }
    
    public prop currentLengthA: Float64  { 
       get() {
           let p = mBodyA.getWorldPoint(mLocalAnchorA)
           let s = mGroundAnchorA
           let d = subtract(p, s)
           d.length()
       }
    }
    public prop currentLengthB: Float64  { 
       get() {
           let p = mBodyB.getWorldPoint(mLocalAnchorB)
           let s = mGroundAnchorB
           let d = subtract(p, s)
           d.length()
       }
    }

    public open override func shiftOrigin( newOrigin: B2Vec2):Unit {
       subtractEqual(mGroundAnchorA, newOrigin)
       subtractEqual(mGroundAnchorB, newOrigin)
    }
    init( def: B2PulleyJointDef) {
       super(def)
       mGroundAnchorA = def.groundAnchorA
       mGroundAnchorB = def.groundAnchorB
       mLocalAnchorA = def.localAnchorA
       mLocalAnchorB = def.localAnchorB
       mLengthA = def.lengthA
       mLengthB = def.lengthB
       mRatio = def.ratio
       mConstant = def.lengthA + mRatio * def.lengthB
       mImpulse = 0.0
    }
   
   public override func initVelocityConstraints( data: B2SolverData): B2SolverData {
       mIndexA = mBodyA.mIslandIndex
       mIndexB = mBodyB.mIslandIndex
       mLocalCenterA = mBodyA.mSweep.localCenter
       mLocalCenterB = mBodyB.mSweep.localCenter
       mInvMassA = mBodyA.mInvMass
       mInvMassB = mBodyB.mInvMass
       mInvIA = mBodyA.mInvI
       mInvIB = mBodyB.mInvI
       let cA = data.positions.get(index:mIndexA).c
       let aA = data.positions.get(index:mIndexA).a
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       let cB = data.positions.get(index:mIndexB).c
       let aB = data.positions.get(index:mIndexB).a
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let qA = B2Rot(angle:aA)
       let qB = B2Rot(angle:aB)
       mrA = b2MulR2(qA, subtract(mLocalAnchorA, mLocalCenterA))
       mrB = b2MulR2(qB, subtract(mLocalAnchorB, mLocalCenterB))
       muA = subtract(add(cA, mrA), mGroundAnchorA)
       muB = subtract(add(cB, mrB), mGroundAnchorB)
       let lengthA = muA.length()
       let lengthB = muB.length()
       if (lengthA > float10 * b2LinearSlop) {
           mulEqual(a:muA, b:1.0 / lengthA)
       } else {
           muA.setZero()
       }
       if (lengthB > float10 * b2LinearSlop) {
           mulEqual(a:muB, b:1.0 / lengthB)
       } else {
           muB.setZero()
       }
       let ruA = b2Cross(mrA, muA)
       let ruB = b2Cross(mrB, muB)
       let mA = mInvMassA + mInvIA * ruA * ruA
       let mB = mInvMassB + mInvIB * ruB * ruB
       mMass = mA + mRatio * mRatio * mB

       if (mMass > 0.0){
           mMass = 1.0 / mMass
       } else{
           mMass = mMass
       }
       if (data.step.warmStarting) {
           mImpulse *= data.step.dtRatio
           let mPA = multM(muA, -mImpulse)
           let mPB = multM(muB, -mRatio * mImpulse)
           addEqual(vA, multM(mPA, mInvMassA))
           wA += mInvIA * b2Cross(mrA, mPA)
           addEqual(vB, multM(mPB, mInvMassB))
           wB += mInvIB * b2Cross(mrB, mPB)
       } else {
           mImpulse = 0.0
       }
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
   }
   
   public override func solveVelocityConstraints( data: B2SolverData): B2SolverData {
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let vpA = add(vA, b2Cross21(wA, mrA))
       let vpB = add(vB, b2Cross21(wB, mrB))
       let cdot = -b2Dot22(muA, vpA) - mRatio * b2Dot22(muB, vpB)
       let impulse = -mMass * cdot
       mImpulse += impulse
       let mPA = multM(muA, -impulse)
       let mPB = multM(muB, -mRatio * impulse)
       addEqual(vA, multM(mPA, mInvMassA))
       wA += mInvIA * b2Cross(mrA, mPA)
       addEqual(vB, multM(mPB, mInvMassB))
       wB += mInvIB * b2Cross(mrB, mPB)
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
    }
   
   public override func solvePositionConstraints( data: B2SolverData) : Bool {
       var cA = data.positions.get(index:mIndexA).c
       var aA = data.positions.get(index:mIndexA).a
       var cB = data.positions.get(index:mIndexB).c
       var aB = data.positions.get(index:mIndexB).a
       let qA = B2Rot(angle:aA)
       let qB = B2Rot(angle:aB)
       let rA = b2MulR2(qA, subtract(mLocalAnchorA, mLocalCenterA))
       let rB = b2MulR2(qB, subtract(mLocalAnchorB, mLocalCenterB))
       var uA = subtract(add(cA, rA), mGroundAnchorA)
       var uB = subtract(add(cB, rB), mGroundAnchorB)
       let lengthA = uA.length()
       let lengthB = uB.length()
       if (lengthA > float10 * b2LinearSlop) {
           mulEqual(a:uA, b:1.0 / lengthA)
       } else {
           uA.setZero()
       }
       if (lengthB > float10 * b2LinearSlop) {
           mulEqual(a:uB, b:1.0 / lengthB)
       } else {
           uB.setZero()
       }
       let ruA = b2Cross(rA, uA)
       let ruB = b2Cross(rB, uB)
       let mA = mInvMassA + mInvIA * ruA * ruA
       let mB = mInvMassB + mInvIB * ruB * ruB
       var mass = mA + mRatio * mRatio * mB
       if (mass > 0.0) {
           mass = 1.0 / mass
       }
       let mC = mConstant - lengthA - mRatio * lengthB
       let linearError = abs(mC)
       let impulse = -mass * mC
       let mPA = multM(uA, -impulse)
       let mPB = multM(uB, -mRatio * impulse)
       addEqual(cA, multM(mPA, mInvMassA))
       aA += mInvIA * b2Cross(rA, mPA)
       addEqual(cB, multM(mPB, mInvMassB))
       aB += mInvIB * b2Cross(rB, mPB)
       data.positions.get(index:mIndexA).c = cA
       data.positions.get(index:mIndexA).a = aA
       data.positions.get(index:mIndexB).c = cB
       data.positions.get(index:mIndexB).a = aB
       return linearError < b2LinearSlop
   }
}

open class B2PrismaticJointDef <: B2JointDef {
   public init() {
       super()
       localAnchorA = B2Vec2()
       localAnchorB = B2Vec2()
       localAxisA = B2Vec2(x0:1.0, y0:0.0)
       referenceAngle = 0.0
       enableLimit = false
       lowerTranslation = 0.0
       upperTranslation = 0.0
       enableMotor = false
       maxMotorForce = 0.0
       motorSpeed = 0.0
       `type` = B2JointType.PRISMATICJOINT
   }
   
   public open func initialize( bA: B2Body,  bB: B2Body,  anchor: B2Vec2,  axis: B2Vec2) {
       bodyA = bA
       bodyB = bB
       localAnchorA = bodyA.getOrThrow().getLocalPoint(anchor)
       localAnchorB = bodyB.getOrThrow().getLocalPoint(anchor)
       localAxisA = bodyA.getOrThrow().getLocalVector(axis)
       referenceAngle = bodyB.getOrThrow().angle() - bodyA.getOrThrow().angle()
   }
   var localAnchorA: B2Vec2
   var localAnchorB: B2Vec2
   var localAxisA: B2Vec2
   var referenceAngle: Float64
   var enableLimit: Bool
   var lowerTranslation: Float64
   var upperTranslation: Float64
   var enableMotor: Bool
   var maxMotorForce: Float64
   var motorSpeed: Float64
}

open class B2PrismaticJoint <: B2Joint {
    public prop anchorA: B2Vec2 {
        get() {
	    mBodyA.getWorldPoint(mLocalAnchorA)
	}
    }

    
    public prop anchorB: B2Vec2 {
        get() {
	    mBodyB.getWorldPoint(mLocalAnchorB)
	}
    }

    public override func getReactionForce( invdt: Float64) : B2Vec2 {
       return multM(add(multM(mPerp, mImpulse.x), multM(mAxis, (mMotorImpulse + mImpulse.z))), invdt)
    }
    
    public override func getReactionTorque( invdt: Float64) : Float64 {
       return invdt * mImpulse.y
    }

    public prop localAnchorA: B2Vec2  { 
        get() {
	    mLocalAnchorA
	}
    }

    public prop localAnchorB: B2Vec2  { 
        get() {
	    mLocalAnchorB
	}
    }
    
    public prop localAxisA: B2Vec2  { 
        get() {
	    mLocalXAxisA
	}
    }
    
    public prop referenceAngle: Float64  { 
        get() {
            mReferenceAngle
	}
    }
   
    public prop jointTranslation: Float64  { 
        get() {
	    let pA = mBodyA.getWorldPoint(mLocalAnchorA)
            let pB = mBodyB.getWorldPoint(mLocalAnchorB)
            let d = subtract(pB, pA)
            let axis = mBodyA.getWorldVector(mLocalXAxisA)
            let translation = b2Dot22(d, axis)
            translation
	}
   
    }

    public prop jointSpeed: Float64  { 
        get() {
            let bA = mBodyA
            let bB = mBodyB
            let rA = b2MulR2(bA.mXF.q, subtract(mLocalAnchorA, bA.mSweep.localCenter))
            let rB = b2MulR2(bB.mXF.q, subtract(mLocalAnchorB, bB.mSweep.localCenter))
            let p1 = add(bA.mSweep.c, rA)
            let p2 = add(bB.mSweep.c, rB)
            let d = subtract(p2, p1)
            let axis = b2MulR2(bA.mXF.q, mLocalXAxisA)
            let vA = bA.mLinearVelocity
            let vB = bB.mLinearVelocity
            let wA = bA.mAngularVelocity
            let wB = bB.mAngularVelocity
            let sub = subtract(subtract(add(vB, b2Cross21(wB, rB)), vA), b2Cross21(wA, rA))
            let speed = b2Dot22(d, b2Cross21(wA, axis)) + b2Dot22(axis, sub)
            return speed
	}
    }
   
    public mut prop isLimitEnabled: Bool {
       get() {
           mEnableLimit
       }
       set(newValue) {
           enableLimit(newValue)
       }
    }

    public open func enableLimit( flag: Bool) {
       if (flag != mEnableLimit) {
           mBodyA.setAwake(true)
           mBodyB.setAwake(true)
           mEnableLimit = flag
           mImpulse.z = 0.0
       }
    }

    public prop lowerLimit: Float64 {
        get() {
	    mLowerTranslation
	}
    }

    public prop upperLimit: Float64  { 
        get() {
           mUpperTranslation
	}
    }
   
    public open func setLimits( lower: Float64,  upper: Float64) {
       if (lower != mLowerTranslation || upper != mUpperTranslation) {
           mBodyA.setAwake(true)
           mBodyB.setAwake(true)
           mLowerTranslation = lower
           mUpperTranslation = upper
           mImpulse.z = 0.0
       }
    }

    public mut prop isMotorEnabled: Bool {
       get() {
           mEnableMotor
       }
       set(newValue) {
           enableMotor(newValue)
       }
    }
   
    public open func enableMotor( flag: Bool) {
       mBodyA.setAwake(true)
       mBodyB.setAwake(true)
       mEnableMotor = flag
    }

    func setMotorSpeed( speed: Float64) {
       mBodyA.setAwake(true)
       mBodyB.setAwake(true)
       mMotorSpeed = speed
    }

    public mut prop motorSpeed: Float64 {
       get() {
           mMotorSpeed
       }
       set(newValue) {
           setMotorSpeed(newValue)
       }
    }

    public open func setMaxMotorForce( force: Float64) {
       mBodyA.setAwake(true)
       mBodyB.setAwake(true)
       mMaxMotorForce = force
    }
   
    public mut prop maxMotorForce: Float64 {
       get() {
           mMaxMotorForce
       }
       set(newValue) {
           setMaxMotorForce(newValue)
       }
    }

    public open func getMotorForce( invdt: Float64) : Float64 {
       return invdt * mMotorImpulse
    }

    init( def: B2PrismaticJointDef) {
       super(def)
       mLocalAnchorA = def.localAnchorA
       mLocalAnchorB = def.localAnchorB
       mLocalXAxisA = def.localAxisA
       mLocalXAxisA.normalize()
       mLocalYAxisA = b2Cross21(1.0, mLocalXAxisA)
       mReferenceAngle = def.referenceAngle
       mImpulse = B2Vec3(x1:0.0, y1:0.0, z1:0.0)
       mMotorMass = 0.0
       mMotorImpulse = 0.0
       mLowerTranslation = def.lowerTranslation
       mUpperTranslation = def.upperTranslation
       mMaxMotorForce = def.maxMotorForce
       mMotorSpeed = def.motorSpeed
       mEnableLimit = def.enableLimit
       mEnableMotor = def.enableMotor
       mLimitState = B2LimitState.INACTIVELIMIT
       mAxis = B2Vec2(x0:0.0, y0:0.0)
       mPerp = B2Vec2(x0:0.0, y0:0.0)

    }
   
    public override func initVelocityConstraints( data: B2SolverData): B2SolverData {
       mIndexA = mBodyA.mIslandIndex
       mIndexB = mBodyB.mIslandIndex
       mLocalCenterA = mBodyA.mSweep.localCenter
       mLocalCenterB = mBodyB.mSweep.localCenter
       mInvMassA = mBodyA.mInvMass
       mInvMassB = mBodyB.mInvMass
       mInvIA = mBodyA.mInvI
       mInvIB = mBodyB.mInvI
       let cA = data.positions.get(index:mIndexA).c
       let aA = data.positions.get(index:mIndexA).a
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       let cB = data.positions.get(index:mIndexB).c
       let aB = data.positions.get(index:mIndexB).a
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let qA = B2Rot(angle:aA)
       let qB = B2Rot(angle:aB)
       let rA = b2MulR2(qA, subtract(mLocalAnchorA, mLocalCenterA))
       let rB = b2MulR2(qB, subtract(mLocalAnchorB, mLocalCenterB))
       let d = subtract(add(subtract(cB, cA), rB), rA)
       let mA = mInvMassA
       let mB = mInvMassB
       let iA = mInvIA
       let iB = mInvIB
       this.mAxis = b2MulR2(qA, this.mLocalXAxisA)
       this.ma1 = b2Cross(add(d, rA), this.mAxis)
       this.ma2 = b2Cross(rB, this.mAxis)
       this.mMotorMass = mA + mB + iA * this.ma1 * this.ma1 + iB * this.ma2 * this.ma2
       if (this.mMotorMass > 0.0) {
           this.mMotorMass = 1.0 / this.mMotorMass
       }
       this.mPerp = b2MulR2(qA, this.mLocalYAxisA)
       this.ms1 = b2Cross(add(d, rA), this.mPerp)
       this.ms2 = b2Cross(rB, this.mPerp)
       let k11 = mA + mB + iA * this.ms1 * this.ms1 + iB * this.ms2 * this.ms2
       let k12 = iA * this.ms1 + iB * this.ms2
       let k13 = iA * this.ms1 * this.ma1 + iB * this.ms2 * this.ma2
       var k22 = iA + iB
       if (k22 == 0.0) {
           k22 = 1.0
       }
       let k23 = iA * this.ma1 + iB * this.ma2
       let k33 = mA + mB + iA * this.ma1 * this.ma1 + iB * this.ma2 * this.ma2
       this.matK.ex.set(k11, k12, k13)
       this.matK.ey.set(k12, k22, k23)
       this.matK.ez.set(k13, k23, k33)
       if (mEnableLimit) {
           let jointTranslation = b2Dot22(mAxis, d)
           if (abs(mUpperTranslation - mLowerTranslation) < float2 * b2LinearSlop) {
               mLimitState = B2LimitState.EQUALLIMITS
           } else if (jointTranslation <= mLowerTranslation) {
               if (mLimitState.getValue() != B2LimitState.ATLOWERLIMIT.getValue()) {
                   mLimitState = B2LimitState.ATLOWERLIMIT
                   mImpulse.z = 0.0
               }
           } else if (jointTranslation >= mUpperTranslation) {
               if (mLimitState.getValue() != B2LimitState.ATUPPERLIMIT.getValue()) {
                   mLimitState = B2LimitState.ATUPPERLIMIT
                   mImpulse.z = 0.0
               }
           } else {
               mLimitState = B2LimitState.INACTIVELIMIT
               mImpulse.z = 0.0
           }
       } else {
           mLimitState = B2LimitState.INACTIVELIMIT
           mImpulse.z = 0.0
       }
       if (mEnableMotor == false) {
           mMotorImpulse = 0.0
       }
       if (data.step.warmStarting) {
           mulMEqual3(mImpulse, data.step.dtRatio)
           mMotorImpulse *= data.step.dtRatio
           let mP = add(multM(mPerp, mImpulse.x), multM(mAxis, (mMotorImpulse + mImpulse.z)))
           let mLA = mImpulse.x * ms1 + mImpulse.y + (mMotorImpulse + mImpulse.z) * ma1
           let mLB = mImpulse.x * ms2 + mImpulse.y + (mMotorImpulse + mImpulse.z) * ma2
           subtractEqual(vA, multM(mP, mA))
           wA -= iA * mLA
           addEqual(vB, multM(mP, mB))
           wB += iB * mLB
       } else {
           mImpulse.setZero()
           mMotorImpulse = 0.0
       }
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
   }
   
   public override func solveVelocityConstraints( data: B2SolverData): B2SolverData {
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let mA = mInvMassA
       let mB = mInvMassB
       let iA = mInvIA
       let iB = mInvIB
       if (mEnableMotor && mLimitState.getValue() != B2LimitState.EQUALLIMITS.getValue()) {
           let cdot = b2Dot22(mAxis, subtract(vB, vA)) + ma2 * wB - ma1 * wA
           var impulse = mMotorMass * (mMotorSpeed - cdot)
           let oldImpulse = mMotorImpulse
           let maxImpulse = data.step.dt * mMaxMotorForce
           mMotorImpulse = b2ClampF(mMotorImpulse + impulse, -maxImpulse, maxImpulse)
           impulse = mMotorImpulse - oldImpulse
           let mP = multM(mAxis, impulse)
           let lA = impulse * ma1
           let lB = impulse * ma2
           subtractEqual(vA, multM(mP, mA))
           wA -= iA * lA
           addEqual(vB, multM(mP, mB))
           wB += iB * lB
       }
       var cdot1 = B2Vec2()
       cdot1.x = b2Dot22(mPerp, subtract(vB, vA)) + ms2 * wB - ms1 * wA
       cdot1.y = wB - wA
       if (mEnableLimit && mLimitState.getValue() != B2LimitState.INACTIVELIMIT.getValue()) {
           let cdot2 = b2Dot22(mAxis, subtract(vB, vA)) + ma2 * wB - ma1 * wA
           let cdot = B2Vec3(x1:cdot1.x, y1:cdot1.y, z1:cdot2)
           let f1 = mImpulse
           var df =  matK.solve33(minus3(cdot))
           addEqual3(mImpulse, df)
           if (mLimitState.getValue() == B2LimitState.ATLOWERLIMIT.getValue()) {
               mImpulse.z = max(mImpulse.z, 0.0)
           } else if (mLimitState.getValue() == B2LimitState.ATUPPERLIMIT.getValue()) {
               mImpulse.z = min(mImpulse.z, 0.0)
           }
           let mkk = B2Vec2(x0:matK.ez.x, y0:matK.ez.y)
           let b = subtract(minus(cdot1), multM(mkk, (mImpulse.z - f1.z)))
           let ffx = B2Vec2(x0:f1.x, y0:f1.y)
           let f2r = add(matK.solve22(b), ffx)
           mImpulse.x = f2r.x
           mImpulse.y = f2r.y
           df = subtract3(mImpulse, f1)
           let p = add(multM(mPerp, df.x), multM(mAxis, df.z))
           let lA = df.x * ms1 + df.y + df.z * ma1
           let lB = df.x * ms2 + df.y + df.z * ma2
           subtractEqual(vA, multM(p, mA))
           wA -= iA * lA
           addEqual(vB, multM(p, mB))
           wB += iB * lB
       } else {
           let df = matK.solve22(minus(cdot1))
           mImpulse.x += df.x
           mImpulse.y += df.y
           let mP = multM(mPerp, df.x)
           let mLA = df.x * ms1 + df.y
           let mLB = df.x * ms2 + df.y
           subtractEqual(vA, multM(mP, mA))
           wA -= iA * mLA
           addEqual(vB, multM(mP, mB))
           wB += iB * mLB
       }
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
   }
   
   public override func solvePositionConstraints( data: B2SolverData) : Bool {
       var cA = data.positions.get(index:mIndexA).c
       var aA = data.positions.get(index:mIndexA).a
       var cB = data.positions.get(index:mIndexB).c
       var aB = data.positions.get(index:mIndexB).a
       let qA = B2Rot(angle:aA)
       let qB = B2Rot(angle:aB)
       let mA = mInvMassA
       let mB = mInvMassB
       let iA = mInvIA
       let iB = mInvIB
       let rA = b2MulR2(qA, subtract(mLocalAnchorA, mLocalCenterA))
       let rB = b2MulR2(qB, subtract(mLocalAnchorB, mLocalCenterB))
       let d = subtract(subtract(add(cB, rB), cA), rA)
       let axis = b2MulR2(qA, mLocalXAxisA)
       let a1 = b2Cross(add(d, rA), axis)
       let a2 = b2Cross(rB, axis)
       let perp = b2MulR2(qA, mLocalYAxisA)
       let s1 = b2Cross(add(d, rA), perp)
       let s2 = b2Cross(rB, perp)
       var impulse = B2Vec3()
       var c1 = B2Vec2()
       c1.x = b2Dot22(perp, d)
       c1.y = aB - aA - mReferenceAngle
       var linearError = abs(c1.x)
       let angularError = abs(c1.y)
       var active = false
       var c2: Float64 = 0.0
       if (mEnableLimit) {
           let translation = b2Dot22(axis, d)
           if (abs(mUpperTranslation - mLowerTranslation) < float2 * b2LinearSlop) {
               c2 = b2ClampF(translation, -b2MaxLinearCorrection, b2MaxLinearCorrection)
               linearError = max(linearError, abs(translation))
               active = true
           } else if (translation <= mLowerTranslation) {
               c2 = b2ClampF(translation - mLowerTranslation + b2LinearSlop, -b2MaxLinearCorrection, 0.0)
               linearError = max(linearError, mLowerTranslation - translation)
               active = true
           } else if (translation >= mUpperTranslation) {
               c2 = b2ClampF(translation - mUpperTranslation - b2LinearSlop, 0.0, b2MaxLinearCorrection)
               linearError = max(linearError, translation - mUpperTranslation)
               active = true
           }
       }
       if (active) {
           let k11 = mA + mB + iA * s1 * s1 + iB * s2 * s2
           let k12 = iA * s1 + iB * s2
           let k13 = iA * s1 * a1 + iB * s2 * a2
           var k22 = iA + iB
           if (k22 == 0.0) {
               k22 = 1.0
           }
           let k23 = iA * a1 + iB * a2
           let k33 = mA + mB + iA * a1 * a1 + iB * a2 * a2
           var mK = B2Mat33()
           mK.ex.set(k11, k12, k13)
           mK.ey.set(k12, k22, k23)
           mK.ez.set(k13, k23, k33)
           var cC = B2Vec3()
           cC.x = c1.x
           cC.y = c1.y
           cC.z = c2
           impulse = mK.solve33(minus3(cC))
       } else {
           let k11 = mA + mB + iA * s1 * s1 + iB * s2 * s2
           let k12 = iA * s1 + iB * s2
           var k22 = iA + iB
           if (k22 == 0.0) {
               k22 = 1.0
           }
           var mK = B2Mat22()
           mK.ex.set(k11, k12)
           mK.ey.set(k12, k22)
           let impulse1 = mK.solve(minus(c1))
           impulse.x = impulse1.x
           impulse.y = impulse1.y
           impulse.z = 0.0
       }
       let p = add(multM(perp, impulse.x), multM(axis, impulse.z))
       let lA = impulse.x * s1 + impulse.y + impulse.z * a1
       let lB = impulse.x * s2 + impulse.y + impulse.z * a2
       subtractEqual(cA, multM(p, mA))
       aA -= iA * lA
       addEqual(cB, multM(p, mB))
       aB += iB * lB
       data.positions.get(index:mIndexA).c = cA
       data.positions.get(index:mIndexA).a = aA
       data.positions.get(index:mIndexB).c = cB
       data.positions.get(index:mIndexB).a = aB
       return linearError <= b2LinearSlop && angularError <= b2AngularSlop
   }
   
   var mLocalAnchorA: B2Vec2
   var mLocalAnchorB: B2Vec2
   var mLocalXAxisA: B2Vec2
   var mLocalYAxisA: B2Vec2
   var mReferenceAngle: Float64
   var mImpulse: B2Vec3
   var mMotorImpulse: Float64
   var mLowerTranslation: Float64
   var mUpperTranslation: Float64
   var mMaxMotorForce: Float64
   var mMotorSpeed: Float64
   var mEnableLimit: Bool
   var mEnableMotor: Bool
   var mLimitState: B2LimitState
   var mIndexA: Int64 = 0
   var mIndexB: Int64 = 0
   var mLocalCenterA = B2Vec2()
   var mLocalCenterB = B2Vec2()
   var mInvMassA: Float64 = 0.0
   var mInvMassB: Float64 = 0.0
   var mInvIA: Float64 = 0.0
   var mInvIB: Float64 = 0.0
   var mAxis = B2Vec2()
   var mPerp = B2Vec2()
   var ms1: Float64 = 0.0
   var ms2: Float64 = 0.0
   var ma1: Float64 = 0.0
   var ma2: Float64 = 0.0
   var matK = B2Mat33()
   var mMotorMass: Float64 = 0.0
}

open class B2MouseJointDef <: B2JointDef {
   public init() {
       super()
       target = B2Vec2()
       maxForce = 0.0
       frequencyHz = 5.0
       dampingRatio = 0.7
       `type` = B2JointType.MOUSEJOINT
   }
   var target: B2Vec2
   var maxForce: Float64
   var frequencyHz: Float64
   var dampingRatio: Float64
}

open class B2MouseJoint <: B2Joint {
    init(def: B2MouseJointDef) {
       super(def)

       mTargetA = def.target
       mMaxForce = def.maxForce
       mImpulse = B2Vec2(x0:0.0,y0: 0.0)
       mFrequencyHz = def.frequencyHz
       mDampingRatio = def.dampingRatio
       mBeta = 0.0
       mGamma = 0.0
       mLocalAnchorB = b2MulTT2(mBodyB.transform(), mTargetA)
   }

   public prop anchorA: B2Vec2 {
       get() {
           mTargetA
       }
   }
   public prop anchorB: B2Vec2 {
       get() {
           mBodyB.getWorldPoint(mLocalAnchorB.getOrThrow())
       }
   }
   public override func getReactionForce( invdt: Float64) : B2Vec2 {
       return multM(mImpulse, invdt)
   }
   public override func getReactionTorque( invdt: Float64) : Float64 {
       return invdt * 0.0
   }
   public func setTarget( target: B2Vec2) {
       if (mBodyB.isAwake() == false) {
           mBodyB.setAwake(true)
       }
       mTargetA = target
   }
   public mut prop target: B2Vec2 {
       get() {
           mTargetA
       }
       set(newValue) {
           setTarget(newValue)
       }
   }
   public func setMaxForce( force: Float64) {
       mMaxForce = force
   }
   public mut prop maxForce: Float64 {
       get() {
           mMaxForce
       }
       set(newValue) {
           setMaxForce(newValue)
       }
   }
   public func setFrequency( hz: Float64) {
       mFrequencyHz = hz
   }
   public mut prop frequency: Float64 {
       get() {
           mFrequencyHz
       }
       set(newValue) {
           setFrequency(newValue)
       }
   }
   public func setDampingRatio( ratio: Float64) {
       mDampingRatio = ratio
   }
   public mut prop dampingRatio: Float64 {
       get() {
           mDampingRatio
       }
       set(newValue) {
           setDampingRatio(newValue)
       }
   }
   public open override func shiftOrigin( newOrigin: B2Vec2):Unit {
       subtractEqual(mTargetA, newOrigin)
   }
   
   public override func initVelocityConstraints( data:  B2SolverData): B2SolverData {
       let multiFactor = 0.98
       mIndexB = mBodyB.mIslandIndex
       mLocalCenterB = mBodyB.mSweep.localCenter
       mInvMassB = mBodyB.mInvMass
       mInvIB = mBodyB.mInvI
       let cB = data.positions.get(index:mIndexB).c
       let aB = data.positions.get(index:mIndexB).a
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let qB = B2Rot(angle:aB)
       let mass = mBodyB.mass
       let omega = float2 * b2PI * mFrequencyHz
       let d = float2 * mass * mDampingRatio * omega
       let k = mass * (omega * omega)
       let h = data.step.dt
       mGamma = h * (d + h * k)
       if (mGamma != 0.0) {
           mGamma = 1.0 / mGamma
       }
       mBeta = h * k * mGamma
       mrB = b2MulR2(qB, subtract(mLocalAnchorB.getOrThrow(), mLocalCenterB))
       var mK = B2Mat22()
       mK.ex.x = mInvMassB + mInvIB * mrB.y * mrB.y + mGamma
       mK.ex.y = -mInvIB * mrB.x * mrB.y
       mK.ey.x = mK.ex.y
       mK.ey.y = mInvMassB + mInvIB * mrB.x * mrB.x + mGamma
       mMass = mK.getInverse()
       mC = subtract(add(cB, mrB), mTargetA)
       mulEqual(a:mC, b:mBeta)
       wB *= multiFactor
       if (data.step.warmStarting) {
           mulEqual(a:mImpulse,b: data.step.dtRatio)
           addEqual(vB, multM(mImpulse, mInvMassB))
           wB += mInvIB * b2Cross(mrB, mImpulse)
       } else {
           mImpulse.setZero()
       }
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
   }
   
   public override func solveVelocityConstraints( data: B2SolverData): B2SolverData {
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let cdot = add(vB, b2Cross21(wB, mrB))
       var impulse = b2Mul22(mMass, minus(add(add(cdot, mC), multM(mImpulse, mGamma))))
       let oldImpulse = mImpulse
       addEqual(mImpulse, impulse)
       let maxImpulse = data.step.dt * mMaxForce
       if (mImpulse.lengthSquared() > maxImpulse * maxImpulse) {
           mulEqual(a:mImpulse,b: maxImpulse / mImpulse.length())
       }
       impulse = subtract(mImpulse, oldImpulse)
       addEqual(vB, multM(impulse, mInvMassB))
       wB += mInvIB * b2Cross(mrB, impulse)
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
   }
   
   public override func solvePositionConstraints( data: B2SolverData) : Bool {
       return true
   }
   var mLocalAnchorB: ?B2Vec2
   var mTargetA: B2Vec2
   var mFrequencyHz: Float64
   var mDampingRatio: Float64
   var mBeta: Float64
   var mImpulse: B2Vec2
   var mMaxForce: Float64
   var mGamma: Float64
   var mIndexA: Int64 = 0
   var mIndexB: Int64 = 0
   var mrB = B2Vec2()
   var mLocalCenterB = B2Vec2()
   var mInvMassB: Float64 = 0.0
   var mInvIB: Float64 = 0.0
   var mMass = B2Mat22()
   var mC = B2Vec2()
}

open class B2GearJointDef <: B2JointDef {
    public init() {
       super()
       joint1 = Option<B2Joint>.None
       joint2 = Option<B2Joint>.None
       ratio = 1.0
       `type` = B2JointType.GEARJOINT
    }
    var joint1: ?B2Joint = Option<B2Joint>.None
    var joint2: ?B2Joint = Option<B2Joint>.None
    var ratio: Float64 = 1.0
}

open class B2GearJoint <: B2Joint {
    public init(def: B2GearJointDef) {
       super(def)
       mJoint1 = def.joint1.getOrThrow()
       mJoint2 = def.joint2.getOrThrow()
       mTypeA = mJoint1.typeJoint
       mTypeB = mJoint2.typeJoint
       var coordinateA: Float64
       var coordinateB: Float64
       mBodyC = mJoint1.bodyA()
       mBodyA = mJoint1.bodyB()
       let xfA = mBodyA.mXF
       let aA = mBodyA.mSweep.a
       let xfC = mBodyC.getOrThrow().mXF
       let aC = mBodyC.getOrThrow().mSweep.a
       if (mTypeA.getValue() == B2JointType.REVOLUTEJOINT.getValue()) {
           let revolute = (def.joint1 as B2RevoluteJoint).getOrThrow()
           mLocalAnchorC = revolute.mLocalAnchorA
           mLocalAnchorA = revolute.mLocalAnchorB
           mReferenceAngleA = revolute.mReferenceAngle
           mLocalAxisC.setZero()
           coordinateA = aA - aC - mReferenceAngleA
       } else {
           let prismatic = (def.joint1 as B2PrismaticJoint).getOrThrow()
           mLocalAnchorC = prismatic.mLocalAnchorA
           mLocalAnchorA = prismatic.mLocalAnchorB
           mReferenceAngleA = prismatic.mReferenceAngle
           mLocalAxisC = prismatic.mLocalXAxisA
           let pC = mLocalAnchorC
           let pA = b2MulTR2(xfC.q, add(b2MulR2(xfA.q, mLocalAnchorA), subtract(xfA.p, xfC.p)))
           coordinateA = b2Dot22(subtract(pA, pC), mLocalAxisC)
       }
       mBodyD = mJoint2.bodyA()
       mBodyB = mJoint2.bodyB()
       let xfB = mBodyB.mXF
       let aB = mBodyB.mSweep.a
       let xfD = mBodyD.getOrThrow().mXF
       let aD = mBodyD.getOrThrow().mSweep.a
       if (mTypeB.getValue() == B2JointType.REVOLUTEJOINT.getValue()) {
           let revolute = (def.joint2 as B2RevoluteJoint).getOrThrow()
           mLocalAnchorD = revolute.mLocalAnchorA
           mLocalAnchorB = revolute.mLocalAnchorB
           mReferenceAngleB = revolute.mReferenceAngle
           mLocalAxisD.setZero()
           coordinateB = aB - aD - mReferenceAngleB
       } else {
           let prismatic = (def.joint2 as B2PrismaticJoint).getOrThrow()
           mLocalAnchorD = prismatic.mLocalAnchorA
           mLocalAnchorB = prismatic.mLocalAnchorB
           mReferenceAngleB = prismatic.mReferenceAngle
           mLocalAxisD = prismatic.mLocalXAxisA
           let pD = mLocalAnchorD
           let pB = b2MulTR2(xfD.q, add(b2MulR2(xfB.q, mLocalAnchorB), subtract(xfB.p, xfD.p)))
           coordinateB = b2Dot22(subtract(pB, pD), mLocalAxisD)
       }
       mRatio = def.ratio
       mConstant = coordinateA + mRatio * coordinateB
       mImpulse = 0.0
    }
    
    public prop anchorA: B2Vec2 {
        get() {
	    mBodyA.getWorldPoint(mLocalAnchorA)
	}
    }

    public prop anchorB: B2Vec2 {
        get() {
	    mBodyB.getWorldPoint(mLocalAnchorB)
	}
    }

    public override func getReactionForce( invdt: Float64) : B2Vec2 {
       let mP = multM(mJvAC, mImpulse)
       return multM(mP, invdt)
    }

    public override func getReactionTorque( invdt: Float64) : Float64 {
       let mL = mImpulse * mJwA
       return invdt * mL
    }
   
    public prop joint1: B2Joint {
        get() {
	    mJoint1
	}
    }
   
    public prop joint2: B2Joint {
        get() {
	     mJoint2
	}
    }
   
    public open func setRatio( ratio: Float64) {
       mRatio = ratio
    }

    public mut prop ratio: Float64 {
       get() {
           mRatio
       }
       set(newValue) {
           setRatio(newValue)
       }
    }
   
    public override func initVelocityConstraints( data: B2SolverData): B2SolverData {
       mIndexA = mBodyA.mIslandIndex
       mIndexB = mBodyB.mIslandIndex
       mIndexC = mBodyC.getOrThrow().mIslandIndex
       mIndexD = mBodyD.getOrThrow().mIslandIndex
       mLcA = mBodyA.mSweep.localCenter
       mLcB = mBodyB.mSweep.localCenter
       mLcC = mBodyC.getOrThrow().mSweep.localCenter
       mLcD = mBodyD.getOrThrow().mSweep.localCenter
       mmA = mBodyA.mInvMass
       mmB = mBodyB.mInvMass
       mmC = mBodyC.getOrThrow().mInvMass
       mmD = mBodyD.getOrThrow().mInvMass
       miA = mBodyA.mInvI
       miB = mBodyB.mInvI
       miC = mBodyC.getOrThrow().mInvI
       miD = mBodyD.getOrThrow().mInvI
       let aA = data.positions.get(index:mIndexA).a
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       let aB = data.positions.get(index:mIndexB).a
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let aC = data.positions.get(index:mIndexC).a
       var vC = data.velocities.get(index:mIndexC).v
       var wC = data.velocities.get(index:mIndexC).w
       let aD = data.positions.get(index:mIndexD).a
       var vD = data.velocities.get(index:mIndexD).v
       var wD = data.velocities.get(index:mIndexD).w
       let qA = B2Rot(angle:aA)
       let qB = B2Rot(angle:aB)
       let qC = B2Rot(angle:aC)
       let qD = B2Rot(angle:aD)
       mMass = 0.0
       if (mTypeA.getValue() == B2JointType.REVOLUTEJOINT.getValue()) {
           mJvAC.setZero()
           mJwA = 1.0
           mJwC = 1.0
           mMass += miA + miC
       } else {
           let u = b2MulR2(qC, mLocalAxisC)
           let rC = b2MulR2(qC, subtract(mLocalAnchorC, mLcC))
           let rA = b2MulR2(qA, subtract(mLocalAnchorA, mLcA))
           mJvAC = u
           mJwC = b2Cross(rC, u)
           mJwA = b2Cross(rA, u)
           mMass += mmC + mmA + miC * mJwC * mJwC + miA * mJwA * mJwA
       }
       if (mTypeB.getValue() == B2JointType.REVOLUTEJOINT.getValue()) {
           mJvBD.setZero()
           mJwB = mRatio
           mJwD = mRatio
           mMass += mRatio * mRatio * (miB + miD)
       } else {
           let u = b2MulR2(qD, mLocalAxisD)
           let rD = b2MulR2(qD, subtract(mLocalAnchorD, mLcD))
           let rB = b2MulR2(qB, subtract(mLocalAnchorB, mLcB))
           mJvBD = multM(u, mRatio)
           mJwD = mRatio * b2Cross(rD, u)
           mJwB = mRatio * b2Cross(rB, u)
           let mass1 = mRatio * mRatio * (mmD + mmB)
           let mass2 = miD * mJwD * mJwD + miB * mJwB * mJwB
           let mass = mass1 + mass2
           mMass += mass
       }
       
       if(mMass > 0.0){
           mMass = 1.0 / mMass
       } else{
           mMass = 0.0
       }
       if (data.step.warmStarting) {
           addEqual(vA, multM(mJvAC, (mmA * mImpulse)))
           wA += miA * mImpulse * mJwA
           addEqual(vB, multM(mJvBD, (mmB * mImpulse)))
           wB += miB * mImpulse * mJwB
           subtractEqual(vC, multM(mJvAC, (mmC * mImpulse)))
           wC -= miC * mImpulse * mJwC
           subtractEqual(vD, multM(mJvBD, (mmD * mImpulse)))
           wD -= miD * mImpulse * mJwD
       } else {
           mImpulse = 0.0
       }
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       data.velocities.get(index:mIndexC).v = vC
       data.velocities.get(index:mIndexC).w = wC
       data.velocities.get(index:mIndexD).v = vD
       data.velocities.get(index:mIndexD).w = wD
       return data
    }
   
    public override func solveVelocityConstraints( data: B2SolverData): B2SolverData {
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       var vC = data.velocities.get(index:mIndexC).v
       var wC = data.velocities.get(index:mIndexC).w
       var vD = data.velocities.get(index:mIndexD).v
       var wD = data.velocities.get(index:mIndexD).w
       var cdot = b2Dot22(mJvAC, subtract(vA, vC)) + b2Dot22(mJvBD, subtract(vB, vD))
       cdot += (mJwA * wA - mJwC * wC) + (mJwB * wB - mJwD * wD)
       let impulse = -mMass * cdot
       mImpulse += impulse
       addEqual(vA, multM(mJvAC, mmA * impulse))
       wA += miA * impulse * mJwA
       addEqual(vB, multM(mJvBD, mmB * impulse))
       wB += miB * impulse * mJwB
       subtractEqual(vC, multM(mJvAC, mmC * impulse))
       wC -= miC * impulse * mJwC
       subtractEqual(vD, multM(mJvBD, mmD * impulse))
       wD -= miD * impulse * mJwD
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       data.velocities.get(index:mIndexC).v = vC
       data.velocities.get(index:mIndexC).w = wC
       data.velocities.get(index:mIndexD).v = vD
       data.velocities.get(index:mIndexD).w = wD
       return data
    }
   
    public override func solvePositionConstraints( data: B2SolverData) : Bool {
        var cA = data.positions.get(index:mIndexA).c
        var aA = data.positions.get(index:mIndexA).a
        var cB = data.positions.get(index:mIndexB).c
        var aB = data.positions.get(index:mIndexB).a
        var cC = data.positions.get(index:mIndexC).c
        var aC = data.positions.get(index:mIndexC).a
        var cD = data.positions.get(index:mIndexD).c
        var aD = data.positions.get(index:mIndexD).a
        let qA = B2Rot(angle:aA)
        let qB = B2Rot(angle:aB)
        let qC = B2Rot(angle:aC)
        let qD = B2Rot(angle:aD)
        let linearError: Float64 = 0.0
        var coordinateA: Float64 = 0.0
        var coordinateB: Float64 = 0.0
        var mJvAC = B2Vec2()
        var mJvBD = B2Vec2()
        var mJwA: Float64 = 0.0
        var mJwB: Float64 = 0.0
        var mJwC: Float64 = 0.0
        var mJwD: Float64 = 0.0
        var mass: Float64 = 0.0
        if (mTypeA.getValue() == B2JointType.REVOLUTEJOINT.getValue()) {
           mJvAC.setZero()
           mJwA = 1.0
           mJwC = 1.0
           mass += miA + miC
           coordinateA = aA - aC - mReferenceAngleA
        } else {
           let u = b2MulR2(qC, mLocalAxisC)
           let rC = b2MulR2(qC, subtract(mLocalAnchorC, mLcC))
           let rA = b2MulR2(qA, subtract(mLocalAnchorA, mLcA))
           mJvAC = u
           mJwC = b2Cross(rC, u)
           mJwA = b2Cross(rA, u)
           mass += mmC + mmA + miC * mJwC * mJwC + miA * mJwA * mJwA
           let pC = subtract(mLocalAnchorC, mLcC)
           let pA = b2MulTR2(qC, add(rA, subtract(cA, cC)))
           coordinateA = b2Dot22(subtract(pA, pC), mLocalAxisC)
        }
        if (mTypeB.getValue() == B2JointType.REVOLUTEJOINT.getValue()) {
           mJvBD.setZero()
           mJwB = mRatio
           mJwD = mRatio
           mass += mRatio * mRatio * (miB + miD)
           coordinateB = aB - aD - mReferenceAngleB
        } else {
           let u = b2MulR2(qD, mLocalAxisD)
           let rD = b2MulR2(qD, subtract(mLocalAnchorD, mLcD))
           let rB = b2MulR2(qB, subtract(mLocalAnchorB, mLcB))
           mJvBD = multM(u, mRatio)
           mJwD = mRatio * b2Cross(rD, u)
           mJwB = mRatio * b2Cross(rB, u)
           mass += mRatio * mRatio * (mmD + mmB) + miD * mJwD * mJwD + miB * mJwB * mJwB
           let pD = subtract(mLocalAnchorD, mLcD)
           let pB = b2MulTR2(qD, add(rB, subtract(cB, cD)))
           coordinateB = b2Dot22(subtract(pB, pD), mLocalAxisD)
        }
        let mC = (coordinateA + mRatio * coordinateB) - mConstant
        var impulse: Float64 = 0.0
        if (mass > 0.0) {
           impulse = -mC / mass
        }
        addEqual(cA, multM(mJvAC, mmA * impulse))
        aA += miA * impulse * mJwA
        addEqual(cB, multM(mJvBD, mmB * impulse))
        aB += miB * impulse * mJwB
        subtractEqual(cC, multM(mJvAC, mmC * impulse))
        aC -= miC * impulse * mJwC
        subtractEqual(cD, multM(mJvBD, mmD * impulse))
        aD -= miD * impulse * mJwD
        data.positions.get(index:mIndexA).c = cA
        data.positions.get(index:mIndexA).a = aA
        data.positions.get(index:mIndexB).c = cB
        data.positions.get(index:mIndexB).a = aB
        data.positions.get(index:mIndexC).c = cC
        data.positions.get(index:mIndexC).a = aC
        data.positions.get(index:mIndexD).c = cD
        data.positions.get(index:mIndexD).a = aD
        return linearError < b2LinearSlop
    }
    var mJoint1: B2Joint 
    var mJoint2: B2Joint 
    var mTypeA: B2JointType 
    var mTypeB: B2JointType 
    var mBodyC: ?B2Body = None
    var mBodyD: ?B2Body= None
    var mLocalAnchorA = B2Vec2()
    var mLocalAnchorB = B2Vec2()
    var mLocalAnchorC = B2Vec2()
    var mLocalAnchorD = B2Vec2()
    var mLocalAxisC = B2Vec2()
    var mLocalAxisD = B2Vec2()
    var mReferenceAngleA: Float64 = 0.0
    var mReferenceAngleB: Float64 = 0.0
    var mConstant: Float64 = 0.0
    var mRatio: Float64 = 0.0
    var mImpulse: Float64 = 0.0
    var mIndexA: Int64 = 0
    var mIndexB: Int64 = 0
    var mIndexC: Int64 = 0
    var mIndexD: Int64 = 0
    var mLcA = B2Vec2()
    var mLcB = B2Vec2()
    var mLcC = B2Vec2()
    var mLcD = B2Vec2()
    var mmA: Float64 = 0.0
    var mmB: Float64 = 0.0
    var mmC: Float64 = 0.0
    var mmD: Float64 = 0.0
    var miA: Float64 = 0.0
    var miB: Float64 = 0.0
    var miC: Float64 = 0.0
    var miD: Float64 = 0.0
    var mJvAC = B2Vec2()
    var mJvBD = B2Vec2()
    var mJwA: Float64 = 0.0
    var mJwB: Float64 = 0.0
    var mJwC: Float64 = 0.0
    var mJwD: Float64 = 0.0
    var mMass: Float64 = 0.0
}

open class B2FrictionJointDef <: B2JointDef {
    init() {
       super()
       var thislocalAnchorA = B2Vec2()
       var thislocalAnchorB = B2Vec2()
       var thismaxForce = 0.0
       var thismaxTorque = 0.0
       this.`type` = B2JointType.FRICTIONJOINT
   }
   
   public open func initialize( bA: B2Body,  bB: B2Body,  anchor: B2Vec2) {
       var bodyA = bA
       var bodyB = bB
       var localAnchorA = bodyA.getLocalPoint(anchor)
       var localAnchorB = bodyB.getLocalPoint(anchor)
   }
   
   var localAnchorA: B2Vec2 = B2Vec2()
   var localAnchorB: B2Vec2= B2Vec2()
   var maxForce: Float64= 0.0
   var maxTorque: Float64= 0.0
}

open class B2FrictionJoint <: B2Joint {
   var mLocalAnchorA: B2Vec2
   var mLocalAnchorB: B2Vec2
   var mLinearImpulse: B2Vec2
   var mAngularImpulse: Float64
   var mMaxForce: Float64
   var mMaxTorque: Float64
   var mIndexA: Int64 = 0
   var mIndexB: Int64 = 0
   var mrA = B2Vec2()
   var mrB = B2Vec2()
   var mLocalCenterA = B2Vec2()
   var mLocalCenterB = B2Vec2()
   var mInvMassA: Float64 = 0.0
   var mInvMassB: Float64 = 0.0
   var mInvIA: Float64 = 0.0
   var mInvIB: Float64 = 0.0
   var mLinearMass = B2Mat22()
   var mAngularMass: Float64 = 0.0
   public prop anchorA: B2Vec2 {
        get() {
	    mBodyA.getWorldPoint(mLocalAnchorA)
	}
   }
   
   public prop anchorB: B2Vec2 {
       get() {
           mBodyB.getWorldPoint(mLocalAnchorB)
       }
   }
   
   public override func getReactionForce( invdt: Float64) : B2Vec2 {
       return multM(mLinearImpulse, invdt)
   }
   
   public override func getReactionTorque( invdt: Float64) : Float64 {
       return invdt * mAngularImpulse
   }
   
   public prop localAnchorA: B2Vec2 {
       get() {
           mLocalAnchorA
       }
   }
   
   public prop localAnchorB: B2Vec2 {
       get() {
            mLocalAnchorB
       }
   }
   
   public func setMaxForce( force: Float64) {
       mMaxForce = force
   }
   
   public prop maxForce: Float64 {
       get() {
            mMaxForce
       }
   }
   
   public open func setMaxTorque( torque: Float64) {
       mMaxTorque = torque
   }
   
    public open func maxTorque(): Float64 {
        return this.mMaxTorque
    }

   
   init( def: B2FrictionJointDef) {
       super(def)
       mLocalAnchorA = def.localAnchorA
       mLocalAnchorB = def.localAnchorB
       mLinearImpulse = B2Vec2(x0:0.0,y0:0.0)
       mAngularImpulse = 0.0
       mMaxForce = def.maxForce
       mMaxTorque = def.maxTorque
   }
   
   public override func initVelocityConstraints( data: B2SolverData): B2SolverData {
       mIndexA = mBodyA.mIslandIndex
       mIndexB = mBodyB.mIslandIndex
       mLocalCenterA = mBodyA.mSweep.localCenter
       mLocalCenterB = mBodyB.mSweep.localCenter
       mInvMassA = mBodyA.mInvMass
       mInvMassB = mBodyB.mInvMass
       mInvIA = mBodyA.mInvI
       mInvIB = mBodyB.mInvI
       let aA = data.positions.get(index:mIndexA).a
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       let aB = data.positions.get(index:mIndexB).a
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let qA = B2Rot(angle:aA)
       let qB = B2Rot(angle:aB)
       mrA = b2MulR2(qA, subtract(mLocalAnchorA, mLocalCenterA))
       mrB = b2MulR2(qB, subtract(mLocalAnchorB, mLocalCenterB))
       let mA = mInvMassA
       let mB = mInvMassB
       let iA = mInvIA
       let iB = mInvIB
       let mK = B2Mat22()
       mK.ex.x = mA + mB + iA * mrA.y * mrA.y + iB * mrB.y * mrB.y
       mK.ex.y = -iA * mrA.x * mrA.y - iB * mrB.x * mrB.y
       mK.ey.x = mK.ex.y
       mK.ey.y = mA + mB + iA * mrA.x * mrA.x + iB * mrB.x * mrB.x
       mLinearMass = mK.getInverse()
       mAngularMass = iA + iB
       if (mAngularMass > 0.0) {
           mAngularMass = 1.0 / mAngularMass
       }
       if (data.step.warmStarting) {
           mulEqual(a:mLinearImpulse, b:data.step.dtRatio)
           mAngularImpulse *= data.step.dtRatio
           let mP = B2Vec2(x0:mLinearImpulse.x,y0: mLinearImpulse.y)
           subtractEqual(vA, multM(mP, mA))
           wA -= iA * (b2Cross(mrA, mP) + mAngularImpulse)
           addEqual(vB, multM(mP, mB))
           wB += iB * (b2Cross(mrB, mP) + mAngularImpulse)
       } else {
           mLinearImpulse.setZero()
           mAngularImpulse = 0.0
       }
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
   }
   
   public override func solveVelocityConstraints( data: B2SolverData): B2SolverData {
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let mA = mInvMassA
       let mB = mInvMassB
       let iA = mInvIA
       let iB = mInvIB
       let h = data.step.dt
       let cdot = wB - wA
       var impulse = -this.mAngularMass * cdot
       let oldImpulse = this.mAngularImpulse
       let maxImpulse = h * this.mMaxTorque
       this.mAngularImpulse = b2ClampF(this.mAngularImpulse + impulse, -maxImpulse, maxImpulse)
       impulse = this.mAngularImpulse - oldImpulse
       wA -= iA * impulse
       wB += iB * impulse
       let locCdot = subtract(subtract(add(vB, b2Cross21(wB, this.mrB)), vA), b2Cross21(wA, this.mrA))
       var locImpulse = minus(b2Mul22(this.mLinearMass, locCdot))
       let locOldImpulse = this.mLinearImpulse
       addEqual(this.mLinearImpulse, locImpulse)
       let locMaxImpulse = h * this.mMaxForce
       if (this.mLinearImpulse.lengthSquared() > locMaxImpulse * locMaxImpulse) {
           this.mLinearImpulse.normalize()
           mulEqual(a:this.mLinearImpulse, b:locMaxImpulse)
       }
       locImpulse = subtract(this.mLinearImpulse,locOldImpulse)
       subtractEqual(vA, multM(locImpulse, mA))
       wA -= iA * b2Cross(this.mrA, locImpulse)
       addEqual(vB, multM(locImpulse, mB))
       wB += iB * b2Cross(this.mrB, locImpulse)
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
   }
   
   public override func solvePositionConstraints( data: B2SolverData) :Bool {
       return true
   }
}

open class B2DistanceJointDef <: B2JointDef {
   init(bodyA: ?B2Body, bodyB: ?B2Body, anchorA: ?B2Vec2, anchorB: ?B2Vec2) {
       super()
       if ((bodyA.isSome() && bodyB.isSome() && anchorA.isSome() && anchorB.isSome())) {
           localAnchorA = bodyA.getOrThrow().getLocalPoint(anchorA.getOrThrow())
           localAnchorB = bodyB.getOrThrow().getLocalPoint(anchorB.getOrThrow())
           let d = subtract(anchorB.getOrThrow(), anchorA.getOrThrow())
           length = d.length()
       } else {
           localAnchorA = B2Vec2(x0:0.0,y0: 0.0)
           localAnchorB = B2Vec2(x0:0.0,y0: 0.0)
           length = 1.0
           frequencyHz = 0.0
           dampingRatio = 0.0
           `type` = B2JointType.DISTANCEJOINT
       }
   }
   
   public open func initialize( bA: B2Body,  bB: B2Body,  anchorA: B2Vec2,  anchorB: B2Vec2) {
       bodyA = bA
       bodyB = bB
       localAnchorA = bodyA.getOrThrow().getLocalPoint(anchorA)
       localAnchorB = bodyB.getOrThrow().getLocalPoint(anchorB)
       let d = subtract(anchorB, anchorA)
       length = d.length()
   }
   
   var localAnchorA = B2Vec2()
   var localAnchorB = B2Vec2()
   var length: Float64 = 1.0
   var frequencyHz: Float64 = 0.0
   var dampingRatio: Float64 = 0.0
}

open class B2DistanceJoint <: B2Joint {
    var mFrequencyHz: Float64
    var mDampingRatio: Float64
    var mBias: Float64
    var mLocalAnchorA: B2Vec2
    var mLocalAnchorB: B2Vec2
    var mGamma: Float64
    var mImpulse: Float64
    var mLength: Float64
    var mIndexA: Int64 = 0
    var mIndexB: Int64 = 0
    var mu = B2Vec2()
    var mrA = B2Vec2()
    var mrB = B2Vec2()
    var mLocalCenterA = B2Vec2()
    var mLocalCenterB = B2Vec2()
    var mInvMassA : Float64 = 0.0
    var mInvMassB : Float64 = 0.0
    var mInvIA : Float64 = 0.0
    var mInvIB: Float64 = 0.0
    var mMass: Float64 = 0.0
    public prop anchorA: B2Vec2 {
        get() {
	    mBodyA.getWorldPoint(mLocalAnchorA)
	}
    }

    public prop anchorB: B2Vec2 {
        get() {
	     mBodyB.getWorldPoint(mLocalAnchorB)
	}
    }

    public override func getReactionForce( invdt: Float64) : B2Vec2 {
       let mF = multM(mu, (invdt * mImpulse))
       return mF
    }

    public override func getReactionTorque( invdt: Float64) : Float64 {
       return 0.0
    }
    
    public prop localAnchorA: B2Vec2 {
        get() {
	    mLocalAnchorA
	}
    }
    
    public prop localAnchorB: B2Vec2 {
        get() {
	    mLocalAnchorB
	}
    }
   
    public open func setLength( length: Float64) {
       mLength = length
    }

    public prop length: Float64 {
        get() {
	    mLength
	}
    }

    public open func setFrequency( hz: Float64) {
       mFrequencyHz = hz
    }

    public prop frequency: Float64 {
        get() {
	     mFrequencyHz
	}
    }

    public open func setDampingRatio( ratio: Float64) {
       mDampingRatio = ratio
    }

    public prop dampingRatio: Float64 {
        get() {
	    mDampingRatio
	}
    }
   
    init( def: B2DistanceJointDef) {
        super(def)
       mLocalAnchorA = def.localAnchorA
       mLocalAnchorB = def.localAnchorB
       mLength = def.length
       mFrequencyHz = def.frequencyHz
       mDampingRatio = def.dampingRatio
       mImpulse = 0.0
       mGamma = 0.0
       mBias = 0.0
       
    }
   
    public override func initVelocityConstraints( data: B2SolverData): B2SolverData {
       mIndexA = mBodyA.mIslandIndex
       mIndexB = mBodyB.mIslandIndex
       mLocalCenterA = mBodyA.mSweep.localCenter
       mLocalCenterB = mBodyB.mSweep.localCenter
       mInvMassA = mBodyA.mInvMass
       mInvMassB = mBodyB.mInvMass
       mInvIA = mBodyA.mInvI
       mInvIB = mBodyB.mInvI
       let cA = data.positions.get(index:mIndexA).c
       let aA = data.positions.get(index:mIndexA).a
       var vA = data.velocities.get(index:mIndexA).v
       var wA = data.velocities.get(index:mIndexA).w
       let cB = data.positions.get(index:mIndexB).c
       let aB = data.positions.get(index:mIndexB).a
       var vB = data.velocities.get(index:mIndexB).v
       var wB = data.velocities.get(index:mIndexB).w
       let qA = B2Rot(angle:aA)
       let qB = B2Rot(angle:aB)
       mrA = b2MulR2(qA, subtract(mLocalAnchorA, mLocalCenterA))
       mrB = b2MulR2(qB, subtract(mLocalAnchorB, mLocalCenterB))
       mu = subtract(subtract(add(cB, mrB), cA), mrA)
       let length = mu.length()
       if (length > b2LinearSlop) {
           mulEqual(a:mu, b:1.0 / length)
       } else {
           mu.set(0.0, 0.0)
       }
       let crAu = b2Cross(mrA, mu)
       let crBu = b2Cross(mrB, mu)
       var invMass = mInvMassA + mInvIA * crAu * crAu + mInvMassB + mInvIB * crBu * crBu

       if (invMass != 0.0){
           mMass = 1.0 / invMass
       } else{
           mMass = 0.0
       }
       if (mFrequencyHz > 0.0) {
           let mC = length - mLength
           let omega = float2 * b2PI * mFrequencyHz
           let d = float2 * mMass * mDampingRatio * omega
           let k = mMass * omega * omega
           let h = data.step.dt
           mGamma = h * (d + h * k)
           if (mGamma != 0.0){
               mGamma = 1.0 / mGamma
           } else{
               mGamma = 0.0
           }
           mBias = mC * h * k * mGamma
           invMass += mGamma

           if (invMass != 0.0){
               mGamma = 1.0 / invMass
           } else{
               mGamma = 0.0
           }
       } else {
           mGamma = 0.0
           mBias = 0.0
       }
       if (data.step.warmStarting) {
           mImpulse *= data.step.dtRatio
           let mP = multM(mu, mImpulse)
           subtractEqual(vA, multM(mP, mInvMassA))
           wA -= mInvIA * b2Cross(mrA, mP)
           addEqual(vB, multM(mP, mInvMassB))
           wB += mInvIB * b2Cross(mrB, mP)
       } else {
           mImpulse = 0.0
       }
       data.velocities.get(index:mIndexA).v = vA
       data.velocities.get(index:mIndexA).w = wA
       data.velocities.get(index:mIndexB).v = vB
       data.velocities.get(index:mIndexB).w = wB
       return data
    }
   
    public override func solveVelocityConstraints( data: B2SolverData): B2SolverData {
        var vA = data.velocities.get(index:mIndexA).v
        var wA = data.velocities.get(index:mIndexA).w
        var vB = data.velocities.get(index:mIndexB).v
        var wB = data.velocities.get(index:mIndexB).w
        let vpA = add(vA, b2Cross21(wA, mrA))
        let vpB = add(vB, b2Cross21(wB, mrB))
        let cdot = b2Dot22(mu, subtract(vpB, vpA))
        let impulse = -mMass * (cdot + mBias + mGamma * mImpulse)
        mImpulse += impulse
        let mP = multM(mu, impulse)
        subtractEqual(vA, multM(mP, mInvMassA))
        wA -= mInvIA * b2Cross(mrA, mP)
        addEqual(vB, multM(mP, mInvMassB))
        wB += mInvIB * b2Cross(mrB, mP)
        data.velocities.get(index:mIndexA).v = vA
        data.velocities.get(index:mIndexA).w = wA
        data.velocities.get(index:mIndexB).v = vB
        data.velocities.get(index:mIndexB).w = wB
        return data
    }
   
   public override func solvePositionConstraints( data:  B2SolverData) : Bool {
       if (mFrequencyHz > 0.0) {
           return true
       }
       var cA = data.positions.get(index:mIndexA).c
       var aA = data.positions.get(index:mIndexA).a
       var cB = data.positions.get(index:mIndexB).c
       var aB = data.positions.get(index:mIndexB).a
       let qA = B2Rot(angle:aA)
       let qB = B2Rot(angle:aB)
       let rA = b2MulR2(qA, subtract(mLocalAnchorA, mLocalCenterA))
       let rB = b2MulR2(qB, subtract(mLocalAnchorB, mLocalCenterB))
       var u = subtract(subtract(add(cB, rB), cA), rA)
       let length = u.normalize()
       var mC = length - mLength
       mC = b2ClampF(mC, -b2MaxLinearCorrection, b2MaxLinearCorrection)
       let impulse = -mMass * mC
       let mP = multM(u, impulse)
       subtractEqual(cA, multM(mP, mInvMassA))
       aA -= mInvIA * b2Cross(rA, mP)
       addEqual(cB, multM(mP, mInvMassB))
       aB += mInvIB * b2Cross(rB, mP)
       data.positions.get(index:mIndexA).c = cA
       data.positions.get(index:mIndexA).a = aA
       data.positions.get(index:mIndexB).c = cB
       data.positions.get(index:mIndexB).a = aB
       return abs(mC) < b2LinearSlop
   }
}
