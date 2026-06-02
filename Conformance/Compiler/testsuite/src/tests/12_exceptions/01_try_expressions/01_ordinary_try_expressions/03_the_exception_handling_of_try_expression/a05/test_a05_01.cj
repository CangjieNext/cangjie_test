/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_03_a05_01

  @Level:         1

  @Assertion:    12.1.1.3(5) 3. Assume that an exception E1 is thrown during the evaluation of e1,
                                and no exception is thrown during the evaluation of e3, then:
                                1. If the exception E1 is caught by a catch block and no exception is thrown during
                                   the evaluation of e2, then the try expression will not throw an exception.

  @Description:  Checks that no exception is thrown for try expression if an exception thrown in the try block
                 is caught with catch block and finally block does not throw.  

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class MyException <: Exception {}
func foo() : Unit {
    throw IndexOutOfBoundsException()
}
func no_exception() : Unit {}
main() {
    try {
        let e = try {
                    foo()
                } catch (e: IndexOutOfBoundsException) {
                    no_exception()
                } finally {
                    no_exception()
                }
    } catch (_) {
        Assert.fail(reason : "unexpected exception")
    }
}
