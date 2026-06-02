/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         11_01_02_a01_11

  @Level:         1

   @Assertion:    11.1.3 In Cangjie, you can use access modifiers to protect access to elements such as types, variables, and functions. 
                  Cangjie has 4 different access modifiers.
                  `protected` indicates that only the current module is visible. 
                  Files of the same package can access these members without importing them. 
                  Files of different packages but other packages in the same module can access these members through importing, but packages of different modules cannot access these members.

   @Description:  Check that functions declared on top-level are package members

   @Mode:         run

   @Negative:     no

   @Structure:    complex-main

   @Dependencies: aux_test_a01_01.cj

 */

package package11

import utils.assert.Assert

main() {
    Assert.equals(1, case11)
}
