/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a04_01

  @Level:         1

  @Assertion:    12.1.1(4) If the block after try throws an exception and it matches one of the catch blocks,
                           the corresponding catch block starts executing immediately.

  @Description:  Checks that handling the exception will start immediately in the corresponding catch-block.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
import std.ast.*

open class MyException <: Exception {}
main(ina :Array<String>) : Int32 {
    let t : Bool = Assert.getRuntimeZero(ina) == 0
    var cnt = -1
// test case #1
    try {
        cnt = 0
        if (t) {
            throw MyException()
        }
        Assert.fail(reason : "Unexpected execution.")    
    } catch (e: MyException) {
        Assert.equals(0, cnt)    
        cnt++
    } catch (_) {
        cnt = 0
    } finally {
        Assert.equals(1, cnt)    
    }

// test case #2
    cnt = -1
    var tks = Tokens()
    tks += Token(TokenKind.NL)
    try {
        cnt = 0
        func foo(): Unit{
            throw SpawnException()
        }

        foo()
        Assert.fail(reason : "Unexpected execution.")    
    } catch (e: StackOverflowError) {
        Assert.equals(0, cnt)    
        cnt++
    } catch (e: SpawnException) {
        Assert.equals(0, cnt)    
        cnt++
    } catch (_) {
        cnt = 0
    } finally {
        Assert.equals(1, cnt)    
    }


    return 0
}
