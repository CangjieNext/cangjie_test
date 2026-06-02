/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_02_a03_01

  @Level:         1

  @Assertion:    12.2(3) Note that the expression following the keyword throw can only be an object
                         inherited from Exception or Error.

  @Description:  Checks the type of object following the keyword throw can be an object
                 inherited from Exception or Error.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
import std.ast.*

main() {
// test case #1
    var tks = Tokens()
    tks += Token(TokenKind.NL)
    try {
        @When[backend == "cjnative"]
        func foo(): Unit{
            throw SpawnException()
        }

        foo()
    } catch (e: StackOverflowError) {
    } catch (e: SpawnException) {
    } catch (_) {
        Assert.fail(reason : "Expected object has to be inherited from Error class.")
    }
// test case #2
    func foo2() : Unit {
        let a : Int64 = 10
        for (i in [3, 2, 1, 0]) {
            a / i
        }
    }

    try {
        foo2()
    } catch (e: ArithmeticException) {
    } catch (_) {
        Assert.fail(reason : "Expected object has to be inherited from Exception class.")
    }
}
