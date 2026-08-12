/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


var b2DefaultFilter = B2ContactFilter()
var b2DefaultListener = B2DefaultContactListener()

open class B2ContactManager <: B2BroadPhaseWrapper {
    var mContactList: ?B2Contact = Option<B2Contact>.None
    var mContactCount: Int64 = 0
    var mContactFilter: ?B2ContactFilter = b2DefaultFilter
    var mContactListener: ?B2ContactListener = b2DefaultListener   
    init() {
        mContactList = None
        mContactCount = 0
        mContactFilter = b2DefaultFilter
        mContactListener = b2DefaultListener
    }
    
    public func addPair( proxyUserDataA: B2FixtureProxy,  proxyUserDataB: B2FixtureProxy) : Unit{
        let proxyA = proxyUserDataA
        let proxyB = proxyUserDataB
        var fixtureA = proxyA.fixture
        var fixtureB = proxyB.fixture
        var indexA = proxyA.childIndex
        var indexB = proxyB.childIndex
        var bodyA = fixtureA.body()
        var bodyB = fixtureB.body()
        if (refEq(bodyA, bodyB)) {
            return
        }
        var edge = bodyB.getContactList()
        while (edge.isSome()) {
            if (refEq(edge.getOrThrow().other.getOrThrow(), bodyA)) {
                let fA = edge.getOrThrow().contact.fixtureA
                let fB = edge.getOrThrow().contact.fixtureB
                let iA = edge.getOrThrow().contact.childIndexA
                let iB = edge.getOrThrow().contact.childIndexB
                if (refEq(fA, fixtureA) && refEq(fB, fixtureB) && iA == indexA && iB == indexB) {
                    return
                }
                if (refEq(fA, fixtureB) && refEq(fB, fixtureA) && iA == indexB && iB == indexA) {
                    return
                }
            }
            edge = edge.getOrThrow().next
        }
        if (bodyB.shouldCollide(bodyA) == false) {
            return
        }
        if (mContactFilter.isSome() && mContactFilter.getOrThrow().shouldCollide(fixtureA, fixtureB) == false) {
            return
        }
        let c = B2Contact.create(fixtureA, indexA, fixtureB, indexB)
        if (c.isNone()) {
            return
        }
        fixtureA = c.getOrThrow().fixtureA
        fixtureB = c.getOrThrow().fixtureB
        indexA = c.getOrThrow().childIndexA
        indexB = c.getOrThrow().childIndexB
        bodyA = fixtureA.body()
        bodyB = fixtureB.body()
        c.getOrThrow().mPrev = None
        c.getOrThrow().mNext = mContactList
        if (mContactList.isSome()) {
            mContactList.getOrThrow().mPrev = c
        }
        mContactList = c
        c.getOrThrow().setup()
        c.getOrThrow().mNodeA.getOrThrow().contact = c.getOrThrow()
        c.getOrThrow().mNodeA.getOrThrow().other = bodyB
        c.getOrThrow().mNodeA.getOrThrow().prev = None
        c.getOrThrow().mNodeA.getOrThrow().next = bodyA.mContactList
        if (bodyA.mContactList.isSome()) {
            bodyA.mContactList.getOrThrow().prev = c.getOrThrow().mNodeA
        }
        bodyA.mContactList = c.getOrThrow().mNodeA
        c.getOrThrow().mNodeB.getOrThrow().contact = c.getOrThrow()
        c.getOrThrow().mNodeB.getOrThrow().other = bodyA
        c.getOrThrow().mNodeB.getOrThrow().prev = None
        c.getOrThrow().mNodeB.getOrThrow().next = bodyB.mContactList
        if (bodyB.mContactList.isSome()) {
            bodyB.mContactList.getOrThrow().prev = c.getOrThrow().mNodeB
        }
        bodyB.mContactList = c.getOrThrow().mNodeB
        if (fixtureA.isSensor == false && fixtureB.isSensor == false) {
            bodyA.setAwake(true)
            bodyB.setAwake(true)
        }
        mContactCount += 1
    }
    
    func findNewContacts() {
        mBroadPhase.updatePairs(this)
    }
    
    func destroy(c: B2Contact) {
        let fixtureA = c.fixtureA
        let fixtureB = c.fixtureB
        let bodyA = fixtureA.body()
        let bodyB = fixtureB.body()
        if (mContactListener.isSome() && c.isTouching) {
            mContactListener.getOrThrow().endContact(c)
        }
        if (c.mPrev.isSome()) {
            c.mPrev.getOrThrow().mNext = c.mNext
        }
        if (c.mNext.isSome()) {
            c.mNext.getOrThrow().mPrev = c.mPrev
        }
        if (refEq(c, mContactList.getOrThrow())) {
            mContactList = c.mNext
        }
        if (c.mNodeA.getOrThrow().prev.isSome()) {
            c.mNodeA.getOrThrow().prev.getOrThrow().next = c.mNodeA.getOrThrow().next
        }
        if (c.mNodeA.getOrThrow().next.isSome()) {
            c.mNodeA.getOrThrow().next.getOrThrow().prev = c.mNodeA.getOrThrow().prev
        }
        if (refEq(c.mNodeA.getOrThrow(), bodyA.mContactList.getOrThrow())) {
            bodyA.mContactList = c.mNodeA.getOrThrow().next
        }
        if (c.mNodeB.getOrThrow().prev.isSome()) {
            c.mNodeB.getOrThrow().prev.getOrThrow().next = c.mNodeB.getOrThrow().next
        }
        if (c.mNodeB.getOrThrow().next.isSome()) {
            c.mNodeB.getOrThrow().next.getOrThrow().prev = c.mNodeB.getOrThrow().prev
        }
        if (refEq(c.mNodeB.getOrThrow(), bodyB.mContactList.getOrThrow())) {
            bodyB.mContactList = c.mNodeB.getOrThrow().next
        }
        B2Contact.destroy(c)
        mContactCount -= 1
    }
    
    func collide() {
        var c = mContactList
        while (c.isSome()) {
            let fixtureA = c.getOrThrow().fixtureA
            let fixtureB = c.getOrThrow().fixtureB
            let indexA = c.getOrThrow().childIndexA
            let indexB = c.getOrThrow().childIndexB
            let bodyA = fixtureA.body()
            let bodyB = fixtureB.body()
            if ((c.getOrThrow().mFlags & FlagContacts.FILTERFLAG.getValue()) != 0) {
                if (bodyB.shouldCollide(bodyA) == false) {
                    let cNuke = c.getOrThrow()
                    c = cNuke.getNext()
                    destroy(cNuke)
                    continue
                }
                if (mContactFilter.isSome() && mContactFilter.getOrThrow().shouldCollide(fixtureA, fixtureB) == false) {
                    let cNuke = c.getOrThrow()
                    c = cNuke.getNext()
                    destroy(cNuke)
                    continue
                }
                c.getOrThrow().mFlags &= !FlagContacts.FILTERFLAG.getValue()
            }
            let activeA = bodyA.isAwake() && bodyA.mType.getvalue() != B2BodyType.STATICBODY.getvalue()
            let activeB = bodyB.isAwake() && bodyB.mType.getvalue() != B2BodyType.STATICBODY.getvalue()
            if (activeA == false && activeB == false) {
                c = c.getOrThrow().getNext()
                continue
            }
            let proxyIdA = fixtureA.mProxies[indexA].proxyId
            let proxyIdB = fixtureB.mProxies[indexB].proxyId
            let overlap = mBroadPhase.testOverlap(proxyIdA, proxyIdB)
            if (overlap == false) {
                let cNuke = c
                c = cNuke.getOrThrow().getNext()
                destroy(cNuke.getOrThrow())
                continue
            }
            c.getOrThrow().update(mContactListener)
            c = c.getOrThrow().getNext()
        }
    }
    var mBroadPhase = B2BroadPhase()
    mut prop broadPhase: B2BroadPhase{
        get(){
            mBroadPhase
        }
        set(v){
        }
    }
}