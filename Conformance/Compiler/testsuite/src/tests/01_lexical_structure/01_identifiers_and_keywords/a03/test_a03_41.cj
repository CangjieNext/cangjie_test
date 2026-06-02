/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_01_a03_41

  @Level:         1

  @Assertion:    1.1(3) An ordinary identifier is a string (not including keywords)
                 that beginning with a letter and followed by any length of letters,
                 digits or underscores.

  @Description:  Check if symbol '_' is allowed as a start symbol of
                 an identifier.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0005865,0006598

*/

import utils.assert.Assert

main() {
    var _A : Int32 = 123456789
    Assert.equals(123456789, _A)
}
