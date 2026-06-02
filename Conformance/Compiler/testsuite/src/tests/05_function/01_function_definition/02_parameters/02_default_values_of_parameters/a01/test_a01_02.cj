/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a01_02

  @Level:         1

  @Assertion:     5.1.2.2(1) Function parameters may have default values. Default values are declared with = as shown 
                  in the example below.


  @Description:   Check that parameter default value can't be defined for abstract function.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

interface myInterface {
  func myInterfaceFunc(b!: String = "" ): String
}

main() {
}