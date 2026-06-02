/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a11_03

  @Level:         1

  @Assertion:    11.1.3.2(11) If import as is decorated with public, it will be reexported.

  @Description:  Check that declaration imported without keyword `public` wont be reexported.

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    complex-main

  @Dependencies: aux_test_a11_03.cj
 
*/

import pkga3.*

main() {
    var name = pName
    return 0
}