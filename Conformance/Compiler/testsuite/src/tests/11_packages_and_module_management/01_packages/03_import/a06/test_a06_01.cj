/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a06_01

  @Level:         1

  @Assertion:    11.1.3(6) Packages without module names cannot be imported by other modules.
 
  @Description:  Check that packages without module names cannot be imported by other modules.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a06_01.cj

  @Module:       mod113a08
*/

import package11.*

main() {
    return 0
}
