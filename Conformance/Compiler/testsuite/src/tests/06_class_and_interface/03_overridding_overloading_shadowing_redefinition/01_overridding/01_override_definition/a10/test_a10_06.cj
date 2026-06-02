/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a10_06

  @Level:         1

  @Assertion: 6.3.1.1(10)
              Static functions cannot cover instance functions.

  @Description: Check that a class can not define a static function
                with the same name and signature as an instance open function
                in a sealed class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006084

*/

sealed class A {
    public open func f() {}
}

class C <: A {
    public static func f() {}
}

main() {
}