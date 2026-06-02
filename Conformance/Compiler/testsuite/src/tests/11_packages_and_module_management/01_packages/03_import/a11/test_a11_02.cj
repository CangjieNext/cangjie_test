/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a11_02

  @Level:         1

  @Assertion:    11.1.3(11) In the case of import packageName.xxx, only the declaration xxx 
                 is imported, which can be accessed through the syntax packageName.xxx or xxx. 
  
  @Description:  Check that in the case of import packageName.xxx only declaration xxx is imported

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a11_01.cj

*/

import p1.Math

main() {
    p1.Physic.G
    return 0
}
