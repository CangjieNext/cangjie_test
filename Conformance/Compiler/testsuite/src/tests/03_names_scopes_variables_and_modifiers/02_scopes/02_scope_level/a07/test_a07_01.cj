/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            03_02_02_a07_01

  @Level:         1
  @Assertion:       3.2.2(7) Equivalently speaking, every time a block that is enclosed in a pair of braces {} is
                    entered, the scope level of the names defined in the block is increased.

  @Description:     Since each new level of nesting allows you to hide a variable of the level above, let's create a
                    maximum nested scope and check that all variables above are shaded.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import {utils.assert.Assert, utils.macros.*}

import std.sync.*

enum E { // 1 level
    A | B
    func f() { // 2
        @matchOrThrow[A](A)
        @matchOrThrow[A](E.A) // This note shows that the scope level is increasing.

        let a = 2
        Assert.equals(2, a)

        if (A is E) { // 3
            let a = 3
            Assert.equals(3, a)
            for (a in [4]) { // 4
                Assert.equals(4, a)
                var j = 0
                while (j == 0) { // 5
                    let a = 5
                    Assert.equals(5, a)
                    do { // 6
                        let a = 6
                        Assert.equals(6, a)
                        try { // 7
                            let a = 7
                            Assert.equals(7, a)
                            func g() { // 8
                                let a = 8
                                Assert.equals(8, a)
                                let m: Mutex = Mutex()
                                func gf<T>() { // 9
                                    let a = 9
                                    Assert.equals(9, a)
                                    synchronized (m) { // 10
                                        let a = 10
                                        Assert.equals(10, a)
                                        unsafe { // 11
                                            let a = 11
                                            Assert.equals(11, a)
                                            { a: () -> Unit => // 12
                                                match(-1) { // 13?
                                                    case a => { // 14
                                                        a: Int64 => Assert.equals(-1, a)
                                                    }(a)
                                                }
                                                Assert.isTrue(a is ()->Unit)
                                            }({ // 12.1
                                                =>
                                                let a = 121
                                                Assert.equals(121, a)
                                            })
                                            Assert.equals(11, a)
                                        }
                                        Assert.equals(10, a)
                                    }
                                    Assert.equals(9, a)
                                }
                                gf<Int64>()
                                Assert.equals(8, a)
                            }
                            g()
                            Assert.equals(7, a)

                            throw NoneValueException()
                        } catch (a: NoneValueException) { // 7.1
                            Assert.isTrue(a is NoneValueException)
                        } finally { // 7.2
                            let a = 72
                            Assert.equals(72, a)
                        }
                        Assert.equals(6, a)
                    } while (false)
                    j++
                    Assert.equals(5, a)
                }
                Assert.equals(4, a)
            }
            Assert.equals(3, a)
        }
        Assert.equals(2, a)
        A
    }
}

let A = A

main() {
    E.A.f().f().f().f().f()
    0
}
