/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a27_01

  @Level:         1

  @Assertion: 2.1.10.2(27)
              struct B<X,Y> {
                B(
                  x: Int64, // primary constructor, it's name is the same as the struct
                  y: X,
                  v!: Int64 = 1, // regular parameter
                  private var z!: Y // member variable parameter
                ) {}
                /* The corresponding init constructor with primary constructor auto-generated
                by compiler.
                private var z: Y // auto generated member variable definition
                init( x: Int64, y: X, v!: Int64 = 1, z!: Y) { // auto generated named parameter definition
                this.z = z // auto generated assign expression of member variable
                }
                */
              }

  @Description: Check that the example works correctly
                and 'z' variable is initialized with the value of the correspoinding argument

  @Mode: run

  @Negative: no

  @Structure: single
*/

import utils.assert.Assert

struct B<X,Y> {
    B(
      x: Int64, // primary constructor, it's name is the same as the struct
      y: X,
      v!: Int64 = 1, // regular parameter
      private var z!: Y // member variable parameter
    ) {}
    /* The corresponding init constructor with primary constructor auto-generated
    by compiler.
    private var z: Y // auto generated member variable definition
    init( x: Int64, y: X, v!: Int64 = 1, z!: Y) { // auto generated named parameter definition
    this.z = z // auto generated assign expression of member variable
    }
    */

    func test() {
        let tmp = this.z as String
        let tmp2 = match(tmp) {
            case Some(x) => x
            case _ => "0"
        }
        Assert.equals("4", tmp2)
    }
}

main() {
    let tst = B<Int64, String>(1, 2, v: 3, z: "4")
    tst.test()
}