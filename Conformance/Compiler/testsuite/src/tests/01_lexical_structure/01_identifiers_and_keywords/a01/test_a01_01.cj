/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          01_01_a01_01

  @Level:         1

  @Assertion:     1.1(1) Identifiers can be used as names of variables, functions,
                  types, packages, modules, etc.

  @Description:   Check that an identifier can be used as a name.

  @Mode:          compileonly

  @Negative:      no

  @Structure:     complex-main

  @Dependencies:  aux_test_a01_01.cj

*/

package a

import p.f

func b() {}

type C = Int64;

main() {
    var d: Int64 = 1
}
