/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a03_01

  @Level:         1

  @Assertion:    11.1.3(3) When importing content from current modules, you can omit from identifier;

  @Description:  Check that you can omit from identifier while importing content from current modules

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a03_01.cj

  @Module:      mod113a03
*/

import package11.*

import utils.assert.Assert

main() {
    Assert.equals("package11", packageName())
}