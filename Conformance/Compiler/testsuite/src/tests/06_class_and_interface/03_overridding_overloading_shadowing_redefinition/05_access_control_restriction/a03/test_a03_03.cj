/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_05_a03_03

  @Level:         1

  @Assertion: 6.3.5(3)
              When a type implements interface, the access level of the function
              which implements abstarct function cannot be changed
              to be lower than the abstract function in the super type.

  @Description: Check that the access level of an instance abstract function
                without a default implementation can not be lowered to default
                in an implementing class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    func f(): Unit
}

class A <: I {
    func f() {}
}

main() {
}