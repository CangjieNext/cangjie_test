/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a05_03

  @Level:         1
  @Assertion:    3.2.4(5) If the name p is a package name, the package in the upper-scope is shadowed.
  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: package_other.cj

*/

package test

import utils.macros.*

import other.*

enum other { test | another }

main() {
    let a : other = test
    let b : other = other.test
    let other = test

    @matchOrThrow [test] (a)
    @matchOrThrow [test] (b)
    @matchOrThrow [test] (other)
}
