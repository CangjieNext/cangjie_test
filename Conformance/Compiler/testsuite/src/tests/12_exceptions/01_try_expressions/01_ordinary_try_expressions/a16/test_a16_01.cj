/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a16_01

  @Level:         1

  @Assertion:    12.1.1(16) A type pattern can be written in two forms.
                            -  identifier: ExceptionClass. In this form, instances of the class ExceptionClass
                               and that of its subclasses are caught. 

  @Description:  Checks the type patterns for Exception class and its subclasses.

  @Mode:	 run        

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class MyException <: Exception {}
main() {
   var exception_caught : Bool = false
// test case #1
    try {
        throw Exception()
    } catch (e: Exception) {
        exception_caught = true
    }
    Assert.equals(true, exception_caught)
// test case #2
    exception_caught = false
    try {
        throw MyException()
    } catch (e: MyException) {
        exception_caught = true
    }
    Assert.equals(true, exception_caught)
// test case #3
    exception_caught = false
    func f() : Unit {
        let arr : Array<Int32> = [0, 1, 2]
        var arr1: Array<Int32> = [0, 0, 0]
        var ind = 2
        while (ind >= 0) {
            arr1[ind] = arr[ind] / arr[ind]
            ind--
        }
    }
    try {
        try {
            f()
        } finally {}
    } catch (e: ArithmeticException) {
        exception_caught = true
    }
    Assert.equals(true, exception_caught)
}
