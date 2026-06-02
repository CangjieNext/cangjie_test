/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a10_13

  @Level:         1

  @Assertion:    3.4.2(10) sealed means that the class or interface can only be inherited or implemented in the current
                 package, See class for details

  @Description:  Check that subclass cannot use private member variables of superclass.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:        6084

*/

sealed class C1 {
    private let currentYear = 2023
}

class C2 <: C1 {

}

main() {
    var obj = C2()
    print(obj.currentYear)
}
