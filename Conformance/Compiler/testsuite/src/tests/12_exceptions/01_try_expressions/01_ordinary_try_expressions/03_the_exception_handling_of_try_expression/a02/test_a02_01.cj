/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_03_a02_01

  @Level:         1

  @Assertion:    12.1.1.3(2) - If no exception is thrown during the evaluation of e3,
                               the try expression does not throw any exception.

  @Description:  Checks that try block doesn't throw any exeptions if no exception is thrown
                 during the evaluation of for try and finaly block expressions.

  @Mode:          run

  @Negative:      no

  @Structure:    single

*/

import utils.assert.Assert
func foo() : Unit {
    var j : Int32 = 0
    for (ind in [0, 1, 2]) {
        j++
    }
}

main(ina :Array<String>) {
    try {
        var finally_block : Bool = Assert.getRuntimeZero(ina) != 0
        let e = try {
            if (finally_block) {
                Assert.fail()    
            }  
        } finally {
            finally_block = true
            foo()
        }
    } catch (_) {
        Assert.fail()
    }
}
