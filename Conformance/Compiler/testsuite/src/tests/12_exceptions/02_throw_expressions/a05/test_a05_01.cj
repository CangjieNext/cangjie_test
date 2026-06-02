/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_02_a05_01

  @Level:         1

  @Assertion:    12.2(5) The following is an example throwing an exception: 
                         // Catch with exceptionTypePattern. 
                         let listTest = [0, 1, 2] 
                         try { 
                             throw ArithmeticException() 
                             let temp = listTest[0] + 1 // Will never be executed. 
                         } catch (e: ArithmeticException) { 
                             print("an arithmeticException happened: " + e.toString()) 
                         } finally { 
                             print("the finally block is executed") 
                         } 

  @Description:  Checks an example from specification is executed correctly.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main(ina: Array<String>) {
    let rtz : Bool = Assert.getRuntimeZero(ina) == 0
    var catch_block : Bool = false
    var finally_block : Bool = false
    let listTest = [0, 1, 2] 
    try { 
        if (rtz) {
            throw ArithmeticException() 
        }
        let temp = listTest[0] + 1 // Will never be executed. 
    } catch (e: ArithmeticException) {
        catch_block = true
        print("an arithmeticException happened: " + e.toString())
                
    } finally { 
        finally_block = true
        print("the finally block is executed") 
    } 
    Assert.isTrue(catch_block)
    Assert.isTrue(finally_block)
}

