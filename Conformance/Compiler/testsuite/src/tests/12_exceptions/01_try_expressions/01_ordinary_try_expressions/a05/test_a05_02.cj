/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a05_02

  @Level:         1

  @Assertion:    12.1.1(5) If there is no catch block or the exception does not match any of the catch blocks,
                           the exception is thrown after evaluating the finally block.

  @Description:  Checks the exception does not match any of the catch blocks, it wiil be thrown
                 after evaluating the finally block.

  @Mode:         run         

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class E1 <:  Exception {}
open class E2 <:  Exception {}
open class E3 <:  Exception {}
open class E4 <:  Exception {}
open class E5 <:  Exception {}
open class MyException <:  Exception {}
main() {
    var finally_block = 0
    try {
        try {
            throw MyException()
        } catch (e: E1 | E2 | E3) {
        } catch (e: E4) {
        } catch (e: E5) {
        } finally {
            finally_block = 1
        }
    } catch(_) {
       Assert.equals(1, finally_block)
    }
}
