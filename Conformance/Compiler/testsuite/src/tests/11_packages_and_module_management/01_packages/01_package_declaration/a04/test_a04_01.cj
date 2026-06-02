/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_01_a06_01

  @Level:         1

  @Assertion:    11.1.1(5)A package consists of one or more source code files. The source code files of a package must be in the same directory, 
                  and the source code files in the same directory must belong to the same package.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: a.cj 

*/
package a
import utils.assert.Assert

main() {
    Assert.equals("a", packageName())
    return 0
}
