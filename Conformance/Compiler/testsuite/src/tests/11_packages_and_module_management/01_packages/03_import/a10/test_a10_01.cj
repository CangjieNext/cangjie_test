/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a10_01

  @Level:         1

  @Assertion:    11.1.3(10) Only public declarations or definitions can be imported. 
                 If a declaration or definition is not public, an error will be reported 
                 for the import declaration. 
  
  @Description:  Check that public declarations or definitions can be imported

  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a10_01.cj

*/

import p1.AuxTestA1001

main() {
    return 0
}
