/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_02_a01_01

  @Level:         1

  @Assertion:     5.2(1) Each function has a specific type, which is determined by the types of its parameters 
                  (hereafter parameter type) and its return type, written in the form of parameterType -> 
                  returnType. 
                  functionType: 
                    : '(' (type (, type)*)? ')' '->' type

  @Description:   Check that function has specific type defined by parameters types and return type.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

type myFuncType0 = () -> Unit
type myFuncType1 = (Int32, Bool) -> String
type myFuncType2 = (Int32, Int32) -> (Int32, Int32)
type myFuncType3 = (Float32, Float32) -> (Float32, Float32) -> Float32 

interface myInterface {
    func myIFunc(): myFuncType0
    func myIFunc(a: Int32, b: Bool): (Int32, Bool) -> String
    func myFunc2(k: Int32, l: Int32): (Int32, Int32) -> (Int32, Int32)
    func myFunc3(a: Float32, b: Float32): (Float32, Float32) -> Float32
}

class myClass {
    func myFunc0(): Unit {}
    func myFunc1(x: Int32, y: Bool): String { "sdegflih" }
    func myFunc2(k: Int32, l: Int32): (Int32, Int32) { (k, l) }
    func myFunc3(s: Float32, t: Float32): (Float32, Float32) -> Float32 { {s, t => s + t} }
}

struct myStruct {
    func myFunc0(): Unit {}
    func myFunc1(x: Int32, y: Bool): String { "sdegflih" }
    func myFunc2(k: Int32, l: Int32): (Int32, Int32) { (k, l) }
    func myFunc3(s: Float32, t: Float32): (Float32, Float32) -> Float32 { {s, t => s - t} }
}

enum myEnum {
    B

    func myFunc0(): Unit {}
    func myFunc1(x: Int32, y: Bool): String { "sdegflih" }
    func myFunc2(k: Int32, l: Int32): (Int32, Int32) { (k, l) }
    func myFunc3(s: Float32, t: Float32): (Float32, Float32) -> Float32 { {s, t => s * t} }
}

func myFunc0(): Unit {}
func myFunc1(x: Int32, y: Bool): String { "sdegflih" }
func myFunc2(k: Int32, l: Int32): (Int32, Int32) { (k, l) }
func myFunc3(s: Float32, t: Float32): (Float32, Float32) -> Float32 { {s, t => s / t} }

main() {
    Assert.isTrue(myFunc0 is myFuncType0)
    Assert.isTrue(myFunc1 is myFuncType1)
    Assert.isTrue(myFunc2 is myFuncType2)
    Assert.isTrue(myFunc3 is myFuncType3)

    var myClassImpl = myClass()
    Assert.isTrue(myClassImpl.myFunc0 is myFuncType0)
    Assert.isTrue(myClassImpl.myFunc1 is myFuncType1)
    Assert.isTrue(myClassImpl.myFunc2 is myFuncType2)
    Assert.isTrue(myClassImpl.myFunc3 is myFuncType3)

    var myStructImpl = myStruct()
    Assert.isTrue(myStructImpl.myFunc0 is myFuncType0)
    Assert.isTrue(myStructImpl.myFunc1 is myFuncType1)
    Assert.isTrue(myStructImpl.myFunc2 is myFuncType2)
    Assert.isTrue(myStructImpl.myFunc3 is myFuncType3)

    Assert.isTrue(myEnum.B.myFunc0 is myFuncType0)
    Assert.isTrue(myEnum.B.myFunc1 is myFuncType1)
    Assert.isTrue(myEnum.B.myFunc2 is myFuncType2)
    Assert.isTrue(myEnum.B.myFunc3 is myFuncType3)
}
