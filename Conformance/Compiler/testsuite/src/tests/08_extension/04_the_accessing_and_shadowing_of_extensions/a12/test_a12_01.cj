/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a12_01

  @Level:         1

  @Assertion:       8.4(12) The non-private–modified members in other extensions of the same type can be accessed 
                    directly in the extension (without any prefix).

  @Description:     Check that non-private–modified extensions members are accessible directly from other extensions
                    of the same type.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

import utils.assert.Assert

interface myInterface {
    func myFuncFromInterface(): String
}

open class MyOpenClass {
    open public func myBaseOpenFunc() {
        12
    }
}

extend MyOpenClass {
    public func myExtendPublicOpenFunc0() {
        myBaseOpenFunc() + 1 + myExtendProtectedOpenFunc1()
    }

    protected func myExtendProtectedOpenFunc0() {
        13
    }
}

extend MyOpenClass {
    public func myExtendPublicOpenFunc1() {
        myBaseOpenFunc() + 1 + myExtendProtectedOpenFunc0()
    }

    protected func myExtendProtectedOpenFunc1() {
        16
    }
}

class MyClass <: myInterface {
    public var myInt64Var: Int64 = 23

    protected var myStringVar: String = "ASFg"

    static func myBaseStaticFunc() {
        "AAA"
    }

    public func myBasePublicFunc() {
        "myBasePublicFunc()"
    }

    protected func myBaseProtectedFunc() {
        "myBaseProtectedFunc()"
    }

    public override func myFuncFromInterface() {
        "result of function overriding"
    }
}
extend MyClass {
    static func myExtendStaticFunc0() {
        myBaseStaticFunc()
    }

    protected func myGetFuncs0() {
        "${myBasePublicFunc()} ${myBaseProtectedFunc()} ${myFuncFromInterface()}"
    }

    func myGetValFunc0() {
        myGetValFunc1()
    }
}
extend MyClass {
    static func myExtendStaticFunc1() {
        myExtendStaticFunc0()
    }

    func myGetFuncs1() {
        myGetFuncs0()
    }

    protected func myGetValFunc1() {
        "${myInt64Var} ${myStringVar}"
    }
}

struct MyStruct {
    var myBoolVar: Bool = true

    static func myBaseStaticFunc() {
        12
    }
    
    func myBaseGetFunc() {
        this.myBoolVar
    }

    mut func myBaseSetFunc(a: Bool) {
        this.myBoolVar = a
    }
}

extend MyStruct {
    static func myExtendStaticFunc() {
        myBaseStaticFunc()
    }

    mut func myExtendSetFunc(a: Bool) {
        myBaseSetFunc(a)
    }

    func myExtendGetFunc01() {
        myBaseGetFunc()
    }

    public func myExtendGetFunc0() {
        myBaseGetFunc()
    }
}

extend MyStruct {
    func myExtendGetFunc11() {
        myExtendGetFunc0()
    }
    
    public func myExtendGetFunc1() {
        myBaseGetFunc()
    }
}

enum myEnum {
    A

    static func myBaseStaticFunc() {
        true
    }

    public func myBasePublicFunc() {
        12
    }
}

extend myEnum {
    static func myExtendStaticFunc() {
        !myBaseStaticFunc()
    }

    func myExtendPublicFunc0() {
        myBasePublicFunc()
    }
}

extend myEnum {
    public func myExtendPublicFunc1() {
        myExtendPublicFunc0()
    }
}

main() { 
    Assert.equals("AAA", MyClass.myBaseStaticFunc())
    Assert.equals("AAA", MyClass.myExtendStaticFunc1())

    Assert.equals(12, MyStruct.myBaseStaticFunc())
    Assert.equals(12, MyStruct.myExtendStaticFunc())

    Assert.equals(true, myEnum.myBaseStaticFunc())
    Assert.equals(false, myEnum.myExtendStaticFunc())

    var myOpenClassImpl = MyOpenClass()
    Assert.equals(12,myOpenClassImpl.myBaseOpenFunc())
    Assert.equals(29,myOpenClassImpl.myExtendPublicOpenFunc0())

    var myClassImpl = MyClass()
    Assert.equals("23 ASFg",myClassImpl.myGetValFunc0())
    Assert.equals("myBasePublicFunc() myBaseProtectedFunc() result of function overriding", myClassImpl.myGetFuncs1())

    var myStructImpl = MyStruct()
    Assert.equals(true,myStructImpl.myExtendGetFunc11())
    myStructImpl.myExtendSetFunc(false)
    Assert.equals(false,myStructImpl.myExtendGetFunc1())

    Assert.equals(12,myEnum.A.myBasePublicFunc())
    Assert.equals(12,myEnum.A.myExtendPublicFunc1())
} 
