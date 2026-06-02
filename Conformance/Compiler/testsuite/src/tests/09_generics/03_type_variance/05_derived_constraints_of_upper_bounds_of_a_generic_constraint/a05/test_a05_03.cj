/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_05_a05_03

  @Level:         1

  @Assertion: 9.3.5(5) For other generic declarations, this rule also applies to them. For example: 

              class A {} 

              class B<T> where T <: A {} 

              class C<U> where U <: B<U> {} // actual constraints are U <: A & B<U> 

              For class C, The constraints imposed on its type parameter U are actual U <: A & B<U>.

  @Description: Check parent constraint introduction for structs.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface A {}

open class B<T> where T <: A {}

struct C<U> where U <: B<U> {
    C(var data!: U) {}
}

class Impl <: B<Impl> & A {}

main() {
    // Constraint check should happen here:
    var x = C<Impl>(data: Impl())

    Assert.isTrue(x.data is A)
    Assert.isTrue(x.data is B<Impl>)
}

