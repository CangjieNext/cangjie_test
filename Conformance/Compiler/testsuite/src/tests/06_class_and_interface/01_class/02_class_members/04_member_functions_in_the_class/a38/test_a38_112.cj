/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a38_112

  @Level:         1

  @Assertion: 6.1.2.4(38)
              override: When a function overrides another open function,
              it can be declared with an optional modifier override
              (override does not have the open semantic.
              If the function modified with override needs to be override, use open modifier it again.). 

  @Description: Check that an instance non-generic function with the 'public' access modifier
                that overloads an open public function inherited from an open class
                can not be defined with the 'override' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class A {
    open public func f() {}
}

class Test <: A {
    override public func f(x: Int64) {}
}

main() {
}