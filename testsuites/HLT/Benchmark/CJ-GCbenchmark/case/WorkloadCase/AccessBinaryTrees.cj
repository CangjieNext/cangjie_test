/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms

import std.time.*
import std.math.*

class TreeNode {
    let left : ?TreeNode
    let right : ?TreeNode
    let item : Float64
    
    init(left: ?TreeNode, right: ?TreeNode,item: Float64) {
        this.left = left
        this.right = right
        this.item = item
    }
    
    func itemCheck() : Float64 {
        if (this.left.isNone()) {
            return this.item
        }else {
            return this.item + (this.left?.itemCheck() ?? 0.0) - (this.right?.itemCheck() ?? 0.0)
        }
    }
}

func bottomUpTree(item : Float64, depth : Int64) : TreeNode {
   if (depth > 0) {
      return TreeNode(
        bottomUpTree(2.0*item-1.0, depth-1),
        bottomUpTree(2.0*item, depth-1),
        item)
   }else {
       return TreeNode(Option<TreeNode>.None, Option<TreeNode>.None, item)
   }
}

func run() {
    var ret = 0.0

    for (n in 4..=7) {
        let minDepth = 4
        let maxDepth = max(minDepth + 2, n)
        let stretchDepth = maxDepth + 1
        
        var check = bottomUpTree(0.0,stretchDepth).itemCheck()
        
        let longLivedTree = bottomUpTree(0.0,maxDepth)
        var depth = minDepth
        while (depth<=maxDepth) {
            let iterations = 1 << (maxDepth - depth + minDepth)
            
            check = 0.0
            for (i in 1..=iterations) {
                check += bottomUpTree(Float64(i),depth).itemCheck()
                check += bottomUpTree(-Float64(i),depth).itemCheck()
            }
            depth += 2
        }

        ret += longLivedTree.itemCheck()
    }
    
    let expected: Float64 = -4.0
    if (ret != expected) {
        print("ERROR: bad result: expected ${expected}  but got ${ret}")
        
    }
}

class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time 
    }
}

/*
 * @State
 * @Tags Jetstream2
 */
 class AccessBinaryTress {
    /*
    * @AccessBinaryTress
    */
    func runIterationTime() {
        let start = Timer().getTime()
        for (_ in 0..1000) {
            run()
        }
        let end = Timer().getTime()
        println("AccessBinaryTrees: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
    }
 }

main() {
    AccessBinaryTress().runIterationTime()
}
