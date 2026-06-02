/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_05_a01_02

  @Level:         1

  @Assertion:       8.5(1) If the type being extended is class, then the extended members are inherited by the 
                    subclasses.

  @Description:     Check that private members defined in class extension are not inherited by subclasses.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

open class MyOpenClass0 {
    var myVar: Int64 = 10
}

extend MyOpenClass0 {
    private func myPrivateFunc(a: Int64) {
        a + myVar
    }
}

class MyClass0 <: MyOpenClass0 {
    func myCallPrivateFunc(a: Int64) {
        this.myPrivateFunc(a)
    }
}

main() {
    var myClass0Impl = MyClass0()
    myClass0Impl.myCallPrivateFunc(6)
}
