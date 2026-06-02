/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_04_a10_01

  @Level:         1
  @Assertion:       2.1.10.4(10) Outside the struct definition, instance member variables and instance member functions
                    can only be accessed through the struct instance, and static member variables and static member
                    functions can only be accessed through the name of the struct type.

  @Description:     Check that instance member variables and instance member functions can be accessed through the
                    struct instance outside the struct definition.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

struct S {
    let v = 1
    var v1 = 2

    func f() { 3 }
    func t<T>() { 4 }
}

main() {
    Assert.equals(1, S().v)
    Assert.equals(2, S().v1)
    Assert.equals(3, S().f())
    Assert.equals(4, S().t<Nothing>())
}
