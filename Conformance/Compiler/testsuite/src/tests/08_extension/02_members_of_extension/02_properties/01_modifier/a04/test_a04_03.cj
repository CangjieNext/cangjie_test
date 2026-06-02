/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a04_03

  @Level:         1

  @Assertion:       8.2.2.1(4) Properties that are not qualified with private, protected or public can only be used 
                    within this package.

  @Description:     Check that properties defined inside extensions without private, protected or public modifier, 
                    are not accesible outside package: class property.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       complex-main

  @Dependencies:    aux_test_a04_01.cj

  @Issue:           6124

*/

package pkg2

import pkg1.*

main(): Unit {
    var myClassImpl = MyClass()
    print("${myClassImpl.p}")    
}
