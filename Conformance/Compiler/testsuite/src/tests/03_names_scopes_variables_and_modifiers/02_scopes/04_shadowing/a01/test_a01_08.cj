/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a01_08

  @Level:         1

  @Assertion:    3.2.4(1) When two scopes overlap and the same name appears in both scopes, the name in the
                 lower-scope shadows the name in the upper-scope. As a result, the entity referred to by the
                 name in the lower-scope cannot be accessed directly through the name.

  @Description:  Check different kinds of scopes.
                 Check that name in inner local-level scope shadows name in outer local-level scope. 
                 Nested blocks cases.

  @Mode:         run

  @Negative:     no


*/

import utils.assert.Assert

struct S {
    S() {
        if (true) {
            let x = 100
            if (true) {
                let x = 200
                Assert.equals(200, x)
            }
        }
    }
}

class C {
    C() {
        if (true) {
            let x = "red"
            if (true) {
                let x: () -> Bool = { => true }
                Assert.isTrue(x())
            }
        }
    }
    func foo(inp: Array<String>) {
        if (true) {
            let x = ()
            if (true) {
                let x = 200
                let y = x + if (x + Assert.getRuntimeZero(inp) == 200) {
                                if (x + Assert.getRuntimeZero(inp) == 200) {
                                    let x = 2000
                                    x + x
                                } else {
                                    0
                                }
                            } else {
                              -1000
                            }
                Assert.equals(4200, y)
            }
        }
    }
}

func bar(x: Int32): Unit {
    match (x) {
        case 10 => if (true) {
                       var x = 200
                       Assert.equals(200, x)
                   }
        case _ => ()
    }
}

main(inp: Array<String>) {
    if (true) {
        let x = 100
        if (true) {
            func x(): Int32 { 200 }
            Assert.equals(200, x())
        }
    }

    bar(10)

    let l: (Int32) -> Unit = {
        x => if (true) {
                 var x = 200
                 Assert.equals(200, x)
             }
    }

    l(10)

    var s = S()
    var c = C()
    c.foo(inp)
}
