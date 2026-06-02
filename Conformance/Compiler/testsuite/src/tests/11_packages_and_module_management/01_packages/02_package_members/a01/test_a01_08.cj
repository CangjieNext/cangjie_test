/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         11_01_02_a01_08

  @Level:         1

   @Assertion:    11.1.2 Package members are classes, interfaces, structs, enums, type aliases, 
                  global variables, extensions, and functions declared at the top level. 
                  For details about the contents of the top-level statement, see the corresponding sections.

   @Description:  Check that functions declared on top-level are package members

   @Mode:         run

   @Negative:     no

   @Structure:    complex-main

   @Dependencies: aux_test_a01_01.cj

 */

package package11

import utils.assert.Assert

main() {
    Assert.equals("package11", packageName())
}
