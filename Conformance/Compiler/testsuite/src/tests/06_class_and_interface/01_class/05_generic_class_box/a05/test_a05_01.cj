/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_05_a05_01

  @Level:         1

  @Assertion: 6.1.5(5)
              Once packaged, the packaged variable points to the instantiated object of the Box class.

  @Description: Check that the packaged variable is of the type Box and
                is a reference pointing to a value, not the value itself

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

main() {
    let case1 = Box<String>("fds")
    Assert.isTrue(case1 is Box<String>)
    Assert.isFalse(case1 is String)
    Assert.equals("fds", case1.value)
    case1.value = "qeq"
    Assert.equals("qeq", case1.value)

    let case2 = Box<Int64>(5)
    Assert.isTrue(case2 is Box<Int64>)
    Assert.isFalse(case2 is Int64)
    Assert.equals(5, case2.value)
    case2.value = 10
    Assert.equals(10, case2.value)

    let case3 = Box<Bool>(false)
    Assert.isTrue(case3 is Box<Bool>)
    Assert.isFalse(case3 is Bool)
    Assert.equals(false, case3.value)
    case3.value = true
    Assert.equals(true, case3.value)

    let case4 = Box<Array<Int64>>([1, 1, 1])
    Assert.isTrue(case4 is Box<Array<Int64>>)
    Assert.isFalse(case4 is Array<Int64>)
    Assert.equals([1, 1, 1], case4.value)
    case4.value = [0, 0]
    Assert.equals([0, 0], case4.value)

    let case5 = Box<Rune>(r'x')
    Assert.isTrue(case5 is Box<Rune>)
    Assert.isFalse(case5 is Rune)
    Assert.equals(r'x', case5.value)
    case5.value = r'u'
    Assert.equals(r'u', case5.value)
}