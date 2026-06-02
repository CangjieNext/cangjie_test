/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_05_a02_07

  @Level:         1

  @Assertion:     5.1.5(2) Function declarations can appear in abstract classes and interfaces. 

  @Description:   Check that function can't be declared in enum extension.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
enum myEnum {
    A
}
extend myEnum {
  func myFunc(a: Int32): Int32
}

main() {
}
