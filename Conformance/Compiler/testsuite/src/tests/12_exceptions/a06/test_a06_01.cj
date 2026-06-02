/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_a06_01

  @Level:         1
  @Assertion:    12(6) The type of the expression after throw keyword must inherit from Exception or Error class.
  @Description:  Checks that type of expression after throw keyword can inherit from Exception or Error.
  @Mode:         run         
  @Negative:     no
  @Structure:    single

*/

import utils.assert .Assert
import std.ast.*

open class MyException <: Exception {}

func err(): Error {
    err()
}

main() {
    var exceptionCaught = false
    // test case #1
    try {
        throw MyException()
    } catch(_) {
        exceptionCaught = true
    }
    Assert.isTrue(exceptionCaught)

    // test case #2
    var errorCaught = false

    var tks = Tokens()
    var num = 0
    tks += Token(TokenKind.NL)
    println(num)
    @When[backend == "cjnative"]
    func err(): Error {
        throw SpawnException()
        err()
    }

    try {
        throw err()
    } catch(e: StackOverflowError) {
        errorCaught = true
    } catch(e: SpawnException) {
        errorCaught = true
    }
    Assert.isTrue(errorCaught)
}
