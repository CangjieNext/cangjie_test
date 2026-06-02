/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a09_02

  @Level:         1

  @Comment:         Note the following: 

  @Assertion:       5.3.2(9) 1. If the function has a default value, parameters whose default values are not specified 
                    are not involved in the overload resolution.

  @Description:     Check that if parameters whose default values are not specified and arguments in function call 
                    doesn't allow identify required function implementation - an error will be raised. 

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class myClass {
    func f0(a: Int32): Int32 { a }
    func f0(a: Int32, b!: Int32 = 12): Int32 { a + b}
}

main() {
    var myClassImpl = myClass()
    myClassImpl.f0(12)
}
