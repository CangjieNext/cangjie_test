/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_02_a10_02

  @Level:         1
  @Assertion:   1.2(10) In the index access expression, a newline character cannot be used as a separator between [
                and the token preceding it.
  @Description: Checks that newline character can be used as a separator between [ and the token preceding it.
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Comment:     The below scenario only prohibits the use of a newline character as a separator between two tokens, it
                does not mean that newline character cannot be used in this scenario (if a newline character is used,
                it is directly treated as the end of an expression or declaration).
*/
import utils.assert.Assert

main() {
    let arr = [0, 1, 2]
    let elem = arr
    [0]
    Assert.equals(elem, arr)
    return 0
}
