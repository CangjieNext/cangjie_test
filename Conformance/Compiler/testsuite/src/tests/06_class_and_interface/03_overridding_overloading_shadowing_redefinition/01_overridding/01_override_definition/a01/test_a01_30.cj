/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a01_30

  @Level:         1

  @Assertion: 6.3.1.1(1)
              If a non-abstract and instance function
              with a name same as a function in the superclass is declared,
              the function can be declared with an optional modifier override
              (indicating that it overwrites the existing one).

  @Description: Check that the modifier 'override' can not be used
                if the function in the subclass is the same static generic function
                as the non-abstract function in the superinterface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006425, 0006426

*/

interface A {
    static func f<T>() {}
}

class C <: A {
    public override static func f<T>() {}
}

main() {
}
