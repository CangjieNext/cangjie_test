/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a01_02

  @Level:         1

  @Assertion:   7.4(1) Properties, like functions, can be modified with modifiers, but only
                for the entire property, not for the getter or setter independently.

  @Description: Checks that modifier for getter is not allowed.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

class A1 {
  prop a1 : UInt8 {
    public get() { 0 }
  }
}

main() {
  return 0;
}


