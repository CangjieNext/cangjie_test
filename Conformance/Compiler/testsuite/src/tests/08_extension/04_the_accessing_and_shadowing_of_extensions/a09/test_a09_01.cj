/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a09_01

  @Level:         1

  @Assertion:       8.4(9) Extensions are also not allowed to shadow any members added by other extensions.

  @Description:     Check that extensions members are not allowed to shadow any members added by other extensions: 
                    class instance extensions.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class MyClass {
    var myInt64Var : Int64 = 12
}

extend MyClass {
    func myFunc() {
        myInt64Var
    }
}

extend MyClass {
    func myFunc() {
        this.myInt64Var
    }
}

main(): Unit { } 
