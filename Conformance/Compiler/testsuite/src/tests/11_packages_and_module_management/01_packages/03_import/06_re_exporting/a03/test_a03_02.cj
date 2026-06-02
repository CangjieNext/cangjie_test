/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a03_02

  @Level:         1

  @Assertion:    11.1.3.6(3) Other packages can import and use the re-exported 
                 content directly without importing it from its original package.  

  @Description:  Check that packages can import and use the re-exported 
                 content directly without importing it from its original package

  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a03_03.cj

 */

package p4

import p3.*

main() {
    AuxTestA0301.hello("World")
    return 0
}
