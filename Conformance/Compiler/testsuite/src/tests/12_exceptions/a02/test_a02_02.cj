/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        12_a02_02

  @Level:         1
  @Assertion:   12(2) Exceptions are abnormal behaviors that occur during the 
                execution of the program, such as index out of bounds, division
                by zero, overflow, invalid input and access to undefined objects.
  @Description: Checks invalid input.
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006505

*/

import utils.assert.Assert

main(str: Array<String>): Unit {
    try {
        str[0]
    } catch (e: IndexOutOfBoundsException) {
        Assert.pass()
    } catch (_) {
        Assert.fail(reason : "No IndexOutOfBoundsException caught.")
    } finally {
    }

    Assert.fail(reason : "No exception caught")
}
