/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*
import std.core.*
import std.convert.*
import std.convert.*

public func b2MixFriction( friction1 : Float64,  friction2 : Float64) : Float64 {
    return sqrt(friction1 * friction2)
}

public func b2MixRestitution( restitution1 : Float64,  restitution2 : Float64) : Float64 {
    if (restitution1 > restitution2){
        return restitution1
    }
    else{
        return restitution2
    }
}

type B2ContactCreateFcn = ( fixtureA: B2Fixture,  indexA: Int64,  fixtureB: B2Fixture,  indexB: Int64) -> ?B2Contact
type B2ContactDestroyFcn = ( contact: B2Contact) -> Unit

public class B2ContactRegister {
    var createFcn: ?B2ContactCreateFcn = None
    var destroyFcn: ?B2ContactDestroyFcn = None
    var primary: Bool = false
}

class B2ContactRegisters {
    let rows: B2ShapeType
    let columns: B2ShapeType
    var grid : ArrayList<B2ContactRegister> = ArrayList<B2ContactRegister>()
    init( rows: B2ShapeType,  columns: B2ShapeType) {
        this.rows = rows
        this.columns = columns
       for (i in 0..rows.getValue() * columns.getValue()) {
            this.grid.add(B2ContactRegister())
        }
    }
    
    func getItem( row: B2ShapeType,  column: B2ShapeType) : B2ContactRegister {
        return grid[row.getValue() * columns.getValue() + column.getValue()]
    }
    
    func setItem( row: B2ShapeType,  column: B2ShapeType, value: B2ContactRegister) {
        grid[(row.getValue() * columns.getValue()) + column.getValue()] = value
    }
}

class B2ContactEdge {
    var other: ?B2Body = Option<B2Body>.None
    var contact: B2Contact
    var prev: ?B2ContactEdge = Option<B2ContactEdge>.None
    var next: ?B2ContactEdge = Option<B2ContactEdge>.None
    init( contact: B2Contact) {
        this.contact = contact
    }
}

open class B2Contact {
    var mFlags: Int64 = 0
    var mPrev: ?B2Contact = None
    var mNext: ?B2Contact = None
    var mNodeA: ?B2ContactEdge
    var mNodeB: ?B2ContactEdge
    var mFixtureA: ?B2Fixture
    var mFixtureB: ?B2Fixture
    var mIndexA: Int64 = 0
    var mIndexB: Int64 = 0
    var mManifold = B2Manifold()
    var mToiCount: Int64 = 0
    var mToi: Float64 = 0.0
    var mFriction: Float64 = 0.0
    var mRestitution: Float64 = 0.0
    var mTangentSpeed: Float64 = 0.0
    public mut prop  manifold: B2Manifold { 
        get() {
            mManifold
        }
	    set(v) {
	    }
    }

    public prop  worldManifold: B2WorldManifold  { 
        get() {
            let bodyA = mFixtureA.getOrThrow().body()
            let bodyB = mFixtureB.getOrThrow().body()
            let shapeA = mFixtureA.getOrThrow().shape
            let shapeB = mFixtureB.getOrThrow().shape
            let worldManifold = B2WorldManifold()
            worldManifold.initialize(mManifold, bodyA.transform(), shapeA.getOrThrow().mRadius, bodyB.transform(), shapeB.getOrThrow().mRadius)
            worldManifold
	    }
    }
    
    public prop  isTouching : Bool   { 
        get(){
             (mFlags & FlagContacts.TOUCHINGFLAG.getValue()) == FlagContacts.TOUCHINGFLAG.getValue()
        }
        
    }
    public open func setEnabled( flag: Bool) {
        if (flag) {
            mFlags |= FlagContacts.ENABLEDFLAG.getValue()
        } else {
            mFlags &= !FlagContacts.ENABLEDFLAG.getValue()
        }
    }
    
    public prop isEnabled: Bool   { 
        get() {
            (mFlags & FlagContacts.ENABLEDFLAG.getValue()) == FlagContacts.ENABLEDFLAG.getValue()
	    }
    }
    
    public open func getNext() : ?B2Contact {
        return mNext
    }
    
    public prop fixtureA: B2Fixture  { 
        get() {
            mFixtureA.getOrThrow()
	    }
    }
    
    public prop childIndexA: Int64  { 
        get() {
            mIndexA
	    }
    }
    
    public prop fixtureB: B2Fixture { 
        get() {
	        mFixtureB.getOrThrow()
	    }
    }
    
    public prop childIndexB: Int64 { 
        get() {
	        mIndexB
	    }
    }
    
    
    public mut prop friction: Float64{
        get(){
            mFriction
        }
        set(v){
            mFriction = v
        }
    }
    
    public open func resetFriction() {
        mFriction = b2MixFriction(mFixtureA.getOrThrow().mFriction, mFixtureB.getOrThrow().mFriction)
    }
    

    public mut prop restitution: Float64{
        get(){
            mRestitution
        }
        set(v){
            mRestitution = v
        }
    }
    
    public open func resetRestitution() {
        mRestitution = b2MixRestitution(mFixtureA.getOrThrow().mRestitution, mFixtureB.getOrThrow().mRestitution)
    }
    
    public open func setTangentSpeed( speed: Float64) {
        mTangentSpeed = speed
    }
    
    public prop tangentSpeed: Float64 {
        get() {
	        mTangentSpeed
	    }
    }
    
    public open func evaluate( manifold: B2Manifold,  xfA: B2Transform,  xfB: B2Transform) {
        print("must override")
    }
    
    func flagForFiltering() {
        print("must override")
    }
    
    public static func addType( createFcn: B2ContactCreateFcn,  destroyFcn: B2ContactDestroyFcn,  type1: B2ShapeType,  type2: B2ShapeType) {
        StaticVars.sRegisters.getItem(type1, type2).createFcn = createFcn
        StaticVars.sRegisters.getItem(type1, type2).destroyFcn = destroyFcn
        StaticVars.sRegisters.getItem(type1, type2).primary = true
        if ((type1.getValue() != type2.getValue())) {
            StaticVars.sRegisters.getItem(type2, type1).createFcn = createFcn
            StaticVars.sRegisters.getItem(type2, type1).destroyFcn = destroyFcn
            StaticVars.sRegisters.getItem(type2, type1).primary = false
        }
    }
    
    public static func initializeRegisters() {
        addType(B2PolygonContact.create, B2PolygonContact.destroy, B2ShapeType.POLYGON, B2ShapeType.POLYGON)
    }
    
    public static func create( fixtureA: B2Fixture,  indexA: Int64,  fixtureB: B2Fixture,  indexB: Int64): ?B2Contact {
        
        if ((StaticVars.sInitialized == false)) {
            initializeRegisters()
            StaticVars.sInitialized = true
        }
        let type1 = fixtureA.fixtureType
        let type2 = fixtureB.fixtureType
        let createFcn = StaticVars.sRegisters.getItem(type1, type2).createFcn
        if ((createFcn.isSome())) {
            if ((StaticVars.sRegisters.getItem(type1, type2).primary)) {
                return createFcn.getOrThrow()(fixtureA, indexA, fixtureB, indexB)
            } else {
                return createFcn.getOrThrow()(fixtureB, indexB, fixtureA, indexA)
            }
        } else {
            return None
        }
    }
    
    public static func destroy( contact: B2Contact) {
        let fixtureA = contact.mFixtureA
        let fixtureB = contact.mFixtureB
        if ((contact.mManifold.pointCount > 0 && fixtureA.getOrThrow().isSensor == false && fixtureB.getOrThrow().isSensor == false)) {
            fixtureA.getOrThrow().body().setAwake(true)
            fixtureB.getOrThrow().body().setAwake(true)
        }
        let typeA = fixtureA.getOrThrow().fixtureType
        let typeB = fixtureB.getOrThrow().fixtureType
        let destroyFcn = StaticVars.sRegisters.getItem(typeA, typeB).destroyFcn
        destroyFcn.getOrThrow()(contact)
    }
    
    init( fixtureA: B2Fixture,  indexA: Int64,  fixtureB: B2Fixture,  indexB: Int64) {
        mFlags = FlagContacts.ENABLEDFLAG.getValue()
        mFixtureA = fixtureA
        mFixtureB = fixtureB
        mIndexA = indexA
        mIndexB = indexB
        mManifold.points.clear()
        mPrev = None
        mNext = None
        mNodeA = None
        // mNodeA.getOrThrow().prev = None
        // mNodeA.getOrThrow().next = None
        // mNodeA.getOrThrow().other = None
        mNodeB = None
        // mNodeB.getOrThrow().prev = None
        // mNodeB.getOrThrow().next = None
        // mNodeB.getOrThrow().other = None
        mToiCount = 0
        mFriction = b2MixFriction(mFixtureA.getOrThrow().mFriction, mFixtureB.getOrThrow().mFriction)
        mRestitution = b2MixRestitution(mFixtureA.getOrThrow().mRestitution, mFixtureB.getOrThrow().mRestitution)
        mTangentSpeed = 0.0
    }
    func setup(){
        mNodeA = B2ContactEdge(this)
        mNodeA.getOrThrow().prev = None
        mNodeA.getOrThrow().next = None
        mNodeA.getOrThrow().other = None
        mNodeB = B2ContactEdge(this)
        mNodeB.getOrThrow().prev = None
        mNodeB.getOrThrow().next = None
        mNodeB.getOrThrow().other = None
    }
    func update( listener: ?B2ContactListener) {
        let oldManifold = B2Manifold(copyFrom:mManifold)
        mFlags |= FlagContacts.ENABLEDFLAG.getValue()
        var touching = false
        let wasTouching = (mFlags & FlagContacts.TOUCHINGFLAG.getValue()) == FlagContacts.TOUCHINGFLAG.getValue()
        let sensorA = mFixtureA.getOrThrow().isSensor
        let sensorB = mFixtureB.getOrThrow().isSensor
        let sensor = sensorA || sensorB
        let bodyA = mFixtureA.getOrThrow().body()
        let bodyB = mFixtureB.getOrThrow().body()
        let xfA = bodyA.transform()
        let xfB = bodyB.transform()
        if ((sensor)) {
            let shapeA = mFixtureA.getOrThrow().shape
            let shapeB = mFixtureB.getOrThrow().shape
            touching = b2TestOverlap(shapeA.getOrThrow(), shapeB.getOrThrow(), xfA, xfB)
            mManifold.points.clear()
        } else {
            evaluate(mManifold, xfA, xfB)
            touching = mManifold.pointCount > 0
            for (i in 0 .. mManifold.pointCount) {
                let mp2 = mManifold.points[i]
                mp2.normalImpulse = 0.0
                mp2.tangentImpulse = 0.0
                let id2 = mp2.id
                for (j in 0 .. oldManifold.pointCount) {
                    let mp1 = oldManifold.points[j]
                    if ((equalEqual(mp1.id, id2))) {
                        mp2.normalImpulse = mp1.normalImpulse
                        mp2.tangentImpulse = mp1.tangentImpulse
                        break
                    }
                }
            }
            if ((touching != wasTouching)) {
                bodyA.setAwake(true)
                bodyB.setAwake(true)
            }
        }
    }
}

class StaticVars {
    static var sRegisters = B2ContactRegisters(B2ShapeType.TYPECOUNT, B2ShapeType.TYPECOUNT)
    static var sInitialized : Bool = false
}

public let hex0001 = 0x0001
public let hex0002 = 0x0002
public let hex0004 = 0x0004
public let hex0008 = 0x0008
public let hex0010 = 0x0010
public let hex0020 = 0x0020

public enum FlagContacts {
    |ISLANDFLAG
    |TOUCHINGFLAG
    |ENABLEDFLAG
    |FILTERFLAG
    |BULLETHITFLAG
    |TOIFLAG
    public func getValue(){
        match(this) {
            case ISLANDFLAG => return hex0001
            case TOUCHINGFLAG => return hex0002
            case ENABLEDFLAG => return hex0004
            case FILTERFLAG => return hex0008
            case BULLETHITFLAG => return hex0010
            case TOIFLAG => return hex0020
            case _ => throw Exception("invalid value for input of getRawValue")
        }
    }
}

class B2PolygonContact <: B2Contact {
    init( FixtureA: B2Fixture,  FixtureB: B2Fixture) {
        super(FixtureA, 0, FixtureB, 0)
    }

    public static func create( fixtureA: B2Fixture,  indexA: Int64,  fixtureB: B2Fixture,  indexB: Int64): ?B2Contact {
        return B2PolygonContact(fixtureA, fixtureB)
    }
    
    public static func destroy( contact: B2Contact) {}
    
    public override open func evaluate( manifold1: B2Manifold,  xfA: B2Transform,  xfB: B2Transform) {
        if((mFixtureA.getOrThrow().shape as B2PolygonShape).isSome() && (mFixtureB.getOrThrow().shape as B2PolygonShape).isSome()){
            manifold = b2CollidePolygons(manifold1, (mFixtureA.getOrThrow().shape as B2PolygonShape).getOrThrow(), xfA, (mFixtureB.getOrThrow().shape as B2PolygonShape).getOrThrow(), xfB)
        }       
    }
}

class B2CircleContact <: B2Contact {
    init( fixtureA: B2Fixture,  fixtureB: B2Fixture) {
        super(fixtureA, 0, fixtureB, 0)
    }

    public static func create( fixtureA: B2Fixture,  indexA: Int64,  fixtureB: B2Fixture,  indexB: Int64): ?B2Contact {
        return B2CircleContact(fixtureA, fixtureB)
    }
    
    public static func destroy( contact: B2Contact) {}
    
    public override open func evaluate( manifold1: B2Manifold,  xfA: B2Transform,  xfB: B2Transform) {
        manifold = b2CollideCircles(manifold1, (mFixtureA.getOrThrow().shape as B2CircleShape).getOrThrow(), xfA, (mFixtureB.getOrThrow().shape as B2CircleShape).getOrThrow(), xfB)
    }
}

class B2EdgeAndCircleContact <: B2Contact {
    init( fixtureA: B2Fixture,  fixtureB: B2Fixture) {
       super(fixtureA, 0, fixtureB, 0)
   }
   public static func create( fixtureA: B2Fixture,  indexA: Int64,  fixtureB: B2Fixture,  indexB: Int64): ?B2Contact {
       return B2EdgeAndCircleContact(fixtureA, fixtureB)
   }
   
   public static func destroy( contact: B2Contact) {}
   
   
   public override open func evaluate( manifold1: B2Manifold,  xfA: B2Transform,  xfB: B2Transform) {
       manifold = b2CollideEdgeAndCircle(manifold1, (mFixtureA.getOrThrow().shape as B2EdgeShape).getOrThrow(), xfA, (mFixtureB.getOrThrow().shape as B2CircleShape).getOrThrow(), xfB)
   }
}

class B2EdgeAndPolygonContact <: B2Contact {
    init( fixtureA: B2Fixture,  fixtureB: B2Fixture) {
       super(fixtureA, 0, fixtureB, 0)
   }

   public static func create( fixtureA: B2Fixture,  indexA: Int64,  fixtureB: B2Fixture,  indexB: Int64): ?B2Contact {
       return B2EdgeAndPolygonContact(fixtureA, fixtureB)
   }
   
   public static func destroy( contact: B2Contact) {}
   
   
   public override open func evaluate( manifold1: B2Manifold,  xfA: B2Transform,  xfB: B2Transform) {
       manifold = b2CollideEdgeAndPolygon(manifold1, (mFixtureA.getOrThrow().shape as B2EdgeShape).getOrThrow(), xfA, (mFixtureB.getOrThrow().shape as B2PolygonShape).getOrThrow(), xfB)
   }
}

class B2PolygonAndCircleContact <: B2Contact {
    init( fixtureA : B2Fixture,  fixtureB : B2Fixture) {
       super(fixtureA, 0, fixtureB, 0)
   }

   public static func create( fixtureA: B2Fixture,  indexA: Int64,  fixtureB: B2Fixture,  indexB: Int64): ?B2Contact {
       return B2PolygonAndCircleContact(fixtureA, fixtureB)
   }
    
   public static func destroy( contact: B2Contact) {}
   
   public override open func evaluate( manifold1: B2Manifold,  xfA: B2Transform,  xfB: B2Transform) {
       manifold = b2CollidePolygonAndCircle(manifold1, (mFixtureA.getOrThrow().shape as B2PolygonShape).getOrThrow(), xfA, (mFixtureB.getOrThrow().shape as B2CircleShape).getOrThrow(), xfB)
   }
}

public func equalEqual ( lhs: B2ContactFeature,  rhs: B2ContactFeature) : Bool {
    return lhs.indexA == rhs.indexA && lhs.indexB == rhs.indexB && lhs.typeA.getValue() == rhs.typeA.getValue() && lhs.typeB.getValue() == rhs.typeB.getValue()
}
