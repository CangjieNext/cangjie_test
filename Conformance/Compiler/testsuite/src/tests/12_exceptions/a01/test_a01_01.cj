/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_a01_01

  @Level:         1

  @Assertion:    12(1) A software system often has to detect and handle exceptional or erroneous program behaviors.
                       To ensure the correctness and robustness of the software system, there must be program codes
                       which are dedicated to error detection and handling. Exceptions are special type of errors
                       that can be caught and handled by the programmer.

  @Description:  Checks that any exceptions can be caught and correctly handled with try expression.  

  @Mode:         run         

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
main() {
    var  res : Bool = false
// test case #1
    try {
        throw Exception()
    } catch (_) {
        res = true
    } finally {
        Assert.equals(true, res)
    }

// test case #2
    res = false
    try {
        throw Exception()
    } catch (e: Exception) {
        res = true
    } finally {
        Assert.equals(true, res)
    }

// test case #3
    res = false
    for (step in [0, 1])
    {
        try {
            if (step == 0) {
                throw OverflowException()
            } else {
                throw ArithmeticException()
            }
        } catch (e: OverflowException | ArithmeticException) {
            res = true
        } catch (_) {
            res = false
        } finally {
            Assert.equals(true, res)
        }
   }
// test case #4
    res = false
    try {
    } catch (_) {
        res = true
    } finally {
        Assert.equals(false, res)
    }
}
