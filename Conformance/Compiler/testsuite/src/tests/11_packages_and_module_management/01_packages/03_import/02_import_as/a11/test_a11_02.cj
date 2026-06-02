/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a11_02

  @Level:         1

  @Assertion:    11.1.3.2(11) If import as is decorated with public, it will be reexported.

  @Description:  Check that reexported declaration renamed by public import package.oldName as newName 
                 cannot be called by oldName

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    complex-main

  @Dependencies: aux_test_a11_02.cj
 
*/

import pkga2.*

main() {
    var name = packageName
    return 0
}