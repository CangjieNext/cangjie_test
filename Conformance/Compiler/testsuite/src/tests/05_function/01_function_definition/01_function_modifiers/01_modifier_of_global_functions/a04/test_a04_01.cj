/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_01_a04_01

  @Level:         1

  @Assertion:     5.1.1.1(4)
      public func f1(): Unit {}
      func f12(): Unit {}         //  can be accessed in the current package.

  @Description:   Check that function defined with global modifier can be accessed outside of own package.

  @Mode:          compileonly

  @Negative:      no

  @Structure:     complex-main

  @Dependencies:  aux_module.cj

*/
import pkg.f1 as f1

main() {

}
