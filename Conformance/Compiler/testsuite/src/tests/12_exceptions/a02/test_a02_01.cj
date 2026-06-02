/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        12_a02_01

  @Level:         1
  @Assertion:   12(2) Exceptions are abnormal behaviors that occur during the 
                execution of the program, such as index out of bounds, division
                by zero, overflow, invalid input and access to undefined objects.
  @Description: Checks that index out of bounds, division by zero and stack 
                overflow are processed correctly.
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006199,0006505

*/ 

import utils.assert.Assert
import std.ast.*

main() {

    var exceptionThrown = false

    // test case #1: index out of bounds
    try {
        let arr = [0, 1, 2]
        for (ind in [0, 1, 2, 3]) {
            let elem = arr[ind]
            println(elem)
        }
    } catch (e: IndexOutOfBoundsException) {
        exceptionThrown = true
    } catch (_) {
        Assert.fail(reason : "IndexOutOfBoundsException was not caught.")
    }
    Assert.isTrue(exceptionThrown)

    // test case #2: division by zero
    exceptionThrown = false
    var num = 3

    try {
        while (num >= 1) {
            num-- 
            let res = 1 / num
            println(res)
        }
    } catch (e: ArithmeticException) {
        exceptionThrown = true
    } catch (_) {
        Assert.fail(reason : "Division by zero was not caught.")
    }

    Assert.isTrue(exceptionThrown)


    // test case #3: stack overflow
    var tks = Tokens()
    tks += Token(TokenKind.NL)

    func foo(): Unit{
        throw SpawnException()
    }

    exceptionThrown = false  

    try {
        foo()
    } catch (e: StackOverflowError) {
         exceptionThrown = true
    } catch (e: SpawnException) {
         exceptionThrown = true
    } catch (_) {
        Assert.fail(reason : "StackOverflowError was not caught.")
    }

    Assert.isTrue(exceptionThrown)
}
