/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

public class B2Filter {
    public init() {
        categoryBits = 0x0001
        maskBits = 0xFFFF
        groupIndex = 0
    }
    public var categoryBits : Int64
    public var maskBits : Int64
    public var groupIndex : Int64
}

open class B2FixtureDef {
    public init() {
        shape = None
        userData = None
        friction = 0.2
        restitution = 0.0
        density = 0.0
        isSensor = false
        filter = B2Filter()
    }
    var shape: ?B2Shape
    var userData: ?Object
    var friction: Float64
    var restitution: Float64
    var density: Float64
    var isSensor: Bool
    var filter: B2Filter
}

public class B2FixtureProxy {
    init( fixture: B2Fixture) {
        this.fixture = fixture
    }
    var aabb = B2AaBb()
    var fixture: B2Fixture
    var childIndex = 0
    var proxyId = 0
}

open class B2Fixture {
    var mDensity: Float64 = 0.0
    var mNext: ?B2Fixture = Option<B2Fixture>.None
    var mBody: B2Body
    var mShape: ?B2Shape = Option<B2Shape>.None
    var mFriction: Float64 = 0.0
    var mRestitution: Float64 = 0.0
    var mProxies = ArrayList<B2FixtureProxy>()
    var mFilter = B2Filter()
    var mIsSensor: Bool = false
    var mUserData: ?Object = Option<Object>.None
    
    init( body: B2Body,  def: B2FixtureDef) {
        mUserData = def.userData
        mFriction = def.friction
        mRestitution = def.restitution
        mBody = body
        mNext = None
        mFilter = def.filter
        mIsSensor = def.isSensor
        mShape = def.shape.getOrThrow().clone()
        mProxies = ArrayList<B2FixtureProxy>()
        mDensity = def.density
    }
    
    public prop mProxyCount: Int64  { 
        get() {
            mProxies.size
	}
    }
    
    public prop fixtureType: B2ShapeType { 
        get() {
            mShape.getOrThrow().getType()
	}
    }
    
    public prop shape: ?B2Shape  { 
        get() {
            mShape
	}
    }

    
  
    public mut prop isSensor: Bool{
        get(){
	    mIsSensor
	}
        set(v){
            setSensor(v)
        }
    }
    
    public func setSensor( sensor: Bool) {
        if ((sensor != mIsSensor)) {
            mBody.setAwake(true)
            mIsSensor = sensor
        }
    }
    
    public mut prop filterData: B2Filter{
        get(){
	    mFilter
	}
        set(v){
            setFilterData(v)
        }
    }
    
    public func setFilterData( filter: B2Filter) {
        mFilter = filter
        refilter()
    }
    
    public func refilter() {
        var edge = mBody.getContactList()
        while ((edge.isSome())) {
            let contact = edge.getOrThrow().contact
            let fixtureA = contact.fixtureA
            let fixtureB = contact.fixtureB
            if ((refEq (fixtureA,this) || refEq (fixtureB,this))) {
                contact.flagForFiltering()
            }
            edge = edge.getOrThrow().next
        }
        let world = mBody.world
        if ((world.isNone())) {
            return
        }
        let broadPhase = world.getOrThrow().mContactManager.mBroadPhase
        for (i in 0 .. mProxyCount) {
            broadPhase.touchProxy(mProxies[i].proxyId)
        }
    }
    
    public func body(): B2Body  { 
        
        return mBody
	
    }
    
    public func getNext() : ?B2Fixture {
        if ((mNext.isSome())) {
            return mNext
        }
        return None
    }
    
    public mut prop userData: ?Object{
        get(){
            if (mUserData.isSome()) {
                mUserData.getOrThrow()
            }
            return Option<Object>.None
        }
        set(v){
            setUserData(v)
        }
    }
    
    public open func setUserData( data: ?Object) {
        mUserData = data
    }
    
    public open func testPoint( p: B2Vec2) : Bool {
        return mShape.getOrThrow().testPoint(mBody.transform(), p)
    }
    
    public open func rayCast( output: B2RayCastOutput,  input: B2RayCastInput,  childIndex: Int64) : Bool {
        return mShape.getOrThrow().rayCast(output, input, mBody.transform(), childIndex)
    }
    
    public open func massData(): ?B2MassData {
        return this.mShape.getOrThrow().computeMass(this.mDensity)
    }
    

    public mut prop density: Float64{
        get(){
            mDensity
        }
        set(v){
            setDensity(v)
        }
    }
    
    public open func setDensity( density: Float64) {
        mDensity = density
    }
    

    public mut prop friction: Float64{
        get(){
            mFriction
        }
        set(v){
            setFriction(v)
        }
    }
    
    public open func setFriction( friction: Float64) {
        mFriction = friction
    }
    

    public mut prop restitution: Float64{
        get(){
            mRestitution
        }
        set(v){
            setRestitution(v)
        }
    }
    
    public open func setRestitution( restitution: Float64) {
        mRestitution = restitution
    }
    
    public open func getAaBb( childIndex: Int64) : B2AaBb {
        return mProxies[childIndex].aabb
    }

    func destroy() {
        mProxies.clear()
        mShape =  Option<B2Shape>.None
    }
    
    func createProxies( broadPhase: B2BroadPhase,  xf: B2Transform) {
        if (mShape.isSome()) {
            let proxyCount = mShape.getOrThrow().childCount()
            for (i in 0..proxyCount) {
                let proxy = B2FixtureProxy(this)
                mShape.getOrThrow().computeAaBb(proxy.aabb, xf, i)
                proxy.childIndex = i
                proxy.proxyId = broadPhase.createProxy(proxy.aabb, proxy)
                mProxies.add(proxy)
            }
        }
    }
    
    func destroyProxies( broadPhase: B2BroadPhase) {
        for (i in 0 .. mProxyCount) {
            let proxy = mProxies[i]
            broadPhase.destroyProxy(proxy.proxyId)
        }
        mProxies.clear()
    }
    
    func synchronize( broadPhase: B2BroadPhase,  transform1: B2Transform,  transform2: B2Transform) {
        if ((mProxyCount == 0)) {
            return
        }
        for (i in 0 .. mProxyCount) {
            let proxy = mProxies[i]
            var aabb1 = B2AaBb()
            var aabb2 = B2AaBb()
            mShape.getOrThrow().computeAaBb(aabb1, transform1, proxy.childIndex)
            mShape.getOrThrow().computeAaBb(aabb2, transform2, proxy.childIndex)
            proxy.aabb.combine(aabb1, aabb2)
            let displacement = subtract(transform2.p,transform1.p)
            broadPhase.moveProxy(proxy.proxyId, proxy.aabb, displacement)
        }
    }
    
}
