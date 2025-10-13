// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

const func myTarget(x: Int64) {
    match (x) {
        case 0 => Type
        case 1 => Parameter
        case 2 => Init
        case 3 => MemberProperty
        case 4 => MemberFunction
        case _ => MemberVariable
    }
}

@Annotation[target: [Type, myTarget(4)]]
public class A {

   let i:Int64
   const init(i: Int64) {
      this.i = i
   }
}

@A[1]
public class B {
   @A[2]
   var a = 1

   @A[2]
   public func b() {

   }
}

@A[3]
interface C {
   @A[4]
   func b():Int64 {
      return 1
   }
}

@A[5]
public struct D {
   @A[2]
   var a = 1

   @A[4]
   public func b():Int64 {
      return 1
   }
}

@A[6]
public enum E {
   x |
   y(Int64)

   @A[4]
   public func b():Int64 {
      return 1
   }

}

main() {}

/* SCAN
error: '@A' not applicable to member variable
  ==> testTarget06.cj:26:4:
   | 
26 |    @A[2]
   |    ^^^^^ 
   | 

error: '@A' not applicable to member variable
  ==> testTarget06.cj:45:4:
   | 
45 |    @A[2]
   |    ^^^^^ 
   | 

2 errors generated, 2 errors printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
