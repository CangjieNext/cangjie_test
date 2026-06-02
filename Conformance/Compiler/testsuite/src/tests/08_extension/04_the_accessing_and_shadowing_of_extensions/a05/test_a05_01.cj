/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a05_01

  @Level:         1

  @Assertion:       8.4(5) Extensions cannot access private members of the type being extended, other 
                    modifier-modified members can be accessed.

  @Description:     Check that extended members can access to modifier-modified members except "private".

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
    public func myExtendOpenFunc() {
        myBaseOpenFunc() + 1
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
    static func myExtendStaticFunc() {
        myBaseStaticFunc()
    }

    func myGetFuncs() {
        "${myBasePublicFunc()} ${myBaseProtectedFunc()} ${myFuncFromInterface()}"
    }

    func myGetValFunc() {
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

    func myExtendGetFunc() {
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

    public func myExtendPublicFunc() {
        myBasePublicFunc()
    }
}

main() { 
    Assert.equals("AAA", MyClass.myBaseStaticFunc())
    Assert.equals("AAA", MyClass.myExtendStaticFunc())

    Assert.equals(12, MyStruct.myBaseStaticFunc())
    Assert.equals(12, MyStruct.myExtendStaticFunc())

    Assert.equals(true, myEnum.myBaseStaticFunc())
    Assert.equals(false, myEnum.myExtendStaticFunc())

    var myOpenClassImpl = MyOpenClass()
    Assert.equals(12,myOpenClassImpl.myBaseOpenFunc())
    Assert.equals(13,myOpenClassImpl.myExtendOpenFunc())

    var myClassImpl = MyClass()
    Assert.equals("23 ASFg",myClassImpl.myGetValFunc())
    Assert.equals("myBasePublicFunc() myBaseProtectedFunc() result of function overriding", myClassImpl.myGetFuncs())

    var myStructImpl = MyStruct()
    Assert.equals(true,myStructImpl.myExtendGetFunc())
    myStructImpl.myExtendSetFunc(false)
    Assert.equals(false,myStructImpl.myExtendGetFunc())

    Assert.equals(12,myEnum.A.myBasePublicFunc())
    Assert.equals(12,myEnum.A.myExtendPublicFunc())
} 
