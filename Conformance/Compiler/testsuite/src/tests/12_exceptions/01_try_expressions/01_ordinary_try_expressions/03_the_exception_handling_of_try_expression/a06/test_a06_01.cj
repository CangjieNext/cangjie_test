/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_03_a06_01

  @Level:         1

  @Assertion:    12.1.1.3(6) 2. If the exception E1 is caught by a catch block and an exception E2 is thrown
                                during the evaluation of e2, then the try expression throws the exception E2. 

  @Description:  Checks that the try expression throws an exception that was thrown in the catch block of expression.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class MyException <: Exception {}
func f1() : Unit {
    throw IndexOutOfBoundsException()
}
func f2() : Unit {
    throw MyException()
}
main() {
    try {
        let e = try {
                    f1()
                } catch (e: IndexOutOfBoundsException) {
                    f2()
                } finally {}
    } catch (e: Exception) {
        Assert.isTrue(e is MyException)
    }
}

