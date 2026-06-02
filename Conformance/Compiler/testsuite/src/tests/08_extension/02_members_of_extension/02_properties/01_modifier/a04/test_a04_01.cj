/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a04_01

  @Level:         1

  @Assertion:       8.2.2.1(4) Properties that are not qualified with private, protected or public can only be used 
                    within this package.

  @Description:     Check that properties defined inside extensions without private, protected or public modifier, 
                    are accesible inside package.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6124

*/

import utils.assert.Assert

class MyClass {}

extend MyClass {
    prop p: Int64 { 
        get() { 1 }
    }
}

struct MyStruct {}

extend MyStruct {
    prop p: Int64 { 
        get() { 2 }
    }
}

enum MyEnum { A }

extend MyEnum {
    prop p: Rune { 
        get() { r'f' }
    }
}

main(): Unit {
    var myClassImpl = MyClass()
    Assert.equals(1, myClassImpl.p)    

    var myStructImpl = MyStruct()
    Assert.equals(2, myStructImpl.p)    

    Assert.equals(r'f', MyEnum.A.p)    
}
