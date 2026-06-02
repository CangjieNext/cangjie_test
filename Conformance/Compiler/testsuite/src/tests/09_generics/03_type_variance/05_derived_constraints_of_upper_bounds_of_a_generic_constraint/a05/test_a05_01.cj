/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_05_a05_01

  @Level:         1

  @Assertion: 9.3.5(5) For other generic declarations, this rule also applies to them. For example: 

              class A {} 

              class B<T> where T <: A {} 

              class C<U> where U <: B<U> {} // actual constraints are U <: A & B<U> 

              For class C, The constraints imposed on its type parameter U are actual U <: A & B<U>.

  @Description: Check the example provided.

  @Mode: compileonly

  @Negative: yes

  @Issue: 0006259

*/

import utils.assert.Assert

open class A {}

open class B<T> where T <: A {}

open class C<U> where U <: B<U> {
    init(arg: U) {
        data = arg
    }

    var data: U
}

class Impl <: A & B<Impl> {}

main() {
    // Constraint check should happen here:
    var x = C<Impl>(Impl())

    Assert.isTrue(x.data is A)
    Assert.isTrue(x.data is B<Impl>)
}

