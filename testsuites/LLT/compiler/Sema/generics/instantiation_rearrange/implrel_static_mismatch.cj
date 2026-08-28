// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#4 implementation-relation status branch (static), negative.
// IsImplementationFunc returns noRelation (L215) when srcFunc.STATIC differs from
// superFunc.STATIC, i.e. a static member and a same-named instance member are never an
// implementation/override relation. When a generic class inherits an interface, a static
// method in the class sharing a name with an interface instance method is a status mismatch
// negative; the compiler must reject it (it cannot count as an override).

// EXEC-PIPE-1: %compiler %cmp_opt %enableO2 %f 2>&1 | compare %f

interface I1<T> {
    func greet(t: T) {
        println("instance")
    }
}

class C <: I1<Int64> {
    // Static greet vs interface instance greet: status mismatch, IsImplementationFunc
    // returns noRelation, so it cannot count as an override -- the compiler reports the
    // same-name conflict.
    public static func greet(t: Int64) {
        println("static")
    }
}

main() {}

/* SCAN
error: static member 'greet' cannot have the same name with non-static member in parent class or interfaces
  ==> implrel_static_mismatch.cj:26:5:
   | 
26 |     public static func greet(t: Int64) {
   |     ^ 
   | 

1 error generated, 1 error printed.
*/
