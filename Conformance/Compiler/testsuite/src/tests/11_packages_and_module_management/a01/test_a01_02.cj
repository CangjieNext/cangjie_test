/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_a01_02

  @Level:         1

  @Assertion:    11(1) In the Cangjie programming language, a program is a collection of packages.
 
  @Description:  Check that Cangjie program can import several packages

  @Mode:         run

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a01_01.cj aux_test_a01_02.cj
 
 */

import package1111.*
import package1112.*

import utils.assert.Assert

main() {
    var obj = AuxTestA0102()
    Assert.equals(2023, obj.currentYear)
    Assert.equals("foo", foo())
    return 0
}
