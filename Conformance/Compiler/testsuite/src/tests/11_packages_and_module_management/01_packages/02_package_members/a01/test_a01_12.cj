/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         11_01_02_a01_12

  @Level:         1

   @Assertion:    11.1.3 In Cangjie, you can use access modifiers to protect access to elements such as types, variables, and functions. 
                  Cangjie has 4 different access modifiers.
                  `private` indicates that the file is visible only in the current file. Different files cannot access such members.

   @Description:  Check that functions declared on top-level are package members

   @Mode:         compileOnly

   @Negative:     yes

   @Structure:    complex-main

   @Dependencies: aux_test_a01_01.cj

 */

package package11

import utils.assert.Assert

main() {
    Assert.equals(1, case12)
}
