/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a03_01

  @Level:         1

  @Comment: This assertion is a part of the list with the following heading:
            A primary constructor definition includes the following:

  @Assertion: 2.1.10.2(3)
              Modifier: optional. Primary constructors can be modified with one of
              public or private, none of which are visible within the package.
              See Access Modifiers for details

  @Description: Check that a primary constructor can be modified with any of these modifiers
                or with none.

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006179

*/

import utils.assert.Assert

var constructor_counter = 0

struct NoMods {
    NoMods() {
        constructor_counter++
    }
}

struct PublicConst {
    public PublicConst() {
        constructor_counter++
    }
}

struct PrivateConst {
    private PrivateConst() {
        constructor_counter++
    }

    init(x: Int64) {}

    func check_private() {
        let x = PrivateConst()
        Assert.equals(3, constructor_counter)
    }
}

main() {
    Assert.equals(0, constructor_counter)

    var case1 = NoMods()
    Assert.equals(1, constructor_counter)

    var case2 = PublicConst()
    Assert.equals(2, constructor_counter)

    var case3 = PrivateConst(1)
    case3.check_private()
}
