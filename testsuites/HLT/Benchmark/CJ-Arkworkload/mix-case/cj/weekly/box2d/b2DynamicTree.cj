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

public let b2NullNode = -1
open class B2TreeNode<T> {
    var aabb = B2AaBb()
    var userData: ?T = None
    var parentOrNext: Int64 = b2NullNode
    var child1: Int64 = b2NullNode
    var child2: Int64 = b2NullNode
    var height: Int64 = -1
    func isLeaf() : Bool {
        return child1 == b2NullNode
    }
}

open class B2DynamicTree<T> {
    var mRoot: Int64
    var mNodes: ArrayList<B2TreeNode<T>>
    var mNodeCount: Int64
    var mNodeCapacity: Int64
    var mFreeList: Int64
    var mInsertionCount: Int64
    public init() {
        mRoot = b2NullNode
        mNodeCapacity = 16
        mNodeCount = 0
        mNodes = ArrayList<B2TreeNode<T>>()
        for (i in 0 .. mNodeCapacity - 1) {
            mNodes.add(B2TreeNode())
            mNodes[mNodes.size - 1].parentOrNext = i + 1
            mNodes[mNodes.size - 1].height = -1
        }
        mNodes.add(B2TreeNode())
        mNodes[mNodes.size - 1].parentOrNext = b2NullNode
        mNodes[mNodes.size - 1].height = -1
        mFreeList = 0
        mInsertionCount = 0
    }
    
    public open func createProxy( aabb: B2AaBb,  userData: ?T) : Int64 {
        let proxyId = allocateNode()
        let r = B2Vec2(x0:B2AaBbExtension,y0:B2AaBbExtension )
        mNodes[proxyId].aabb.lowerBound = subtract(aabb.lowerBound, r)
        mNodes[proxyId].aabb.upperBound = add(aabb.upperBound, r)
        mNodes[proxyId].userData = userData
        mNodes[proxyId].height = 0
        insertLeaf(proxyId)
        return proxyId
    }
    
    public open func destroyProxy( proxyId: Int64) {
        removeLeaf(proxyId)
        freeNode(proxyId)
    }
    
    public open func moveProxy( proxyId: Int64,  aabb: B2AaBb,  displacement: B2Vec2) : Bool {
        if (mNodes[proxyId].aabb.contains(aabb)) {
            return false
        }
        removeLeaf(proxyId)
        var b = aabb
        let r = B2Vec2(x0:B2AaBbExtension,y0:B2AaBbExtension )
        b.lowerBound = subtract(b.lowerBound, r)
        b.upperBound = add(b.upperBound, r)
        let d = multM(displacement, B2AaBbMultiplier)
        if ((d.x < 0.0)) {
            b.lowerBound.x += d.x
        } else {
            b.upperBound.x += d.x
        }
        if ((d.y < 0.0)) {
            b.lowerBound.y += d.y
        } else {
            b.upperBound.y += d.y
        }
        mNodes[proxyId].aabb = b
        insertLeaf(proxyId)
        return true
    }
    
    public open func getUserData( proxyId: Int64) : ?T {
        return mNodes[proxyId].userData
    }
    
    public open func getFatAaBb( proxyId: Int64) : B2AaBb {
        return mNodes[proxyId].aabb
    }
    
    public func query<T>( callback: T,  aabb: B2AaBb) where T <: B2QueryWrapper  {
        var stack:ArrayList<Int64> = ArrayList<Int64>([])
        stack.add(mRoot)
        while ((stack.size > 0)) {
            var index = stack.size - 1
            let nodeId = stack.remove(at: index)
            if ((nodeId == b2NullNode)) {
                continue
            }
            let node = mNodes[nodeId]
            if ((b2TestOverlap2(node.aabb, aabb))) {
                if ((node.isLeaf())) {
                    let proceed = callback.queryCallback(nodeId)
                    if ((proceed == false)) {
                        return
                    }
                } else {
                    stack.add(node.child1)
                    stack.add(node.child2)
                }
            }
        }
    }
    
    public func rayCast<T>( callback: T,  input: B2RayCastInput) where T <: B2RayCastWrapper {
        let p1 = input.p1
        let p2 = input.p2
        var r = subtract(p2, p1)
        r.normalize()
        let v = b2Cross21(1.0, r)
        let absv = b2Abs2(v)
        var maxFraction = input.maxFraction
        var segmentAaBb = B2AaBb()
        let t = add(p1, multM(subtract(p2, p1), maxFraction))
        segmentAaBb.lowerBound = b2Min(p1, t)
        segmentAaBb.upperBound = b2Max(p1, t)
        var stack:ArrayList<Int64> = ArrayList<Int64>()
        stack.add(mRoot)
        while ((stack.size > 0)) {
            var index = stack.size - 1
            let nodeId = stack.remove(at: index)
            if ((nodeId == b2NullNode)) {
                continue
            }
            let node = mNodes[nodeId]
            if ((b2TestOverlap2(node.aabb, segmentAaBb)) == false) {
                continue
            }
            let c = node.aabb.center
            let h = node.aabb.extents
            let separation = abs(b2Dot22(v, subtract(p1, c))) - b2Dot22(absv, h)
            if ((separation > 0.0)) {
                continue
            }
            if ((node.isLeaf())) {
                var subInput = B2RayCastInput()
                subInput.p1 = input.p1
                subInput.p2 = input.p2
                subInput.maxFraction = maxFraction
                let value = callback.rayCastCallback(subInput, nodeId)
                if ((value == 0.0)) {
                    return
                }
                if ((value > 0.0)) {
                    maxFraction = value
                    let t = add(p1, multM(subtract(p2, p1), maxFraction))
                    segmentAaBb.lowerBound = b2Min(p1, t)
                    segmentAaBb.upperBound = b2Max(p1, t)
                }
            } else {
                stack.add(node.child1)
                stack.add(node.child2)
            }
        }
    }
        
    public open func validate() {
        validateStructure(mRoot)
        validateMetrics(mRoot)
        var freeIndex = mFreeList
        while ((freeIndex != b2NullNode)) {
            freeIndex = mNodes[freeIndex].parentOrNext
        }
    }
    
    public open func getHeight() : Int64 {
        if ((mRoot == b2NullNode)) {
            return 0
        }
        return mNodes[mRoot].height
    }
    
    public open func getMaxBalance() : Int64 {
        var maxBalance = 0
        for (i in 0 .. mNodes.size) {
            let node = mNodes[i]
            if ((node.height <= 1)) {
                continue
            }
            let child1 = node.child1
            let child2 = node.child2
            let balance = abs(mNodes[child2].height - mNodes[child1].height)
            maxBalance = max(maxBalance, balance)
        }
        return maxBalance
    }
    
    public open func getAreaRatio() : Float64 {
        if ((mRoot == b2NullNode)) {
            return 0.0
        }
        let root = mNodes[mRoot]
        let rootArea = root.aabb.perimeter
        var totalArea: Float64 = 0.0
        for (i in 0 .. mNodes.size) {
            let node = mNodes[i]
            if ((node.height < 0)) {
                continue
            }
            totalArea += node.aabb.perimeter
        }
        return totalArea / rootArea
    }
    
    public open func rebuildBottomUp() {
        var nodes :ArrayList<Int64> = ArrayList<Int64>([])
        for (i in (0..mNodes.size)) {
            nodes.add(0)
        }
        var count = 0
        for (i in 0 .. mNodes.size) {
            if ((mNodes[i].height < 0)) {
                continue
            }
            if ((mNodes[i].isLeaf())) {
                mNodes[i].parentOrNext = b2NullNode
                nodes[count] = i
                count += 1
            } else {
                freeNode(i)
            }
        }
        while ((count > 1)) {
            var minCost = b2MaxFloat
            var iMin = -1
            var jMin = -1
            for (i in 0 .. count) {
                let aabbi = mNodes[nodes[i]].aabb
                for (j in i + 1 .. count) {
                    let aabbj = mNodes[nodes[j]].aabb
                    var b = B2AaBb()
                    b.combine(aabbi, aabbj)
                    let cost = b.perimeter
                    if ((cost < minCost)) {
                        iMin = i
                        jMin = j
                        minCost = cost
                    }
                }
            }
            let index1 = nodes[iMin]
            let index2 = nodes[jMin]
            let child1 = mNodes[index1]
            let child2 = mNodes[index2]
            let parentIndex = allocateNode()
            let parent = mNodes[parentIndex]
            parent.child1 = index1
            parent.child2 = index2
            parent.height = 1 + max(child1.height, child2.height)
            parent.aabb.combine(child1.aabb, child2.aabb)
            parent.parentOrNext = b2NullNode
            child1.parentOrNext = parentIndex
            child2.parentOrNext = parentIndex
            nodes[jMin] = nodes[count-1]
            nodes[iMin] = parentIndex
            count -= 1
        }
        mRoot = nodes[0]
        validate()
    }
    
    public open func shiftOrigin( newOrigin: B2Vec2) {
        for (i in 0 .. mNodes.size) {
            subtractEqual(mNodes[i].aabb.lowerBound, newOrigin)
            subtractEqual(mNodes[i].aabb.upperBound, newOrigin)
        }
    }
    
    private func allocateNode() : Int64 {
        if ((mFreeList == b2NullNode)) {
            let node = B2TreeNode<T>()
            node.parentOrNext = b2NullNode
            node.height = -1
            mNodes.add(node)
            mFreeList = mNodes.size - 1
        }
        let nodeId = mFreeList
        mFreeList = mNodes[nodeId].parentOrNext
        mNodes[nodeId].parentOrNext = b2NullNode
        mNodes[nodeId].child1 = b2NullNode
        mNodes[nodeId].child2 = b2NullNode
        mNodes[nodeId].height = 0
        mNodes[nodeId].userData = None
        return nodeId
    }
    
    func freeNode( nodeId: Int64) {
        mNodes[nodeId].parentOrNext = mFreeList
        mNodes[nodeId].height = -1
        mFreeList = nodeId
    }
    
    func insertLeaf( leaf: Int64) {
        mInsertionCount += 1
        if ((mRoot == b2NullNode)) {
            mRoot = leaf
            mNodes[mRoot].parentOrNext = b2NullNode
            return
        }
        let leafAaBb = mNodes[leaf].aabb
        var index = mRoot
        while ((mNodes[index].isLeaf() == false)) {
            let child1 = mNodes[index].child1
            let child2 = mNodes[index].child2
            let area = mNodes[index].aabb.perimeter
            var combinedAaBb = B2AaBb()
            combinedAaBb.combine(mNodes[index].aabb, leafAaBb)
            let combinedArea = combinedAaBb.perimeter
            let cost = float2 * combinedArea
            let inheritanceCost = float2 * (combinedArea - area)
            var cost1: Float64
            if ((mNodes[child1].isLeaf())) {
                var aabb = B2AaBb()
                aabb.combine(leafAaBb, mNodes[child1].aabb)
                cost1 = aabb.perimeter + inheritanceCost
            } else {
                var aabb = B2AaBb()
                aabb.combine(leafAaBb, mNodes[child1].aabb)
                let oldArea = mNodes[child1].aabb.perimeter
                let newArea = aabb.perimeter
                cost1 = (newArea - oldArea) + inheritanceCost
            }
            var cost2: Float64
            if ((mNodes[child2].isLeaf())) {
                var aabb = B2AaBb()
                aabb.combine(leafAaBb, mNodes[child2].aabb)
                cost2 = aabb.perimeter + inheritanceCost
            } else {
                var aabb = B2AaBb()
                aabb.combine(leafAaBb, mNodes[child2].aabb)
                let oldArea = mNodes[child2].aabb.perimeter
                let newArea = aabb.perimeter
                cost2 = newArea - oldArea + inheritanceCost
            }
            if ((cost < cost1 && cost < cost2)) {
                break
            }
            if ((cost1 < cost2)) {
                index = child1
            } else {
                index = child2
            }
        }
        let sibling = index
        let oldParent = mNodes[sibling].parentOrNext
        let newParent = allocateNode()
        mNodes[newParent].parentOrNext = oldParent
        mNodes[newParent].userData = None
        mNodes[newParent].aabb.combine(leafAaBb, mNodes[sibling].aabb)
        mNodes[newParent].height = mNodes[sibling].height + 1
        if ((oldParent != b2NullNode)) {
            if ((mNodes[oldParent].child1 == sibling)) {
                mNodes[oldParent].child1 = newParent
            } else {
                mNodes[oldParent].child2 = newParent
            }
            mNodes[newParent].child1 = sibling
            mNodes[newParent].child2 = leaf
            mNodes[sibling].parentOrNext = newParent
            mNodes[leaf].parentOrNext = newParent
        } else {
            mNodes[newParent].child1 = sibling
            mNodes[newParent].child2 = leaf
            mNodes[sibling].parentOrNext = newParent
            mNodes[leaf].parentOrNext = newParent
            mRoot = newParent
        }
        index = mNodes[leaf].parentOrNext
        while ((index != b2NullNode)) {
            index = balance(index)
            let child1 = mNodes[index].child1
            let child2 = mNodes[index].child2
            mNodes[index].height = 1 + max(mNodes[child1].height, mNodes[child2].height)
            mNodes[index].aabb.combine(mNodes[child1].aabb, mNodes[child2].aabb)
            index = mNodes[index].parentOrNext
        }
    }
    
    func removeLeaf( leaf: Int64) {
        if ((leaf == mRoot)) {
            mRoot = b2NullNode
            return
        }
        let parent = mNodes[leaf].parentOrNext
        let grandParent = mNodes[parent].parentOrNext
        var sibling: Int64
        if ((mNodes[parent].child1 == leaf)) {
            sibling = mNodes[parent].child2
        } else {
            sibling = mNodes[parent].child1
        }
        if ((grandParent != b2NullNode)) {
            if ((mNodes[grandParent].child1 == parent)) {
                mNodes[grandParent].child1 = sibling
            } else {
                mNodes[grandParent].child2 = sibling
            }
            mNodes[sibling].parentOrNext = grandParent
            freeNode(parent)
            var index = grandParent
            while ((index != b2NullNode)) {
                index = balance(index)
                let child1 = mNodes[index].child1
                let child2 = mNodes[index].child2
                mNodes[index].aabb.combine(mNodes[child1].aabb, mNodes[child2].aabb)
                mNodes[index].height = 1 + max(mNodes[child1].height, mNodes[child2].height)
                index = mNodes[index].parentOrNext
            }
        } else {
            mRoot = sibling
            mNodes[sibling].parentOrNext = b2NullNode
            freeNode(parent)
        }
    }
    
    func balance( iA : Int64) : Int64 {
        let mA = mNodes[iA]
        if ((mA.isLeaf() || mA.height < indexTwo)) {
            return iA
        }
        let iB = mA.child1
        let iC = mA.child2
        let mB = mNodes[iB]
        let mC = mNodes[iC]
        let balance = mC.height - mB.height
        if ((balance > 1)) {
            let iF = mC.child1
            let iG = mC.child2
            let mF = mNodes[iF]
            let mG = mNodes[iG]
            mC.child1 = iA
            mC.parentOrNext = mA.parentOrNext
            mA.parentOrNext = iC
            if ((mC.parentOrNext != b2NullNode)) {
                if ((mNodes[mC.parentOrNext].child1 == iA)) {
                    mNodes[mC.parentOrNext].child1 = iC
                } else {
                    mNodes[mC.parentOrNext].child2 = iC
                }
            } else {
                mRoot = iC
            }
            if ((mF.height > mG.height)) {
                mC.child2 = iF
                mA.child2 = iG
                mG.parentOrNext = iA
                mA.aabb.combine(mB.aabb, mG.aabb)
                mC.aabb.combine(mA.aabb, mF.aabb)
                mA.height = 1 + max(mB.height, mG.height)
                mC.height = 1 + max(mA.height, mF.height)
            } else {
                mC.child2 = iG
                mA.child2 = iF
                mF.parentOrNext = iA
                mA.aabb.combine(mB.aabb, mF.aabb)
                mC.aabb.combine(mA.aabb, mG.aabb)
                mA.height = 1 + max(mB.height, mF.height)
                mC.height = 1 + max(mA.height, mG.height)
            }
            return iC
        }
        if ((balance < -1)) {
            let iD = mB.child1
            let iE = mB.child2
            let mD = mNodes[iD]
            let mE = mNodes[iE]
            mB.child1 = iA
            mB.parentOrNext = mA.parentOrNext
            mA.parentOrNext = iB
            if ((mB.parentOrNext != b2NullNode)) {
                if ((mNodes[mB.parentOrNext].child1 == iA)) {
                    mNodes[mB.parentOrNext].child1 = iB
                } else {
                    mNodes[mB.parentOrNext].child2 = iB
                }
            } else {
                mRoot = iB
            }
            if ((mD.height > mE.height)) {
                mB.child2 = iD
                mA.child1 = iE
                mE.parentOrNext = iA
                mA.aabb.combine(mC.aabb, mE.aabb)
                mB.aabb.combine(mA.aabb, mD.aabb)
                mA.height = 1 + max(mC.height, mE.height)
                mB.height = 1 + max(mA.height, mD.height)
            } else {
                mB.child2 = iE
                mA.child1 = iD
                mD.parentOrNext = iA
                mA.aabb.combine(mC.aabb, mD.aabb)
                mB.aabb.combine(mA.aabb, mE.aabb)
                mA.height = 1 + max(mC.height, mD.height)
                mB.height = 1 + max(mA.height, mE.height)
            }
            return iB
        }
        return iA
    }
    
    func validateStructure( index : Int64): Unit {
        if ((index == b2NullNode)) {
            return
        }
        let node = mNodes[index]
        let child1 = node.child1
        let child2 = node.child2
        if ((node.isLeaf())) {
            return
        }
        validateStructure(child1)
        validateStructure(child2)
    }
    
    func validateMetrics( index : Int64): Unit {
        if ((index == b2NullNode)) {
            return
        }
        let node = mNodes[index]
        let child1 = node.child1
        let child2 = node.child2
        if ((node.isLeaf())) {
            return
        }
        var aabb = B2AaBb()
        aabb.combine(mNodes[child1].aabb, mNodes[child2].aabb)
        validateMetrics(child1)
        validateMetrics(child2)
    }
}
