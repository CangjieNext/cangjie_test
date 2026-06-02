/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_04_01_a15_02

  @Level:         1

  @Assertion:    2.4.1(15) By default, the type definition is internally accessible.

  @Description:  Check that the alias is externally nonaccessible, by default

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_file_01.cj

*/

package pkgb

import pkga.*

main(): Unit {
    let a1: AVeryLongAndUnintuitiveTypeName = 1.0
}
