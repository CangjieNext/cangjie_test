/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a04_34

  @Level:         1

  @Assertion: 6.2.4.1(4)
              The return type of the implemented function should be the same as
              or a subtype of the return type of the corresponding function in the interface.

  @Description: Check that a struct can not implement an abstract instance function
                from a superinterface by defining a function with a different return type
                with the 'override' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    func f(): Unit
}

struct A <: I {
    public override func f(): String {
        return ""
    }
}

main() {
}

