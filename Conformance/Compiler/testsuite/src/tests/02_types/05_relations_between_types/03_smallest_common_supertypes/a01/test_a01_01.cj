/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_05_03_a01_01

  @Level:         1

  @Assertion:   2.5.3(1) In a type system with subtypes, there are cases where the least common parent of two types 
                is required, e.g. the type of an if expression is the least common parent of the types of its two 
                branches, and a match expression is similar.
                The smallest common supertype of two types is the smallest of their common supertypes. Smallest means
                that it is a subtype of all other common supertypes.
                The smallest common supertype is defined as follows: 
                for any two types T1 and T2, LUB is the smallest common supertype of T1 and T2 if the type LUB 
                satisfies the following:
                LUB <: T also holds for any type T that satisfies both T1 <: T and T2 <: T.
                Note that if LUB is no larger than the other common supertypes, then it is only necessarily the
                minimum but just a minimal.

  @Description: Check that if at least one condition is met, the type will be smallest common supertype.

  @Mode:        run

  @Negative:    no

*/

import utils.assert.*

open class Base {}
open class A <: Base {}
class B <: A{}
class C <: A{}
class Other {}


main(): Unit {
    let rtBool: Bool = Assert.getRuntimeZero([]) == 0

    // Check that the if expression type is the least common parent of the types of its two branches

    let ifExpr1: A = if (rtBool) { B() } else  { C() }

    let ifExpr2: A = if (rtBool) { A() } else  { C() }

    let ifExpr3: Base = if (!rtBool) { Base() } else  { B() }
        
    let ifExpr4: Object = if (!rtBool) { Base() } else  { Other() }

    Assert.isTrue(ifExpr1 is A)
    Assert.isTrue(ifExpr2 is Base)
    Assert.isTrue(ifExpr3 is Base)
    Assert.isTrue(ifExpr4 is Object)

    // Check that the match expression type is the least common parent of the types of its two branches
    let matchExpr1: A = match (rtBool) {
        case true => C()
        case false => B()
    }
    Assert.isTrue(matchExpr1 is C)

    let matchExpr2: Object = match (!rtBool) {
        case true => Base()
        case false => Other()
    }
    Assert.isTrue(matchExpr2 is Other)

    let matchExpr3: Base = match (rtBool) {
        case true => A()
        case false => Base()
    }
    Assert.isTrue(matchExpr3 is A)
}
