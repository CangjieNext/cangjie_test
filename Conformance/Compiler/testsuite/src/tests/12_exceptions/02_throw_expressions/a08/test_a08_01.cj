/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_02_a08_01

  @Level:         1

  @Assertion:    12.2(8) If no matching catch block is found to handle the exception,
                         the control is transferred to the terminate function defined in the Exception class,
                         which aborts the execution of the program. 

  @Description:  Checks that a program is aborted when no matching catch block to handle the throw expression.

  @Mode:         run

  @Negative:     yes

  @Structure:    single

*/

import utils.assert.Assert

main(ina: Array<String>) {
    let rtz : Bool = Assert.getRuntimeZero(ina) == 0
    try {
        if (rtz) {
            throw IndexOutOfBoundsException()
        }
        Assert.fail(reason : "Unreachable program flow.")
    } catch (e: StackOverflowError) {
        Assert.fail(reason : "Unexpected Error occurs.")
    }
    return
}

