// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan foo cntGet: 2
// ASSERT: scan foo cntSet: 1
// ASSERT: scan goo cntGet: 4
// ASSERT: scan goo cntSet: 2

package a

var cntGet = 0
var cntSet = 0

class A<T> {
   var _a: T
   public init(a: T) {
      _a = a
   }
   public operator func [](index: Int64): T {
      cntGet++
      _a
   }
   public operator func [](index: Int64, value!: T): Unit {
      cntSet++
   }
}

@Frozen
public func foo() {
   var bl_tree = A<A<UInt16>>(A<UInt16>(1))
   bl_tree[0][0] += 0
   println("foo cntGet: ${cntGet}")
   println("foo cntSet: ${cntSet}")
}

@Frozen
public func goo() {
   var bl_tree = A<A<UInt16>>(A<UInt16>(1))
   bl_tree[0][0]++
   println("goo cntGet: ${cntGet}")
   println("goo cntSet: ${cntSet}")
}

main() {
   foo()
   goo()
}
