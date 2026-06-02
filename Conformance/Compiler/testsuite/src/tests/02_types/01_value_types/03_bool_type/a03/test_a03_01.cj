/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         02_01_03_a03_01

  @Level:         1

   @Assertion:    2.1.3(3) 
    let bool1: Bool = true
    let bool2: Bool = false

   @Description:  Check that code sample works 

   @Mode:         run

   @Negative:     no

   @Structure:    single

   @Comment:

 */

import utils.assert.Assert

 main() {
  let bool1: Bool = true
  let bool2: Bool = false

  Assert.isTrue(bool1)
  Assert.isFalse(bool2)
 }

