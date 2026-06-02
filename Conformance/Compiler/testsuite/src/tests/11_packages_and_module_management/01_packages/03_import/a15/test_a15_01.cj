/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a15_01

  @Level:         1

  @Assertion:    11.1.3(15) Importing definitions or declarations 
                 of the current package is prohibited.

  @Description:  Check that importing definitions or declarations
                 of the current package is progibited.

  @Mode:         compileonly

  @Negative:     yes

  @CompileWarning:  yes 

  @Structure:    complex-main

  @Dependencies: aux_test_a15_01.cj

*/

package p1

import p1.currentYear

main() {
    return 0
}
