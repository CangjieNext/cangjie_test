/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a05_109

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(5)
              If the redefined function is a generic function,
              the type argument constraints of the redefined function
              are more loose or the same as those of the implemented function.

  @Description: Check that a class while redefining a generic function from an open class
                can not add constraints with Any upper bound if the abstract function did not have any
                while using the 'redef' modifier

  @Mode: compileonly

  @Negative: no

  @Structure: single

*/

open class I {
    static func f<T>() {}
}

class A <: I {
    public redef static func f<T>() where T <: Any {}
}

main() {
}