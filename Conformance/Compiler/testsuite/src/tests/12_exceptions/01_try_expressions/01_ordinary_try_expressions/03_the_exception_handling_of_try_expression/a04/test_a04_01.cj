/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_03_a04_01

  @Level:         1

  @Assertion:    12.1.1.3(4) 2. If an exception E1 is thrown during the evaluation of e1,
                                and an exception E3 is thrown during the evaluation of e3,
                                the try expression throws the exception E3
                                (regardless of whether E1 is caught by the catch block).

  @Description:  Checks that try expression throws e3 exception if exception e1 is thrown 
                 in try block and exception e3 is thrown in finally block.

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
// test case #1
    try {
        let expr =  try {
                        f1()
                    } catch (e: IndexOutOfBoundsException) {
                    } finally {
                        f2()
                    }
    } catch (e: Exception) {
        Assert.isTrue(e is MyException)    
    }

// test case #2
    try {
        let expr =  try {
                        f1()
                    } finally {
                        f2()
                    }
    } catch (e: Exception) {
        Assert.isTrue(e is MyException)    
    }
}
