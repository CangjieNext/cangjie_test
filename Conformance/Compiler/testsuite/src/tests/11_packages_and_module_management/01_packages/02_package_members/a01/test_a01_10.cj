/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         11_01_02_a01_10

  @Level:         1

   @Assertion:    11.1.3 In Cangjie, you can use access modifiers to protect access to elements such as types, variables, and functions. 
                  Cangjie has 4 different access modifiers.
                  `internal` indicates that only the current package and subpackages (including subpackages of subpackages) are visible.
                  This type of members can be accessed in the same package without being imported. This type of members can be accessed in subpackages of the current package (including subpackages of subpackages).

   @Description:  Check that functions declared on top-level are package members

   @Mode:         run

   @Negative:     no

   @Structure:    complex-main

   @Dependencies: aux_test_a01_01.cj

 */

package package11

import utils.assert.Assert

main() {
    Assert.equals(1, case10)
}
