/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a04_01

  @Level:         1

  @Assertion:       5.3.2(4) 2 Type checking based on the arguments in the call expression and the return type Tr 
                    specified in the context of the call expression. 

  @Description:     Check that only functions with requested in call expression arguments types and return type 
                    will pass checking and will be invoked.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

interface myInterface {
    func myFunc(a: Int16): Int16
    func myFunc(a: Int32): Int32
    func myFunc(a: Int64): Int64

    func myFunc(a: Int64, b: String) { "myInterface ${a} ${b}" }
    func myFunc(a: Int64, b: Rune) { "myInterface ${a} ${b}" }
    func myFunc(a: Int64, b: Bool) { "myInterface ${a} ${b}" }
}

class myClass <: myInterface {
    public func myFunc(a: Int16) { a + 1 }
    public func myFunc(a: Int32) { a + 1 }
    public func myFunc(a: Int64) { a + 1 }

    public func myFunc(a: Int64, b: String) { "myClass myFunc(a: Int64, b: String)" }
    public func myFunc(a: Int64, b: Rune) { "myClass myFunc(a: Int64, b: Rune)" }
    public func myFunc(a: Int64, b: Bool) { "myClass myFunc(a: Int64, b: Bool)" }
}

struct myStruct {
    func myFunc(a: Int16) { a + 1 }
    func myFunc(a: Int32) { a + 1 }
    func myFunc(a: Int64) { a + 1 }

    func myFunc(a: Int64, b: String) { "myStruct myFunc(a: Int64, b: String)" }
    func myFunc(a: Int64, b: Rune) { "myStruct myFunc(a: Int64, b: Rune)" }
    func myFunc(a: Int64, b: Bool) { "myStruct myFunc(a: Int64, b: Bool)" }
}

enum myEnum { 
  A 

    func myFunc(a: Int16) { a + 1 }
    func myFunc(a: Int32) { a + 1 }
    func myFunc(a: Int64) { a + 1 }

    func myFunc(a: Int64, b: String) { "myEnum myFunc(a: Int64, b: String)" }
    func myFunc(a: Int64, b: Rune) { "myEnum myFunc(a: Int64, b: Rune)" }
    func myFunc(a: Int64, b: Bool) { "myEnum myFunc(a: Int64, b: Bool)" }
}

func myFunc(a: Int16): Int16 { a + 1 }
func myFunc(a: Int32): Int32 { a + 1 }
func myFunc(a: Int64): Int64 { a + 1 }
func myFunc<T1>(a: T1): T1 { a }

func myFunc(a: Int64, b: String) { "myFunc(a: Int64, b: String)" }
func myFunc(a: Int64, b: Rune) { "myFunc(a: Int64, b: Rune)" }
func myFunc(a: Int64, b: Bool) { "myFunc(a: Int64, b: Bool)" }

func myFunc<T1, T2>(a: T1, b: T2): String { "myFunc(a: T1, b: T2)" }

main() {

    var myInt16: Int16 = 13
    var myInt32: Int32 = 7
    var myInt64: Int64 = 8

    Assert.equals(22, myFunc<Int16>(22))
    Assert.isTrue(myFunc<Int16> is (Int16) -> Int16)
    var myTestVar: Int16 = myFunc<Int16>(22)
    Assert.equals(14, myFunc(myInt16))
    myTestVar = myFunc(myInt16)
    Assert.equals(8, myFunc(myInt32))
    Assert.equals(9, myFunc(myInt64))

    Assert.equals("myFunc(a: Int64, b: Rune)", myFunc(myInt64, r'C'))
    Assert.equals("myFunc(a: Int64, b: String)", myFunc(myInt64, "BBB"))
    Assert.equals("myFunc(a: Int64, b: Bool)", myFunc(myInt64, true))

    Assert.equals("myFunc(a: T1, b: T2)", myFunc<Int64, Rune>(myInt64, r'C'))
    Assert.isTrue(myFunc<Int64, Rune> is (Int64, Rune) -> String)

    var myClassImpl = myClass()
    Assert.equals(14, myClassImpl.myFunc(myInt16))
    Assert.equals(8, myClassImpl.myFunc(myInt32))
    Assert.equals(9, myClassImpl.myFunc(myInt64))

    Assert.equals("myClass myFunc(a: Int64, b: Rune)", myClassImpl.myFunc(myInt64, r'C'))
    Assert.equals("myClass myFunc(a: Int64, b: String)", myClassImpl.myFunc(myInt64, "BBB"))
    Assert.equals("myClass myFunc(a: Int64, b: Bool)", myClassImpl.myFunc(myInt64, true))

    var myIImpl: myInterface = myClassImpl
    Assert.equals(14, myIImpl.myFunc(myInt16))
    Assert.equals(8, myIImpl.myFunc(myInt32))
    Assert.equals(9, myIImpl.myFunc(myInt64))

    Assert.equals("myClass myFunc(a: Int64, b: Rune)", myIImpl.myFunc(myInt64, r'C'))
    Assert.equals("myClass myFunc(a: Int64, b: String)", myIImpl.myFunc(myInt64, "BBB"))
    Assert.equals("myClass myFunc(a: Int64, b: Bool)", myIImpl.myFunc(myInt64, true))

    var myStructImpl = myStruct()
    Assert.equals(14, myStructImpl.myFunc(myInt16))
    Assert.equals(8, myStructImpl.myFunc(myInt32))
    Assert.equals(9, myStructImpl.myFunc(myInt64))

    Assert.equals("myStruct myFunc(a: Int64, b: Rune)", myStructImpl.myFunc(myInt64, r'C'))
    Assert.equals("myStruct myFunc(a: Int64, b: String)", myStructImpl.myFunc(myInt64, "BBB"))
    Assert.equals("myStruct myFunc(a: Int64, b: Bool)", myStructImpl.myFunc(myInt64, true))

    Assert.equals(14, myEnum.A.myFunc(myInt16))
    Assert.equals(8, myEnum.A.myFunc(myInt32))
    Assert.equals(9, myEnum.A.myFunc(myInt64))

    Assert.equals("myEnum myFunc(a: Int64, b: Rune)", myEnum.A.myFunc(myInt64, r'C'))
    Assert.equals("myEnum myFunc(a: Int64, b: String)", myEnum.A.myFunc(myInt64, "BBB"))
    Assert.equals("myEnum myFunc(a: Int64, b: Bool)", myEnum.A.myFunc(myInt64, true))

}
