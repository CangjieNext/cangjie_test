/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a05_01

  @Level:         1

  @Assertion: 6.1.1(5)
              The following example defines a class.
              interface I1<X> {}
              interface I2 {}
              open class A{}
              // The following class B inherits class A and implements interface I2.
              open class B <: A & I2 {}
              /* The following class C declares 1 type parameters U. It inherits B and implements interfaces I1<U> and I2. Also, its type parameters have constraints U <: A */
              class C<U> <: B & I1<U> & I2 where U <: A {}

  @Description: Check that the example creates a valid class type

  @Mode: run

  @Negative: no

  @Structure: single
*/

import utils.assert.Assert

interface I1<X> {}
interface I2 {}
open class A{}

// The following class B inherits class A and implements interface I2.
open class B <: A & I2 {}
/* The following class C declares 1 type parameters U. 
It inherits B and implements interfaces I1<U> and I2. 
Also, its type parameters have constraints U <: A */
class C<U> <: B & I1<U> & I2 where U <: A {}

main() {
  var c : C<B> = C<B>()
  Assert.isTrue(c is C<B>)
  Assert.isTrue(c is B)
  Assert.isTrue(c is A)
  Assert.isTrue(c is I1<B>)
  Assert.isTrue(c is I2)
}
