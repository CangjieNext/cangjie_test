/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a05_01

  @Level:         1

  @Assertion:       5.3.4(5) Named parameters cannot use this syntactic sugar.

  @Description:     Check that class member function with unnamed and named parameters can't use syntactic 
                    sugar for named parameters.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class myClass {
    func f0(z: Int32, x!: Array<Int32>): String { 
        "${z - x[0]}"
    } 
}
main() {
    var myClassImpl = myClass()
    myClassImpl.f0(3, x: 5)
}
