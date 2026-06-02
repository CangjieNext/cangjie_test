/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_09_a02_06

  @Level:         1

  @Assertion: 4.9(2)
              this can appear in all instance members and constructors to represent the current instance and super can
              only appear in class type definitions to represent instances of the direct parent class (see Chapter 6
              Classes for details).

  @Description: Check that this usage outside class/struct/enum/interface scope causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    this
    return
}

