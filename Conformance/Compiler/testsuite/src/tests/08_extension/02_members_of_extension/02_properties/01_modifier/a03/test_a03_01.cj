/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a03_01

  @Level:         1

  @Assertion:       8.2.2.1(3) A property modified with protected is not only accessible within the package, but 
                    also to subclasses of the current class in other packages.

  @Description:     Checks that properties defined inside the extension with protected modifier are accessible in
                    subclasses.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6124

*/

import utils.assert.Assert

open class MyClass {}

extend MyClass {
    protected prop p: Int64 { 
        get() { 1 }
    }
}

class MyClass1 <: MyClass {
    
}

main(): Unit {
    var MyClassImpl = MyClass()
    Assert.equals(1, MyClassImpl.p)

    var MyClass1Impl = MyClass1()
    Assert.equals(1, MyClass1Impl.p)
}
