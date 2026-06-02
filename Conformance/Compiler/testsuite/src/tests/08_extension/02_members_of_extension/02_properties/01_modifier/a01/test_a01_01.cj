/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a01_01

  @Level:         1

  @Assertion:       8.2.2.1(1) Properties definitions within extensions support the private, protected (only can be 
                    used when the extended type is a class type) or public modifier.

  @Description:     Check that properties can be defined inside extensions with private, protected (only for class 
                    type extension) or public modifier.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6124

*/

import utils.assert.Assert

class MyClass {}

extend MyClass {
    private prop p1: Int64 { 
        get() { 1 }
    }

    public prop p2: Int64 { 
        get() { 1 }
    }

    protected prop p3: Int64 { 
        get() { 1 }
    }

    prop p4: Int64 { 
        get() { 1 }
    }

    func myFunc() {
        this.p1
    }
}

struct MyStruct {}

extend MyStruct {
    private prop p1: Int64 { 
        get() { 2 }
    }

    public prop p2: Int64 { 
        get() { 2 }
    }

    prop p3: Int64 { 
        get() { 2 }
    }

    func myFunc() {
        this.p1
    }
}

enum MyEnum { A }

extend MyEnum {
    private prop p1: Rune { 
        get() { r'R' }
    }

    public prop p2: Int64 { 
        get() { 2 }
    }

    prop p3: Rune { 
        get() { r'f' }
    }

    func myFunc() {
        this.p1
    }
}

main(): Unit {
    var myClassImpl = MyClass()
    Assert.equals(1, myClassImpl.p2)    
    Assert.equals(1, myClassImpl.p3)
    Assert.equals(1, myClassImpl.p4)
    Assert.equals(1, myClassImpl.myFunc())

    var myStructImpl = MyStruct()
    Assert.equals(2, myStructImpl.p2)    
    Assert.equals(2, myStructImpl.p3)
    Assert.equals(2, myStructImpl.myFunc())

    Assert.equals(2, MyEnum.A.p2)    
    Assert.equals(r'f', MyEnum.A.p3)    
    Assert.equals(r'R', MyEnum.A.myFunc())
}
