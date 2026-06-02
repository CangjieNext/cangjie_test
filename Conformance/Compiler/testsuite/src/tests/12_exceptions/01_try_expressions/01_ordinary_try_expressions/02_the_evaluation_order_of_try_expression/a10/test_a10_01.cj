/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_02_a10_01

  @Level:         1

  @Assertion:    12.1.1.2(10) In conclusion, a finally block will be executed anyway.

  @Description:  Checks that the final block will be executed anyway.

  @Mode:	 run         

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
import std.ast.*

main() {
    var finally_block_executed : Bool
// test case #1
    finally_block_executed = false
    try {
    } finally {
        finally_block_executed = true
    }
    Assert.isTrue(finally_block_executed, reason : "test #1 failed.")
// test case #2
    finally_block_executed = false
    try {
        throw Exception()
    } catch (_) {
    } finally {
        finally_block_executed = true
    }
    Assert.isTrue(finally_block_executed, reason : "test #2 failed.")
// test case #3
    var catch_block_executed : Bool = false
    finally_block_executed = false
    func foo() : Unit {
        foo()
    }
    var tks = Tokens()
    tks += Token(TokenKind.NL)
    try {
        func foo(): Unit{
            throw SpawnException()
        }

        foo()
    } catch (e: StackOverflowError) {
        catch_block_executed = true
    } catch (e: SpawnException) {
        catch_block_executed = true
    } finally {
        finally_block_executed = true
    }
    Assert.isTrue(catch_block_executed, reason : "test #3 failed : catch.")
    Assert.isTrue(finally_block_executed, reason : "test #3 failed : finally.")
    return 0
}
