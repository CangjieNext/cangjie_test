/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a03_54

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function overriding must comply with the following rules.

  @Assertion: 6.3.1.1(3)
              The parameter type of the function must be the same as the overridden function.
              The same parameter list indicates that the number
              and types of parameters of a function are the same.

  @Description: Check that a function with parameters of concrete types can not override
                an open function with parameters of generic types from an open class
                if the generic types do not correspond to concrete types during instantiation

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class A<T> {
    public open func f(x: T) {}
}

class C <: A<Int32> {
    public override func f(x: Int64) {}
}

main() {
}