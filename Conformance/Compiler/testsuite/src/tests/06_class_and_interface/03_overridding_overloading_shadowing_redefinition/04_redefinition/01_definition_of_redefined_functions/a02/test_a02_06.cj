/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a02_06

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(2)
              A function and its redefined versions must share the same name.

  @Description: Check that a class can not use the 'redef' modifier
                if the static non-generic function in an abstract class
                and the redefining function in the implementing class have different names

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

abstract class A {
    static func f() {}
}

class C <: A {
    public redef static func a() {}
}

main() {
}