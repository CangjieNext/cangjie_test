/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_03_a03_01

  @Level:         1

  @Assertion:    12.1.1.3(3) - If an an exception E3 is thrown during the evaluation of e3,
                               the try expression throws the exception E3.

  @Description:  Checks the try expression throws an exception thrown
                 during the evaluation of expression in the finally block.

  @Mode:	 run         

  @Negative:     no

  @Comment:      Given a try expression try {e1} catch (catchPattern) {e2} finally {e3},
                 its evaluation has the following cases.

  @Structure:    single

*/

import utils.assert.Assert
open class MyException <: Exception {}
func f1() : Unit {
    throw IndexOutOfBoundsException()
}
func f2() : Unit {
    throw MyException()
}

main() {
    try {
        let expr =  try {
                    } catch (_) {
                    } finally {
                        for (ind in [0, 1]) {
                            if (ind == 0) {
                                f1()
                            } else {
                                f2()
                            }
                        }
                    }
    } catch (e: Exception) {
        Assert.isTrue(e is IndexOutOfBoundsException)    
    }
}
