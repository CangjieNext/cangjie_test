/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a36_18

  @Level:         1

  @Assertion: 6.1.2.4(36)
              Functions modified by open must be modified by public or protected

  @Description: Check that an open function with the empty signature
                can not have the modifier 'private' in a sealed class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006084

*/

sealed class A {
    open private func f() {}
}

main() {
}