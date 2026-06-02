/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_05_a04_02

  @Level:         1

  @Assertion: 6.3.5(4)
              The following shows an example of access control restrictions.
              open class A {
                protected func f() {}
              }
              interface I {
                func m() {} // public by default
              }
              class C <: A & I {
                private override func f() {} // Error: the access control of override function is lower than
                the overriden function↪
                protected func m() {} // Error: the access control of function which implements abstract
                function is lower than the abstract function↪
              }

  @Description: Check the second negative case from the example

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006464

*/

open class A {
    protected func f() {}
}
interface I {
    func m() {} // public by default
}
class C <: A & I {
    protected func m() {} // Error: the access control of function which implements abstract function is lower than the abstract function
}

main() {
}