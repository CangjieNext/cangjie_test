/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_03_a01_01

  @Level:         1

  @Assertion:       8.3(1) If the type being extended is a generic type, the type variables at the type being extended 
                    does not need to have the same name as the type variables at the original type definition.

  @Description:     Check that names for generic type parameters in type extensions should not necessarily be the same.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

open class MyOpenClass {
    var myVar: Int64 = 0

    init() {
        this.myVar = 10
    }

    MyOpenClass(a: Int64) {
        this.myVar = a
    }
}

class MyClass<T> where T <: MyOpenClass {
    var myClassVar: T

    MyClass(a: T) {
        this.myClassVar = a
    }
}

extend<S> MyClass<S> {
    func myFunc(): S {
        this.myClassVar
    }
}

extend<T> MyClass<T>{
    func myFunc(a: T): Unit {
        this.myClassVar = a
    }
}

struct MyStruct<G> where G <: ToString {
    var myStructVar: G

    MyStruct(a: G) {
        myStructVar = a
    }
}

extend<W> MyStruct<W> {
    func myFunc(): W {
        myStructVar
    }
}

main() { 
    var myOpenClassImpl0 = MyOpenClass()
    var myOpenClassImpl1 = MyOpenClass(88)

    var myClassImpl0 = MyClass(MyOpenClass())
    var myLocalVar0 = myClassImpl0.myFunc()
    Assert.isTrue(myLocalVar0 is MyOpenClass)
    Assert.equals(10, myLocalVar0.myVar)
    myClassImpl0.myFunc(myOpenClassImpl1)
    myLocalVar0 = myClassImpl0.myFunc()
    Assert.isTrue(myLocalVar0 is MyOpenClass)
    Assert.equals(88, myLocalVar0.myVar)

    var myClassImpl1 = MyClass(MyOpenClass(12))
    let myLocalVar1 = myClassImpl1.myFunc()
    Assert.isTrue(myLocalVar1 is MyOpenClass)
    Assert.equals(12,myLocalVar1.myVar)
    myClassImpl1.myFunc(myOpenClassImpl0)
    let myLocalVar2 = myClassImpl1.myFunc()
    Assert.isTrue(myLocalVar2 is MyOpenClass)
    Assert.equals(10, myLocalVar2.myVar)

    var myStructImpl0 = MyStruct<Int32>(12)
    let myInt32Var = myStructImpl0.myFunc()
    Assert.isTrue(myInt32Var is Int32)
    Assert.equals(12, myInt32Var)

    var myStructImpl1 = MyStruct<Bool>(true)
    let myBoolVar = myStructImpl1.myFunc()
    Assert.isTrue(myBoolVar is Bool)
    Assert.equals(true, myBoolVar)
} 
