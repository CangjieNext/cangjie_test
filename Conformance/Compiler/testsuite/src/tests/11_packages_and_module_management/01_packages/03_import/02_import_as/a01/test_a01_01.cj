/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a01_01

  @Level:         1

  @Assertion:    11.1.3.2(1) A declaration or the whole package can be renamed when it is imported using 
                 the syntax  import auxTestA0101.name as newName where newName is a name used to refer to 
                 the declaration in the file. Renaming can be used to avoid name conflicts when importing 
                 top-level declarations of the same name from different packages.
 
  @Description:  Check that whole package can be renamed

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a01_01.cj aux_test_a01_02.cj
 
*/

import p1 as package1
import p2 as package2

import utils.assert.Assert

main() {
    Assert.equals("p1", package1.auxTestA0101)
    Assert.equals("p2", package2.auxTestA0102)
}
