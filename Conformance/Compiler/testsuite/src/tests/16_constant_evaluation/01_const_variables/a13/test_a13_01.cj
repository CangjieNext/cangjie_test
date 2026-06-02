
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a13_01

  @Level:         1

  @Assertion:   16.1(13)
                struct Foo {
                    let a = 0
                    var b = 0
                    const c = 0

                    const init() {}

                    func f1() {}
                    const func f2() {}
                    mut func f3() {
                        b = 123
                    }
                }

                main(): Int64 {
                    const v = Foo()
                    print(v.a) // ok
                    print(v.b) // ok
                    print(v.c) // ok
                    v.f1() // ok
                    v.f2() // ok
                    v.f3() // error, f3 is mut function
                    return 0
                }
  @Description: Checks the positive cases in the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

struct Foo {
    let a = 0
    var b = 0
    static const c = 0

    const init() {}

    func f1() {}
    const func f2() {}
    mut func f3() {
        b = 123
    }
}

main(): Int64 {
    const v = Foo()
    print(v.a) // ok
    print(v.b) // ok
    print(Foo.c) // ok
    v.f1() // ok
    v.f2() // ok
    Assert.equals(0, v.a)
    Assert.equals(0, v.b)
    Assert.equals(0, Foo.c)
    return 0
}
