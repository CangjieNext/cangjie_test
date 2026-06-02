/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a09_02

  @Level:         1

  @Assertion:       8.4(9) Extensions are also not allowed to shadow any members added by other extensions.

  @Description:     Check that extensions members are not allowed to shadow any members added by other extensions: 
                    struct instance extensions.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct MyStruct {
    var myVar: Bool = true
}

extend MyStruct {
    func myFunc() {
        myVar
    }
}

extend MyStruct {
    func myFunc() {
        this.myVar
    }
}

main(): Unit { } 
