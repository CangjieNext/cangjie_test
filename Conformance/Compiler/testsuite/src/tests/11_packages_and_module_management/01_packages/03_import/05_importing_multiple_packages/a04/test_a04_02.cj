/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_05_a04_02

  @Level:         1

  @Assertion:    11.1.3.5(4) The content with name conflicts can only be accessed by using packageName.
                 XXX , while error will be reported when accessing it by using its name only. 

  @Description:  Check that the content with name conflicts can only be accessed by using packageName.
                 XXX , while error will be reported when accessing it by using its name only. 

  @Mode:         compileonly

  @Negative:     yes

  @CompileWarning:  yes

  @Structure:    complex-main

  @Dependencies: aux_test_a04_01.cj aux_test_a04_02.cj

*/

import p1.packageName
import p2.packageName

main() {
    packageName
    return 0
}
