/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a15_01

  @Level:         1

  @Assertion:    12.1.1(15)  A type pattern catches instances of a specific exception class or subclasses
                             of the exception class.

  @Description:  Checks that the type pattern ctaches the instances of a specific exception and its subclasses.

  @Mode:         run         

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class MyArithmeticException <: ArithmeticException {}
open class Exc <: MyArithmeticException {}
main() {
    var execp_caught : Bool = false
// test case #1
    try {
        throw ArithmeticException()
    } catch (e: ArithmeticException) {
        execp_caught = true        
    } catch (_) {
        Assert.fail()
    }
    Assert.isTrue(execp_caught)

// test case #2
    execp_caught = false
    try {
        throw MyArithmeticException()
    } catch (e: MyArithmeticException) {
        execp_caught = true        
    } catch (_) {
        Assert.fail()
    }
    Assert.isTrue(execp_caught)

// test case #3
    execp_caught = false
    try {
        throw MyArithmeticException()
    } catch (e: MyArithmeticException) {
        execp_caught = true        
    } catch (e: ArithmeticException) {
        Assert.fail()
    } catch (_) {
        Assert.fail()
    }
    Assert.isTrue(execp_caught)

// test case #4
    execp_caught = false
    try {
        let arr : Array<Int32> = [0, 1, 2]
        for (ind in [2, 1, 0]) {
            arr[ind] / arr[ind]
        }
    } catch (e: MyArithmeticException) {
        Assert.fail()
    } catch (e: ArithmeticException) {
        execp_caught = true        
    } catch (_) {
        Assert.fail()
    }
    Assert.isTrue(execp_caught)

// test case #5
    execp_caught = false
    try {
        throw Exc()
    } catch (e: Exc) {
        execp_caught = true        
    } catch (e: MyArithmeticException) {
        Assert.fail()
    } catch (e: ArithmeticException) {
        Assert.fail()
    } catch (_) {
        Assert.fail()
    }
    Assert.isTrue(execp_caught)

// test case #6
    execp_caught = false
    try {
        throw IndexOutOfBoundsException()
    } catch (e: IndexOutOfBoundsException) {
        execp_caught = true        
    } catch (_) {
        Assert.fail()
    }
    Assert.isTrue(execp_caught)

// test case #7
    execp_caught = false
    let myArray : Array<Float64> = [1.0]
    try {
        for (ind in [0, 1]) {
            myArray[ind]
        }        
    } catch (e: IndexOutOfBoundsException) {
        execp_caught = true        
    } catch (_) {
        Assert.fail()
    }
    Assert.isTrue(execp_caught)
}
