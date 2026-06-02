/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_05_a03_01

  @Level:         1

  @Assertion:    11.1.3.5(3) If no rename operation is performed, no error is reported at the import statement.

  @Description:  Check that no error is reported if if top-level declarations of the same name are imported 
                 from different packages with no rename : same type

  @Mode:         compileonly

  @Negative:     no

  @CompileWarning:  yes

  @Structure:    complex-main

  @Dependencies: aux_test_a03_01.cj aux_test_a03_02.cj aux_test_a03_03.cj

*/

import p1.packageName
import p2.packageName
import p3.packageName

main() {
    return 0
}
