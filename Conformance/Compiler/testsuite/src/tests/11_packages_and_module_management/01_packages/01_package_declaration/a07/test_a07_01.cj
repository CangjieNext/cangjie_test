/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         test_a07_01

  @Level:         1

  @Assertion:    11.1.1(4)The package declaration must be on the first line of the file (not counting comments and white space characters),
                   and each file can have only one `package` declaration

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

*/
import utils.assert.Assert
package a


main() {
    Assert.equals("a", packageName())
    return 0
}
