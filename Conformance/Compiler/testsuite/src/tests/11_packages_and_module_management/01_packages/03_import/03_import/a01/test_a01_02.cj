/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_03_a01_02

  @Level:         1

  @Assertion:    11.1.3.3(1) The syntax import packageName.* is used to import all top-level 
                 definitions or declarations in packageName. 
 
  @Description:  Check that syntax import packageName.* can not import definitions or declarations 
                 from classes defined in packageName 

  @Mode:         compileonly

  @Negative:     yes  

  @Structure:    complex-main

  @Dependencies: aux_test_a01_01.cj
 
 */

package p2
import p1.*

main() {
    add(5, 5)
    return 0
}
