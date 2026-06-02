/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a05_01

  @Level:         1

  @Assertion:    12.1.1(5) If there is no catch block or the exception does not match any of the catch blocks,
                           the exception is thrown after evaluating the finally block.

  @Description:  Checks when try-block has no catch blocks the exception will be thrown
                 after evaluating the finally block.

  @Mode:         run         

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class MyException <: Exception {}
main() {
    var finally_block = 0
    try {
        try {
            throw MyException()
        } finally {
            finally_block = 1
        }
    } catch(_) {
       Assert.equals(1, finally_block)
    }
}
