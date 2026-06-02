/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_05_a02_02

  @Level:         1

  @Assertion: 6.1.5(2)
              The class is defined as follows.
              It has a unique variable value declared by var and a unique constructor function init.
              The parameter type of the constructor function is T.
              class Box<T> {
                var value: T
                init(value: T) {
                  this.value = value
                }
              }

  @Description: Check that is a Class, meaning it's a subtype of Object

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006302

*/

import utils.assert.Assert

main() {
    let case1 = Box<Unit>(())
    Assert.isTrue(case1 is Object)

    let case2 = Box<String>("")
    Assert.isTrue(case2 is Object)

    let case3 = Box<() -> Int64>({ => 1})
    Assert.isTrue(case3 is Object)

    let case4 = Box<(String, String)>(("", ""))
    Assert.isTrue(case4 is Object)

    let case5 = Box<ToString>(13)
    Assert.isTrue(case5 is Object)

    let case6 = Box<Any>(0)
    Assert.isTrue(case6 is Object)

    let case7 = Box<IntNative>(8)
    Assert.isTrue(case7 is Object)
}
