/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a03_02

  @Level:         1

  @Assertion:       8.2.2.1(3) A property modified with protected is not only accessible within the package, but 
                    also to subclasses of the current class in other packages.

  @Description:     Checks that properties defined inside the extension with protected modifier are not accessible in 
                    subclasses in other packages.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       complex-main

  @Dependencies:    aux_test_a03_01.cj

  @Issue:           6124

*/

package pkg2

import utils.assert.Assert
import pkg1.AuxTestA0301

class MyClass1 <: AuxTestA0301 {}

main(): Unit {
    var myClassImpl = AuxTestA0301()
    Assert.equals(1, myClassImpl.p)

    var myClass1Impl = myClass1()
    Assert.equals(1, myClass1Impl.p)
}
