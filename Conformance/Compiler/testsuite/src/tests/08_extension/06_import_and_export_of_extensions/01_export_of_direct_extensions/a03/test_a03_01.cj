/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_01_a03_01

  @Level:         1

  @Assertion:       8.6.1(3) When the direct extension is in a different package from the definition of the type being 
                    extended, the extension is never exported and can only be used in the current package.

  @Description:     Check that extension defined in different package from the definition of the type being extended, 
                    can be used in its own package.

  @Mode:            run

  @Negative:        no

  @Structure:       complex-main

  @Dependencies:    aux_test_a03_01.cj

*/

package pkg2

import utils.assert.Assert
import pkg1.*

extend MyType {
    func myExtendFunc() {
        "MyType myExtendFunc()"
    }
}

extend MyClass {
    func myExtendFunc() {
        "MyClass myExtendFunc()"
    }
}

extend MyStruct {
    func myExtendFunc() {
        "MyStruct myExtendFunc()"
    }
}

extend MyEnum {
    func myExtendFunc() {
        "MyEnum myExtendFunc()"
    }
}

main() {
    var myTypeVar: MyType = 12
    Assert.equals("MyType myExtendFunc()", myTypeVar.myExtendFunc())

    var myClassImpl = MyClass()
    Assert.equals("MyClass myExtendFunc()", myClassImpl.myExtendFunc())

    var myStructImpl = MyStruct()
    Assert.equals("MyStruct myExtendFunc()", myStructImpl.myExtendFunc())

    Assert.equals("MyEnum myExtendFunc()", MyEnum.A.myExtendFunc())
}
