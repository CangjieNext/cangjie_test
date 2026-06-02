/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a40_06

  @Level:         1

  @Assertion: 6.1.2.4(40)
              Static member functions cannot be modified with open.

  @Description: Check that a static generic function with the default access modifier
                with the empty signature can not have the 'open' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class Test {
    static open func f<T>() {}
}

main() {
}