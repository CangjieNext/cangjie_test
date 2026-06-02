/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         11_01_02_a01_09

  @Level:         1

   @Assertion:    11.1.3 In Cangjie, you can use access modifiers to protect access to elements such as types, variables, and functions. 
                  Cangjie has 4 different access modifiers.
                  `public` indicates that the module is visible inside and outside. 
                  Files in the same package can access such members without importing them, and other packages can access them by importing them.

   @Description:  Check that functions declared on top-level are package members

   @Mode:         run

   @Negative:     no

   @Structure:    complex-main

   @Dependencies: aux_test_a01_01.cj

 */

package package11

import utils.assert.Assert

main() {
    Assert.equals(1, case9)
}
