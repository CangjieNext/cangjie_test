/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_02_a09_01

  @Level:         1

  @Assertion:    12.2(9) The following example shows the scenario where an exception is caught
                         at different program locations. 
                         // Caught by catchE(). 
                         func catchE() { 
                             let listTest = [0, 1, 2] 
                             try { 
                                 throwE() // caught by catchE() 
                             } catch (e: ArrayIndexOutOfBoundsException) { 
                                 print("an ArrayIndexOutOfBoundsException happened: " + e.toString())
                             } 
                         } 

                         // Terminate function is executed. 
                         func notCatchE() { 
                             let listTest = [0, 1, 2] 
                             throwE() 
                         } 

                         func throwE() { 
                             throw IndexOutOfBoundsException() 
                         }

  @Description:  Checks that the example from specification work correctly.

  @Mode:         run

  @Negative:     no

  @Issue:        0006474

  @Structure:    single

*/

import utils.assert.Assert

main() {
    func throwE() { 
        throw IndexOutOfBoundsException() 
    }

    func catchE() {
        var catch_block : Bool = false 
        let listTest = [0, 1, 2] 
        try { 
            throwE() // caught by catchE() 
        } catch (e: IndexOutOfBoundsException) { 
            print("an IndexOutOfBoundsException happened: " + e.toString()) 
            catch_block = true
        } 
        Assert.isTrue(catch_block)
    } 
    
    // Terminate function is executed. 
    func notCatchE() { 
        let listTest = [0, 1, 2] 
        throwE() 
    } 

    var exception_caught : Bool

    // test case #1
    exception_caught = false
    try {
        notCatchE()    
    } catch (e: IndexOutOfBoundsException) {
        exception_caught = true
    }
    Assert.isTrue(exception_caught)

    // test case #2
    exception_caught = false
    try {
        catchE()   
    } catch (e: IndexOutOfBoundsException) {
        exception_caught = true
    }
    Assert.isFalse(exception_caught)
}

