/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         11_01_02_a01_16

  @Level:         1

   @Assertion:    11.1.3 The semantics of different access modifiers when decorating non-top-level members are as follows:
                  `private` means visible only within the current type or extension definition.

   @Description:  Check that functions declared on top-level are package members

   @Mode:         compileOnly

   @Negative:     yes

   @Structure:    complex-main

   @Dependencies: aux_test_a01_01.cj

 */

package package11

import utils.assert.Assert
var a = tempTest()
main() {
    Assert.equals(1, a.case16)
}
