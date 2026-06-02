/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a19_01

  @Level:         1

  @Assertion:    12.1.1(19) - identifier: ExceptionClass_1 | ExceptionClass_2 | ... | ExceptionClass_n. In this form,
                              multiple exception classes can be concatenated
                              using the connector |. The connector | intuitively means or,
                              i.e., this pattern catches instances of the class ExceptionClass_1 and that of
                              its subclasses, or instances of the class ExceptionClass_2 and that of its subclasses,
                              and so on.

  @Description:  Checks how second form of exceptions thru the connector '|' works for catch-block 

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class Exc0 <: Exception {}
open class Exc1 <: Exception {}
open class Exc2 <: Exception {}

open class Exc0_0 <: Exc0 {}
open class Exc1_1 <: Exc1 {}
open class Exc2_2 <: Exc2 {}

main() {
    var exception_caught : Bool = false
    var ind = 0
// test case #1
    do {
        try {
            if (ind == 0) {
                throw Exc0()
            }
            if (ind == 1) { 
                throw Exc1()
            }
            if (ind == 2) { 
                throw Exc2()
            }
        } catch (e: Exc0 | Exc1 | Exc2) {
             exception_caught = true
        }
        Assert.equals(true, exception_caught)
        exception_caught = false
        ind++
    } while (ind < 3)

// test case #2
    ind = 0
    do {
        try {
            if (ind == 0) {
                throw Exc0_0()
            }
            if (ind == 1) { 
                throw Exc1_1()
            }
            if (ind == 2) { 
                throw Exc2_2()
            }
        } catch (e: Exc0_0 | Exc1_1 | Exc2_2) {
             exception_caught = true
        }
        Assert.equals(true, exception_caught)
        exception_caught = false
        ind++
    } while (ind < 3)

// test case #3
    exception_caught = false

    func f1() : Unit {
        let arr : Array<Int32> = [0, 1, 2]
        var arr1: Array<Int32> = [0, 0, 0]
        var ind = 2
        while (ind >= 0) {
            arr1[ind] = arr[ind] / arr[ind]
            ind--
        }
    }

    func f2() : Unit {
        throw Exc0()
    }

    ind = 0
    do {
        try {
            if (ind == 0) {
                f1()
            }
            if (ind == 1) {
                f2()
            }
        } catch (e: Exc0 | ArithmeticException) {
             exception_caught = true
        }
        Assert.equals(true, exception_caught)
        exception_caught = false
        ind++
    } while (ind < 2)
}
