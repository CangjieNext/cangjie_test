/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_03_a07_01

  @Level:         1

  @Assertion:    12.1.1.3(7) 3. If the exception E1 is not caught by the catch blocks,
                                the try expression throws the exception E1.

  @Description:  Checks the try expression will throw an exception that was generated in the try block
                 and was not caught with catch block of expression.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class MyException <: Exception {}
func foo() : Unit {
    throw IndexOutOfBoundsException()
}
main() {
    try {
        let e = try {
                    foo()
                } catch (e: MyException) {
                } finally {}
    } catch (e: Exception) {
        Assert.isTrue(e is IndexOutOfBoundsException)
    }
}

