/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_05_a05_04

  @Level:         1

  @Assertion: 9.3.5(5) For other generic declarations, this rule also applies to them. For example: 

              class A {} 

              class B<T> where T <: A {} 

              class C<U> where U <: B<U> {} // actual constraints are U <: A & B<U> 

              For class C, The constraints imposed on its type parameter U are actual U <: A & B<U>.

  @Description: Check parent constraint introduction for enums.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface A {}

open class B<T> where T <: A {}

enum C<U> where U <: B<U> {
    | Data(U)
    | Code(Int64)
}

class Impl <: B<Impl> & A {}

main() {
    // Constraint check should happen here:
    var x = C<Impl>.Data(Impl())

    let value = match (x) {
        case Data(t) => 1
        case Code(t) => 2
    }

    Assert.equals(1, value)
}

