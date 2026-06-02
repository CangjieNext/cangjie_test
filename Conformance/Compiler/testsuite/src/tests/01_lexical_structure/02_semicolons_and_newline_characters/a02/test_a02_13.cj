/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a02_13

  @Level:         1

  @Assertion:    1.2(2) Among them, the meaning of ; is fixed and indicates the end of an expression
                        or declaration regardless of where it appears, and multiple expressions
                        or declarations separated by ; can be written on the same line.

  @Description:  Check that correct value is set by one of conditional expressions when they are on the same line
                 and separated by ';'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
func myFunc(x: Int64) {
    var s : String
    if (x > 0) {s = "positive"} else {s = "negative"} ; if (x < 0) {s = "negative"} else {s = "positive"}
    return s
}
main() {
    let x = 1
    var s = myFunc(x)
    Assert.equals("positive", s);
}
