// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

class E1 {}

class E2 {}

interface I {
    static func foo(): E1 {
        return E1()
    }
}

class D<T> where T <: C1 & I {
    public func foo() {
        return T.foo()
    }
}

class C1 <: I {
    public static func foo(): E2 {
        return E2()
    }
}

main() {
    let obj = D<C1>().foo()
    return 1
}

/* SCAN
error: return type of 'foo' is not identical or not a subtype of the overridden/redefined/implement function
  ==> access_by_parameter_interface_10.cj:26:24:
   | 
26 |     public static func foo(): E2 {
   |                        ^^^ 
   | 
note: 'Class-E2' is not a subtype of 'Class-E1'
  ==> access_by_parameter_interface_10.cj:14:17:
   | 
14 |     static func foo(): E1 {
   |                 ^^^ 
   | 

error: return type of the inherited function members 'foo' are not identical and not in subtype relation
  ==> access_by_parameter_interface_10.cj:19:18:
   | 
19 | class D<T> where T <: C1 & I {
   |                  ^^^^^^^^^^^ 
   | 
   # note: conflict types are 'Class-E1', 'Class-E2'

2 errors generated, 2 errors printed.
*/
