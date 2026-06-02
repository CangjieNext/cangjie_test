/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_05_02_a01_01

  @Level:         1

  @Assertion:   2.5.2(1) For any two types T1 and T2, we say T1 is the subtype of T2 if at least one of the following
                conditions is satisfied:
                If 𝑇1 ≡ 𝑇2.
                T1 is Nothing type.
                T1 and T2 are Tuple types, and the type of each element in T1 is the subtype of the type of the 
                corresponding element in T2.
                T1 and T2 are Function types, and the parameter type of T2 is the subtype of the parameter type of 
                T1 and the return type of T1 is the subtype of the return type of T2 .
                T1 is any class/interface type, and T2 is the Object type.
                T1 and T2 are interface types, and T1 inherits T2.
                T1 and T2 are class types, and T1 inherits T2.
                T1 is a class type and T2 is an interface type, and T1 implements T2.
                There exists a type 𝑇𝑘 which satisfies that 𝑇1 <∶ 𝑇𝑘 and 𝑇𝑘 <∶ 𝑇2 (transitive property).

  @Description: Check that if at least one condition is met, the types will be subtypes.

  @Mode:        run

  @Negative:    no

*/

import utils.assert.*

interface I {}
interface I2 <: I {}

open class Base <: I {}
open class Impl <: Base & I2 {}
open class Impl2 <: Base & I2 {}
open class SuperImpl <: Impl{}

main(): Unit {
    // T1 is any class/interface type, and T2 is the Object type.
    let c1 = Base()
    let c2 = Impl()
    let c3 = ArithmeticException()
    let c4 = SuperImpl()
    Assert.isTrue(c1 is Object)
    Assert.isTrue(c2 is Object)
    Assert.isTrue(c3 is Object)
    Assert.isTrue(c4 is Object)

    // T1 and T2 are class types, and T1 inherits T2.
    Assert.isTrue(c2 is Base)

    // T1 is a class type and T2 is an interface type, and T1 implements T2.
    Assert.isTrue(c2 is I)
    Assert.isTrue(c2 is I2)

    // There exists a type 𝑇𝑘 which satisfies that 𝑇1 <∶ 𝑇𝑘 and 𝑇𝑘 <∶ 𝑇2 (transitive property).
    Assert.isTrue(c4 is Base)
    Assert.isTrue(c4 is Impl)
    Assert.isTrue(c4 is I)
    Assert.isTrue(c4 is I2)
}
