/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a04_02

  @Level:         1

  @Assertion:    12.1.1(4) If the block after try throws an exception and it matches one of the catch blocks,
                           the corresponding catch block starts executing immediately.

  @Description:  Checks that handling the exception will start immediately in the catch-block with WildCardPattern.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
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
    } catch (_) {
        Assert.equals(0, cnt)    
        cnt++
    } finally {
        Assert.equals(1, cnt)    
    }

// test case #2
    cnt = -1
    try {
        func f0() : Int32 {
            return 0
        }
        func f1() : Int32 {
            return 1
        }
        cnt = 0
        let r = f1() / f0()
        Assert.fail(reason : "Unexpected execution.")    
    } catch (_) {
        Assert.equals(0, cnt)    
        cnt++
    } finally {
        Assert.equals(1, cnt)    
    }

    return 0
}
