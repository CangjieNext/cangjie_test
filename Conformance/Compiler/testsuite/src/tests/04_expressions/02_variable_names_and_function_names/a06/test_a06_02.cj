/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_02_a06_02

  @Level:         1

  @Assertion: 4.2(6) The instance member variables of struct and class are
              always mutable in their constructors, regardless of whether they
              are declared with let or var.
  @Description: Checks that instance member variables declared by var are always 
                mutable in the struct constructor.
  @Mode: run
  @Negative: no
  @CompileWarning: no
  @Structure: single

*/

import utils.assert.Assert

struct S {
    var Id = 12345
    var name: String

    init() {      
        Assert.equals(12345, Id)

        Id = Assert.getRuntimeZero()
        name = "Nick"
        Assert.equals("Nick", name)

        Id = 1
        name = "Tom"
        Assert.equals(1, Id)
        Assert.equals("Tom", name)

        Id = 123
        name = "John"
        Assert.equals(123, Id)
        Assert.equals("John", name)
    }

    S(iid: Int64, iname: String) {      
        Assert.equals(12345, Id)

        Id = iid
        name = iname
        Assert.equals(iid, Id)
        Assert.equals(iname, name)

        Id = 1
        name = "Tom"
        Assert.equals(1, Id)
        Assert.equals("Tom", name)

        Id = 123
        name = "John"
        Assert.equals(123, Id)
        Assert.equals("John", name)
    }      
}

main() {
    S()
    S(Assert.getRuntimeZero(), "Nick")
    return
}