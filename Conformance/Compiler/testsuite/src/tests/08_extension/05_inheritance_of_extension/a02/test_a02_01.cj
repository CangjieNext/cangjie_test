/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_05_a02_01

  @Level:         1

  @Assertion:       8.5(2) 
                    open class A {}

                    extend A {
                        func f() {}
                    }

                    class B <: A {
                        func g() {
                            f() // ok
                        }
                    }

                    main() {
                        let x = B()
                        x.f() // ok
                    }

  @Description:     Positive example from spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

open class A {}

extend A {
    func f() {}
}

class B <: A {
    func g() {
        f() // ok
    }
}

main() {
    let x = B()
    Assert.isTrue(x is B)
    Assert.isTrue(x is A)
    x.f() // ok
}
