/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            03_02_02_a02_01

  @Level:         1
  @Assertion:       3.2.2(2) Scopes are nested.

  @Description:     The spec defines when scopes (if, functionDefinition, try-catch, ...) are used. The test iterates
                    over the various possible scopes and nests them into each other.

  @Mode:            run
  @Negative:        no
  @Structure:       complex-main
  @Dependencies:    aux_test_a02_01.cj
  @CompileWarning:  ignore

  @Comment:         Tested:
                      1. package scopes (IDs `S` and `E` must be visible in this file),
                      2. global scope (`C`),
                      3. class (struct, enum, ...) scopes (class name must be visible for class components like func,
                         prop, etc)
                      4. block scopes in the following order:
                         if
                           for
                             while
                               do-while
                                 try-catch-finally
                                   func def
                                     generic func def
                                       synchronized expr
                                         unsafe expr
                                           lambda def
                                             match expr
                                               lambda trailing
                                                 if

  @Issue: 0006124

*/

import {p.AuxTestA0201, p1.E}

import utils.assert.Assert

import std.sync.*

class C {
    func b1() {
        for (b2 in ["a"]) {
            Assert.equals("a", b2)
            Assert.isTrue(this is C)
        }
    }

    ~init() { // It's from spec 0.22.13
        var b3 = "b"
        while (!b3.isEmpty()) {
            Assert.equals("bc", b3)
            b3 = ""
        }
    }

    mut prop b4: Int64 {
        get() {
            do {
                Assert.isTrue(this is C)
            } while (false)
            9
        }
        set(b5) {
            try {
                Assert.equals(6, b5)
                Assert.isTrue(this is C)
                throw NoneValueException()
            } catch (b6: NoneValueException) {
                Assert.isTrue(this is C)
            }
        }
    }

    operator func -() {
        func b7() {
            Assert.isTrue(this is C)
        }
    }
}

main() {
    let a1 = 19
    if (true) {
        let a2 = 18
        for (a3 in [0]) {
            var a4 = 1
            while (a4 > 0) {
                let a5 = 16
                do {
                    let a6 = 15
                    try {
                        let a7 = 14
                        func a8() {
                            let a9: ReentrantMutex = ReentrantMutex()
                            func a10<T>() {
                                let a11: T
                                synchronized (a9) {
                                    let a12 = 13
                                    unsafe {
                                        let a13 = 12
                                        { =>
                                            let a14 = 11
                                            match(10) {
                                                case a15 => { _: ()->Unit =>
                                                    if (true) {} else {}

                                                    Assert.equals(19, a1)
                                                    Assert.equals(18, a2)
                                                    Assert.equals(0, a3)
                                                    Assert.equals(16, a5)
                                                    Assert.equals(15, a6)
                                                    Assert.equals(14, a7)
                                                    Assert.equals(13, a12)
                                                    Assert.equals(12, a13)
                                                    Assert.equals(11, a14)
                                                    Assert.equals(10, a15)
                                                }({ =>
                                                    Assert.equals(19, a1)
                                                    Assert.equals(18, a2)
                                                    Assert.equals(0, a3)
                                                    Assert.equals(16, a5)
                                                    Assert.equals(15, a6)
                                                    Assert.equals(14, a7)
                                                    Assert.equals(13, a12)
                                                    Assert.equals(12, a13)
                                                    Assert.equals(11, a14)
                                                    Assert.equals(10, a15)
                                                })
                                            }

                                            Assert.equals(19, a1)
                                            Assert.equals(18, a2)
                                            Assert.equals(0, a3)
                                            Assert.equals(16, a5)
                                            Assert.equals(15, a6)
                                            Assert.equals(14, a7)
                                            Assert.equals(13, a12)
                                            Assert.equals(12, a13)
                                        }()

                                        Assert.equals(19, a1)
                                        Assert.equals(18, a2)
                                        Assert.equals(0, a3)
                                        Assert.equals(1, a4)
                                        Assert.equals(16, a5)
                                        Assert.equals(15, a6)
                                        Assert.equals(14, a7)
                                        Assert.equals(13, a12)
                                        Assert.equals(12, a13)
                                    }

                                    Assert.equals(19, a1)
                                    Assert.equals(18, a2)
                                    Assert.equals(0, a3)
                                    Assert.equals(1, a4)
                                    Assert.equals(16, a5)
                                    Assert.equals(15, a6)
                                    Assert.equals(14, a7)
                                    Assert.equals(13, a12)
                                }

                                Assert.equals(19, a1)
                                Assert.equals(18, a2)
                                Assert.equals(0, a3)
                                Assert.equals(1, a4)
                                Assert.equals(16, a5)
                                Assert.equals(15, a6)
                                Assert.equals(14, a7)
                            }
                            a10<Unit>()

                            Assert.equals(19, a1)
                            Assert.equals(18, a2)
                            Assert.equals(0, a3)
                            Assert.equals(1, a4)
                            Assert.equals(16, a5)
                            Assert.equals(15, a6)
                            Assert.equals(14, a7)
                        }
                        a8()

                        Assert.equals(19, a1)
                        Assert.equals(18, a2)
                        Assert.equals(0, a3)
                        Assert.equals(1, a4)
                        Assert.equals(16, a5)
                        Assert.equals(15, a6)
                        Assert.equals(14, a7)

                        throw NoneValueException()
                    } catch (_: NoneValueException) {
                        let a15 = 9

                        Assert.equals(19, a1)
                        Assert.equals(18, a2)
                        Assert.equals(0, a3)
                        Assert.equals(1, a4)
                        Assert.equals(16, a5)
                        Assert.equals(15, a6)
                        Assert.equals(9, a15)
                    }
                    finally {
                        let a16 = 8

                        Assert.equals(19, a1)
                        Assert.equals(18, a2)
                        Assert.equals(0, a3)
                        Assert.equals(1, a4)
                        Assert.equals(16, a5)
                        Assert.equals(15, a6)
                        Assert.equals(8, a16)
                    }

                    Assert.equals(19, a1)
                    Assert.equals(18, a2)
                    Assert.equals(0, a3)
                    Assert.equals(1, a4)
                    Assert.equals(16, a5)

                } while (false)
                a4--

                Assert.equals(19, a1)
                Assert.equals(18, a2)
                Assert.equals(0, a3)
                Assert.equals(0, a4)
            }

            Assert.equals(19, a1)
            Assert.equals(18, a2)
            Assert.equals(0, a3)
            Assert.equals(0, a4)
        }

        Assert.equals(19, a1)
        Assert.equals(18, a2)
    } else {
        let a17 = 7

        a1  // The program should not enter here, so it makes no sense to write a runtime check Assert.equals, this
        a17 // block of code should just compile successfully.
    }
    Assert.equals(19, a1)

    let a18 = C()
    a18.b1()
    Assert.equals(9, a18.b4)
    a18.b4 = 6
    -a18

    var a19 = AuxTestA0201()
    a19.b1<C>()
    a19.b3
    a19.b3 = ReentrantMutex()
    -a19

    E.c1()
    let a20 = E.D
    Assert.equals("ф", a20.c2)
    -a20
}
