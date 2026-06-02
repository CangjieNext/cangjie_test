/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a30_06

  @Level:         1

  @Assertion:   6.1.2.2(30) Initialization analysis rules is demonstrated by the following example:
                class Foo {
                    static let a: Int64
                    static var c: Int64
                    static var d: Int64 // error: uninitialized variable
                    static var e: Int64 = 2
                    static let f: Int64 // error: uninitialized variable
                    static let g: Int64 = 1

                    let x=c

                    static init () {
                        a = 1
                        b = 2

                        Foo.c // error: not yet initialized variable
                        let anotherFoo = Foo()
                        anotherFoo.x // error: not yet initialized variable

                        c = 3
                        e = 4
                        g = 2 // error: reassignment
                    }
                    static let b: Int64
                }
  @Description: Checks that in the example reassigning immutable static variable `g` in the static initializer causes a
                compilation error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136, 6594

*/

class Foo {
    static let a: Int64
    static var c: Int64
    // static var d: Int64 // error: uninitialized variable
    static var e: Int64 = 2
    // static let f: Int64 // error: uninitialized variable
    static let g: Int64 = 1

    let x = c

    static init () {
        a = 1
        b = 2

        // Foo.c // error: not yet initialized variable
        let anotherFoo = Foo()
        // anotherFoo.x // error: not yet initialized variable

        c = 3
        e = 4
        g = 2 // error: reassignment
    }

    static let b: Int64
}

main() { }
