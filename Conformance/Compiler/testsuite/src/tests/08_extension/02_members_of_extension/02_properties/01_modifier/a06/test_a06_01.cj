/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a06_01

  @Level:         1

  @Assertion:       8.2.2.1(6) Properties within extensions support the use of the static modifier.

  @Description:     Check that properties can be defined inside extensions with static modifier.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6124

*/

import utils.assert.Assert

class MyClass {}

extend MyClass {
    static prop p: Int64 { 
        get() { 1 }
    }
}

struct MyStruct {}

extend MyStruct {
    static prop p: Int64 { 
        get() { 2 }
    }
}

enum MyEnum { A }

extend MyEnum {
    static prop p: Int64 { 
        get() { 3 }
    }
}

main(): Unit {
    Assert.equals(1, MyClass.p)    
    Assert.equals(2, MyStruct.p)    
    Assert.equals(3, MyEnum.p)    
}
