/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_02_a07_02

  @Level:         1

  @Assertion:    12.2(7) The matching catch expression is identified in the reverse order of the function calls,
                         i.e., if it is first matched with catch blocks in the same try expression if there are
                         any and then those catch blocks of the try expression which invokes the containing function,
                         and so on.

  @Description:  Checks the matching catch expression is identified
                 in the reverse order of the function calls (test case #2).

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class Exception1 <: Exception {}
open class Exception2 <: Exception {}

main() {
    func f1() : Unit {
        var excep_thrown : Bool = false
        try {
            throw Exception1()
        } catch (e: Exception1) {
            excep_thrown = true        
        }
        Assert.isFalse(excep_thrown, reason : "Expected Exception1 was not caught.")
    }

    func f2() : Unit {
        var excep_thrown : Bool = false
        var try_block : Bool = false 
        try {
            f1()
            try_block = true
        } catch (e: Exception1) {
            excep_thrown = true        
        } catch (e: Exception2) {
            Assert.fail(reason : "Unexpected Exception2 thrown.")        
        }
        Assert.isFalse(try_block, reason : "No return from f1() function.")
        Assert.isFalse(excep_thrown, reason : "Expected Exception1 was not caught.")
    }

    var try_block : Bool = false
    try {
       f2()
       try_block = true
    } catch (e: Exception1) {
       Assert.fail(reason : "Unexpected Exception1  was caught.")
    } catch (_) {}

    Assert.isFalse(try_block, reason : "No return from f2() function.")
}

