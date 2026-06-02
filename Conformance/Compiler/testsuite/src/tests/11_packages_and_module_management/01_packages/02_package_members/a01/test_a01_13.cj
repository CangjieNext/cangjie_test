/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         11_01_02_a01_13

  @Level:         1

   @Assertion:    11.1.3 The semantics of different access modifiers when decorating non-top-level members are as follows:
                    `public` indicates that the module is visible inside and outside.

   @Description:  Check that functions declared on top-level are package members

   @Mode:         run

   @Negative:     no

   @Structure:    complex-main

   @Dependencies: aux_test_a01_01.cj

 */

package package11

import utils.assert.Assert
var a = tempTest()
main() {
    Assert.equals(1, a.case13)
}
