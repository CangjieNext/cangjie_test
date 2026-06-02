/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a04_03

  @Level:         1

  @Assertion:    3.2.4(4) If the name x is a variable, the variable in the upper-scope is shadowed.
                 For specific rules on masking of member variables, see Chapter of “Class and Interface”.

  @Description:  Check shadowing local variables

  @Mode:         run

  @Negative:     no

  @CompileWarning: ignore

*/

package test

import utils.assert.Assert

class C {
    var member = "some"
    C(local!: String = "red") {
        if (true) {
            func local(): String { "green" }
            member = local()
            Assert.equals("green", member)
        }

        if (true) {
            var local = "ok"
            member = local
        }
    }
}

func run(local!: String = "some") {
    let test = if (true) {
        let local = "ok"
        { => local }
    } else {
        { => local }
    }

    Assert.equals("ok", test())
}

main() {
    Assert.equals("ok", C().member)
    Assert.equals("ok", C(local: "foo").member)

    run()
    run(local: "foo")

    let local = 100
    for (local in 0..2) {
        Assert.isTrue(local < 2)
        for (local in 3..5) {
            Assert.isTrue(local > 2 && local < 100)
        }
    }
}
