/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a06_01

  @Level:         1

  @Assertion:       5.4(6) • Member functions 
                    Member functions can be declared or defined in the type definition. The scope of a member 
                    function is the entire type and its extensions.

  @Description:     Check that function can be defined or declared inside type definitions and it is are available in 
                    own scope.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

type myType = Int64
extend myType {
    func doubled() {this * 2}
}

type myType1 = myType
extend myType1 {
    func increment(delta: myType1) {this + delta}
    func setDoubled() {
        doubled()
    }
}

interface myInterface { 
    func foo(): Unit 
    static func bar(): Unit {}
} 

open class myClass { 
    func foo() {} 
    static func bar() {}
    func myFunc(inVal: myType) {
        inVal.doubled()
    }
} 

class myClass1 <: myClass {
    var myVar: myType1 = 15
    func myClassFunc() {
        myFunc(myVar)
    }
}

struct myStruct {
    func myFunc() {
        "return from myStruct.myFunc()"
    }
    func myFunc1(s: String) {
        "${s} &&& ${myFunc()}"
    }
}
extend myStruct{
    func funcExtend() {
        myFunc()
    }
    func funcExtend1() {
        funcExtend()
    }
}

enum myEnum {

    R

    func myFunc() {
        "return from myEnum.myFunc()"
    }
    func myFunc1(b: Bool) {
        !b
    }
    func myFunc2(b: Bool) {
        if(myFunc1(b)) {
            return "SADSDS"
        }
        return myFunc()
    }

}

main() {
    var myVar: myType = 64
    Assert.equals(128, myVar.doubled())    
    var myVar1: myType1 = 4
    Assert.equals(8, myVar1.doubled())    
    Assert.equals(6, myVar1.increment(2))    
    Assert.equals(8, myVar1.setDoubled())    

    Assert.isTrue(myInterface.bar is () -> Unit)
    Assert.isTrue(myClass.bar is () -> Unit)

    var myClassImpl = myClass()
    Assert.isTrue(myClassImpl.foo is () -> Unit)
    Assert.isTrue(myClassImpl.myFunc is (myType) -> myType)
    Assert.equals(128, myClassImpl.myFunc(64))

    var myClass1Impl = myClass1()
    Assert.isTrue(myClass1Impl.myClassFunc is () -> myType)
    Assert.equals(30, myClass1Impl.myClassFunc())

    var myStructImpl = myStruct()
    Assert.isTrue(myStructImpl.myFunc is () -> String)
    Assert.isTrue(myStructImpl.myFunc1 is (String) -> String)
    Assert.isTrue(myStructImpl.funcExtend is () -> String)
    Assert.isTrue(myStructImpl.funcExtend1 is () -> String)
    Assert.equals("return from myStruct.myFunc()", myStructImpl.myFunc())
    Assert.equals("BBd &&& return from myStruct.myFunc()", myStructImpl.myFunc1("BBd"))
    Assert.equals("return from myStruct.myFunc()", myStructImpl.funcExtend())
    Assert.equals("return from myStruct.myFunc()", myStructImpl.funcExtend1())

    Assert.isTrue(myEnum.R.myFunc is () -> String)
    Assert.isTrue(myEnum.R.myFunc1 is (Bool) -> Bool)
    Assert.isTrue(myEnum.R.myFunc2 is (Bool) -> String)
    Assert.equals("return from myEnum.myFunc()", myEnum.R.myFunc())
    Assert.equals("return from myEnum.myFunc()", myEnum.R.myFunc2(true))
    Assert.equals("SADSDS", myEnum.R.myFunc2(false))

}
