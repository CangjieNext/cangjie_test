/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a03_02

  @Level:         1

  @Assertion:       8.4(3) Extended instance members cannot use super.

  @Description:     Check that class instance extension defined in the other package can't use super in property.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       complex-main

  @Dependencies:    aux_test_a03_01.cj

  @Issue:           6124

*/

package pkg2

import pkg1.*

extend TestA0301 {
    override prop myProp: Int64 {
        get() { super.myProp + 2 }
    }
}

main(): Unit { } 
