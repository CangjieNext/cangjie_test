/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:     Defines a package pkg2 for test.

  @Dependencies:    aux_test_a03_01.cj

  @Structure:       complex-aux
*/

package pkg2

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
