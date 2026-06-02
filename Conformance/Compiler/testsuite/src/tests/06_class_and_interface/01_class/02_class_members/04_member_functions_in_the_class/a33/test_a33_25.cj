/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a33_25

  @Level:         1

  @Assertion: 6.1.2.4(33)
              Note that a function cannot be declared with both open and static.

  @Description: Check that in a sealed class a generic function with parameters and a non-Unit return type
                can not be modified by both 'open' and 'static'

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006084

*/

sealed class A {
    public static open func f<T>(x: Int64) {
        return 1
    }
}

main() {
}