// (not CJNATIVE) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

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

@Annotation[target: [Type, myTarget(4), myTarget(6)]]
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
   public func b(@A[3] i: Int64) {
      return i
   }
}

@A[3]
interface C {
   @A[4]
   func b(@A[3] i: Int64):Int64 {
      return i
   }
}

@A[5]
public struct D {
   @A[2]
   var a = 1

   @A[4]
   public func b(@A[3] i: Int64):Int64 {
      return i
   }
}

@A[6]
public enum E {
   x |
   y(Int64)

   @A[4]
   public func b(@A[3] i: Int64):Int64 {
      return i
   }

}

main() {
    let b = B()
    b.b(1)
    let d = D()
    d.b(1)
    let ex = E.x
    ex.b(1)
    0
}

/* SCAN
error: '@A' not applicable to parameter
  ==> testTarget08.cj:30:18:
   | 
30 |    public func b(@A[3] i: Int64) {
   |                  ^^^^^ 
   | 

error: '@A' not applicable to parameter
  ==> testTarget08.cj:38:11:
   | 
38 |    func b(@A[3] i: Int64):Int64 {
   |           ^^^^^ 
   | 

error: '@A' not applicable to parameter
  ==> testTarget08.cj:49:18:
   | 
49 |    public func b(@A[3] i: Int64):Int64 {
   |                  ^^^^^ 
   | 

error: '@A' not applicable to parameter
  ==> testTarget08.cj:60:18:
   | 
60 |    public func b(@A[3] i: Int64):Int64 {
   |                  ^^^^^ 
   | 

4 errors generated, 4 errors printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
