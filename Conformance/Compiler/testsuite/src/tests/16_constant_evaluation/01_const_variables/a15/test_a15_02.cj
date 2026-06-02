
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a15_02

  @Level:         1

  @Assertion:   16.1(15)
                struct Foo {
                    let a = 0
                    var b = 0
                    const c = 0

                    const init () {}
                }

                func f() {
                    const v = Foo()
                    v.a = 1 // error
                    v.b = 1 // error
                    v.c = 1 // error
                }
  @Description: Checks that assigning a `var` instance member variable of a const object after it's already
                initialized results in a compile error in the given example.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

struct Foo {
    let a = 0
    var b = 0
    const c = 0

    const init () {}
}

func f() {
    const v = Foo()
    // v.a = 1 // error
    v.b = 1 // error
    // v.c = 1 // error
}

main() { }
