/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_05_01_a01_01

  @Level:         1

  @Assertion:   2.5.1(1) For any two types T1 and T2, we say T1 is equivalent to T2 (denoted as 𝑇1 ≡ 𝑇2) if at least 
                one of the following conditions is satisfied:
                If T1 is defined by a type alias type T1 = T2.
                Inside the definition of class and inside the extend of class, T1 is the name of class and T2 is This.
                The names of T1 and T2 are identical (reflexive property).
                𝑇2 ≡ 𝑇1 (symmetric property).
                There exists a type 𝑇𝑘 which satisfies that 𝑇1 ≡ 𝑇𝑘 and 𝑇𝑘 ≡ 𝑇2 (transitive property).

  @Description: Check that if at least one condition is met, the types will be equivalent.

  @Mode:        run

  @Negative:    no

*/

import utils.assert.*

// If T1 is defined by a type alias type T1 = T2.
type F64Ty = Float64


// Inside the definition of class and inside the extend of class, T1 is the name of class and T2 is This.
open class C {
    func foo() { 
        this
    }
}

extend C {
    func bar() {
        this
    }
}

// The names of T1 and T2 are identical (reflexive property).
let Var1: Int32 = 96 
let Var2: Int32 = 96

// There exists a type 𝑇𝑘 which satisfies that 𝑇1 ≡ 𝑇𝑘 and 𝑇𝑘 ≡ 𝑇2 (transitive property).
type F64TyRef = F64Ty

interface I {}

open class Base <: I {}
open class Impl <: Base {}
class Impl2 <: Impl {}


main() {
    let a1: F64Ty = 0.96
    let a2: F64TyRef = 0.97
    let a3: Float64 = 0.98

    Assert.isTrue(a1 is Float64)  // equivalent
    Assert.isTrue(a2 is F64Ty)    // equivalent
    Assert.isTrue(a2 is Float64)  // transitive equivalent
    Assert.isTrue(a3 is F64TyRef) // symmetric equivalent

    let c = C()

    Assert.isTrue(c is C)        // reflexive equivalent
    Assert.isTrue(c.foo() is C)  // `This` is equivalent to class type
    Assert.isTrue(c.bar() is C)  // `This` is equivalent to class type (from extend)

    let i = Impl2()
    Assert.isTrue(i is I) // transitive equivalent

    Assert.isTrue(Var1 is Int32)
    Assert.isTrue(Var2 is Int32)
    Assert.equals(Var1, Var2)
}
