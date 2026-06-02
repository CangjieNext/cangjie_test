/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_05_a02_02

  @Level:         1

  @Assertion:    11.1.3.5(2) If top-level declarations of the same name are imported from different 
                 packages, the import packagename.name as newName mentioned in the import as can be 
                 used to avoid name conflicts.
 
  @Description:  Check that newName in the import packagename.name as newName should be unique

  @Mode:         compileonly 

  @Negative:     no

  @CompileWarning:  yes

  @Structure:    complex-main

  @Dependencies: aux_test_a02_01.cj aux_test_a02_02.cj aux_test_a02_03.cj
 
*/

import p1.auxTestA0201 as pn
import p2.auxTestA0202 as pn
import p3.auxTestA0203 as pn

main() {
    return 0
}
