/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_01_04_a08_01

  @Level:         1

  @Assertion:       5.1.4(8) If the return type of a function is not specified, the compiler will jointly derive the 
                    return type of the function based on the type of the function body and all return expressions in 
                    the function body. 
                    This process is not complete; for example, the compiler will raise an error if asked to infer the 
                    return types of (mutually) recursive functions.
                    (Note: It is not possible to derive the return type for a function that does not have a function 
                    body.) 

  @Description:     Check that if function type is not specified, it can be derived from type of function body and 
                    return expressions.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

type myType = (Rune, Bool, Int32)
type myFuncType = () -> String

class myClass {
    func classBoolFunc(a!: Int32 = 2) {
        return (a > 5)
    }
}

struct myStruct {
    static func structStaticFunc() { "static" }
    func structStringFunc(a: Bool) {
        a.toString()
    }
}

enum myEnum {
    D

    func enumStringFunc(a: Float32) {
        """
        ${a}"""
    }
}

func myFuncUnit(a: Rune) { } 

func myFuncGeneric<T>(a: T) { a } 

func myParentFunc0() {
    func myNestedFunc() {
        return 2 > 3
    }
    return myNestedFunc()
}

func myParentFunc1() {
    func myNestedFunc() {
        return "2 > 3"
    }
    return myNestedFunc
}

main() {
    Assert.isTrue(myFuncUnit(r'C') is Unit)
    Assert.isTrue(myFuncUnit is (Rune) -> Unit)

    Assert.isTrue(myFuncGeneric(r'C') is Rune)
    Assert.isTrue(myFuncGeneric<Rune> is (Rune) -> Rune)
    Assert.isTrue(myFuncGeneric("DDDD") is String)
    Assert.isTrue(myFuncGeneric<String> is (String) -> String)
    Assert.isTrue(myFuncGeneric(true) is Bool)
    Assert.isTrue(myFuncGeneric<Bool> is (Bool) -> Bool)
    var myTypeVar: myType = (r'C',false,12)
    Assert.isTrue(myTypeVar is myType)
    Assert.isTrue(myFuncGeneric(myTypeVar) is myType)
    Assert.isTrue(myFuncGeneric<myType> is (myType) -> myType)

    Assert.isTrue(myFuncGeneric(myClass()) is myClass)
    Assert.isTrue(myFuncGeneric<myClass> is (myClass) -> myClass)
    Assert.isTrue(myFuncGeneric(myStruct()) is myStruct)
    Assert.isTrue(myFuncGeneric<myStruct> is (myStruct) -> myStruct)
    Assert.isTrue(myFuncGeneric(myEnum.D) is myEnum)
    Assert.isTrue(myFuncGeneric<myEnum> is (myEnum) -> myEnum)
  
    var myClassImpl = myClass()
    Assert.isTrue(myClassImpl.classBoolFunc() is Bool)
    Assert.isTrue(myClassImpl.classBoolFunc(a: 9) is Bool)
    Assert.isTrue(myClassImpl.classBoolFunc is (Int32) -> Bool)

    var myStructImpl = myStruct()
    Assert.isTrue(myStructImpl.structStringFunc(true) is String)
    Assert.isTrue(myStructImpl.structStringFunc is (Bool) -> String)

    Assert.isTrue(myEnum.D.enumStringFunc(12.99) is String)
    Assert.isTrue(myEnum.D.enumStringFunc is (Float32) -> String)

    Assert.isTrue(myParentFunc0() is Bool)
    Assert.isTrue(myParentFunc0 is () -> Bool)
    Assert.isTrue(myParentFunc1 is () -> (() -> String))
}
