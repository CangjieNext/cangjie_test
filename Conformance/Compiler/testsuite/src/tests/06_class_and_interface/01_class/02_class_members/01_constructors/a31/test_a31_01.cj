/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a31_01

  @Level:         1

  @Assertion: 6.1.2.1(31)
              open class A<X> {
                A(protected var x: Int64, protected var y: X) {
                  this.x = x
                  this.y = y
                }
              }
              class B<X> <: A<X> {
                B( // primary constructor, it's name is the same as the class
                  x: Int64, // regular parameter
                  y: X, // regular parameter
                  v!: Int64 = 1, // regular parameter
                  private var z!: Int64 = v // member variable parameter
                  ) {
                  super(x, y)
                }
                /* The corresponding init constructor with primary constructor auto-generated
                by compiler.
                private var z: Int64 // auto generated member variable definition
                init( x: Int64,
                y: X,
                v!: Int64 = 1,
                z!: Int64 = v) { // auto generated named parameter definition
                super(x, y)
                this.z = z // auto generated assign expression of member variable
                }
                */
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single
*/

import utils.assert.Assert

open class A<X> {
  A(protected var x: Int64, protected var y: X) {
    this.x = x
    this.y = y
  }
}
class B<X> <: A<X> {
  B( // primary constructor, it's name is the same as the class
    x: Int64, // regular parameter
    y: X, // regular parameter
    v!: Int64 = 1, // regular parameter
    private var z!: Int64 = v // member variable parameter
  ) {
  super(x, y)
  }
  /* The corresponding init constructor with primary constructor auto-generated
  by compiler.
  private var z: Int64 // auto generated member variable definition
  init( x: Int64,
  y: X,
  v!: Int64 = 1,
  z!: Int64 = v) { // auto generated named parameter definition
  super(x, y)
  this.z = z // auto generated assign expression of member variable
  }
  */
  func test() {
    Assert.equals(3, this.z)
  }
}

main() {
  let tst = B<Int64>(1, 2, v: 3)
  Assert.equals(1, tst.x)
  Assert.equals(2, tst.y)
  tst.test()
}