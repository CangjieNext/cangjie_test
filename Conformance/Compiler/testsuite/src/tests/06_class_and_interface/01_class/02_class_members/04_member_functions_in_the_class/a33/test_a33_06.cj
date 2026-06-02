/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a33_06

  @Level:         1

  @Assertion: 6.1.2.4(33)
              Note that a function cannot be declared with both open and static.

  @Description: Check that in an open class a generic function with the empty signature
                can not be modified by both 'open' and 'static'

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class A {
    public static open func f<T>() {}
}

main() {
}