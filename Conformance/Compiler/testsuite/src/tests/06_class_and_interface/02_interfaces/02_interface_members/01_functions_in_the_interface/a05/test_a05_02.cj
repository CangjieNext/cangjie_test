/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a05_02

  @Level:         1

  @Assertion: 6.2.2.1(5)
              Functions defined in the interface can be accessed outside the interface,
              with the same effect as public, no access modifiers are allowed.

  @Description: Check that a class overriding an instance function without a body from an interface
                can not modify the overriding function with the 'protected' modifier
                since it will lower the access level from public to protected

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: From the chapter 6.3.5 Access Control Restriction:
            Access modifier level: public > protected > default > private.
            When a type implements interface, the access level of the function
            which implements abstarct function cannot be changed to be lower
            than the abstract function in the super type.

*/

interface I {
    func f(): Unit
}

class A <: I {
    protected func f() {}
}

main() {
}

