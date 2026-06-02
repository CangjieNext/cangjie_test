/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a38_134

  @Level:         1

  @Assertion: 6.1.2.4(38)
              override: When a function overrides another open function,
              it can be declared with an optional modifier override
              (override does not have the open semantic.
              If the function modified with override needs to be override, use open modifier it again.). 

  @Description: Check that a function that overrides a public open function
                from an open class can not be overridden without the 'open' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class A {
    public open func f() {}
}

open class B <: A {
    override public func f() {}
}

class Test <: B {
    override public func f() {}
}

main() {
}