/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a17_01

  @Level:         1

  @Assertion:    12.1.1(17) When an instance is caught, the instance is converted to an instance
                            of class ExceptionClass.

  @Description:  Checks that the instance of thrown exceptions is correctly converted to the Exception class instance. 

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class MyException <: Exception {}
open class Exc1 <: MyException {}
open class Exc2 <: ArithmeticException {}
main() {
// test case #1
    try {
        let e = MyException()
        throw e
    } catch (e: Exception) {
        Assert.isTrue(e is Exception)
    }
// test case #2
    try {
        let e = Exc1()
        throw e
    } catch (e: Exception) {
        Assert.isTrue(e is Exception)
    }
// test case #3
    try {
        let e = Exc2()
        throw e
    } catch (e: Exception) {
        Assert.isTrue(e is Exception)
        Assert.isTrue(e is ArithmeticException)
    }
}
