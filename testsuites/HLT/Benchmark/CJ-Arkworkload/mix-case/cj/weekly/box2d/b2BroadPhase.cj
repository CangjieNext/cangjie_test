/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.math.*

public class B2Pair {
    public var proxyIdA: Int64 = -1
    public var proxyIdB: Int64 = -1
    init(proxyIdA!:Int64 = -1, proxyIdB!:Int64 = -1) {
        this.proxyIdA = proxyIdA
        this.proxyIdB = proxyIdB
    }
}

open class B2BroadPhase <: B2QueryWrapper {
    public static let nullProxy = -1
    var mTree = B2DynamicTree<B2FixtureProxy>()
    var mProxyCount: Int64 = 0
    var mMoveBuffer = ArrayList<Int64>()
    var mPairBuffer = ArrayList<B2Pair>()
    var mQueryProxyId: Int64 = 0
    
    public init() {
        mProxyCount = 0
        mPairBuffer = ArrayList<B2Pair>([])
        mMoveBuffer = ArrayList<Int64>([])
    }
    
    public func createProxy(aabb: B2AaBb, userData: B2FixtureProxy) : Int64 {
        let proxyId = mTree.createProxy(aabb, userData)
        mProxyCount += 1
        bufferMove(proxyId)
        return proxyId
    }
    
    public func destroyProxy( proxyId: Int64) {
        unBufferMove(proxyId)
        mProxyCount -= 1
        mTree.destroyProxy(proxyId)
    }
    
    public func moveProxy( proxyId: Int64,  aabb: B2AaBb,  displacement: B2Vec2) {
        let buffer = mTree.moveProxy(proxyId, aabb, displacement)
        if (buffer) {
            bufferMove(proxyId)
        }
    }
    
    public func touchProxy( proxyId: Int64) {
        bufferMove(proxyId)
    }
    
    public func getFatAaBb( proxyId: Int64) : B2AaBb {
        return mTree.getFatAaBb(proxyId)
    }
    
    public func getUserData( proxyId : Int64) : ?B2FixtureProxy {
        return mTree.getUserData(proxyId)
    }
    
    public func testOverlap( proxyIdA : Int64,  proxyIdB : Int64) : Bool {
        let aabbA = mTree.getFatAaBb(proxyIdA)
        let aabbB = mTree.getFatAaBb(proxyIdB)
        return b2TestOverlap2(aabbA, aabbB)
    }
    
    public func getProxyCount() : Int64 {
        return mProxyCount
    }
    
    public func updatePairs<T>(callback:T) where T <: B2BroadPhaseWrapper{
        mPairBuffer.clear()
        for (i in 0 .. mMoveBuffer.size) {
            mQueryProxyId = mMoveBuffer[i]
            if ((mQueryProxyId == B2BroadPhase.nullProxy)) {
                continue
            }
            let fatAaBb = mTree.getFatAaBb(mQueryProxyId)
            mTree.query(this, fatAaBb)
        }
        mMoveBuffer.clear()

        mPairBuffer.sortBy(stable: false) { rht: B2Pair,lht:B2Pair =>
            if (rht.proxyIdA == lht.proxyIdA) {
                if (rht.proxyIdB <lht.proxyIdB) {
                    return Ordering.LT
                } 
                else {
                    return Ordering.GT
                }
            } else {
                if (rht.proxyIdA <lht.proxyIdA) {
                    return Ordering.LT
                } 
                else {
                    return Ordering.GT
                }
            }
            return Ordering.EQ
        }
        var i = 0
        while ((i < mPairBuffer.size)) {
            let primaryPair = mPairBuffer[i]
            var userDataA = mTree.getUserData(primaryPair.proxyIdA)
            var userDataB = mTree.getUserData(primaryPair.proxyIdB)
            callback.addPair(userDataA.getOrThrow(), userDataB.getOrThrow())
            i += 1
            while ((i < mPairBuffer.size)) {
                let pair = mPairBuffer[i]
                if (pair.proxyIdA != primaryPair.proxyIdA || pair.proxyIdB != primaryPair.proxyIdB) {
                    break
                }
                i += 1
            }
        }
    }
    
    public func query<T>(callback:T, aabb:B2AaBb) where T <: B2QueryWrapper{
        mTree.query(callback, aabb)
    }
    
    public func rayCast<T>(callback:T, input:B2RayCastInput) where T <: B2RayCastWrapper{
        mTree.rayCast(callback, input)
    }
    
    public func getTreeHeight() : Int64 {
        return mTree.getHeight()
    }
    
    public func getTreeBalance() : Int64 {
        return mTree.getMaxBalance()
    }
    
    public func getTreeQuality() : Float64 {
        return mTree.getAreaRatio()
    }
    
    public func shiftOrigin(newOrigin: B2Vec2) {
        mTree.shiftOrigin(newOrigin)
    }
    
    func bufferMove(proxyId: Int64) {
        mMoveBuffer.add(proxyId)
    }
    
    func unBufferMove(proxyId: Int64) {
        for (i in 0 .. mMoveBuffer.size) {
            if (mMoveBuffer[i] == proxyId) {
                mMoveBuffer[i] = B2BroadPhase.nullProxy
            }
        }
    }
    
    public func queryCallback(proxyId: Int64) : Bool {
        if (proxyId == mQueryProxyId) {
            return true
        }
        let pair = B2Pair(proxyIdA:(min(proxyId, mQueryProxyId)), proxyIdB:(max(proxyId, mQueryProxyId)))
        mPairBuffer.add(pair)
        return true
    }
}