/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a10_03

  @Level:         1

  @Comment:         Note the following: 

  @Assertion:       5.3.2(10) 2. If a function has named arguments, the sequence of the named arguments may be 
                    different from that of the parameters. During type checking, the named argument must correspond 
                    to the named parameter that matches the name.

  @Description:     Check that if the function has unnamed and named parameters, then the order of the corresponding 
                    arguments is not important only for named parameters and they can't be placed before unnamed: for
                    class instance member function. 

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class myClass {
    func f(a: Int32, b!: Int32, c!: Int32 = 12): Int32 { a + b + c}
}

main(): Unit {
    var myClassImpl = myClass()
    myClassImpl.f(c: -6, 44, b: 12 ))
}
