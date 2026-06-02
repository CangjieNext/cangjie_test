/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a09_01

  @Level:         1

  @Assertion:    11.1.3.2(9) The original name cannot be used. 
 
  @Description:  Check that original name cannot be used with import as

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    complex-main

  @Dependencies: aux_test_a09_01.cj
 
*/

import p1.foo as p1.foo

main() {
    return 0
}

