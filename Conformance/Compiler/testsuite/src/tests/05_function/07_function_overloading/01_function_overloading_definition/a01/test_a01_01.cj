/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a01_01

  @Level:         1

  @Assertion:       5.7.1(1) In the Cangjie programming language, overloading occurs when function definitions 
                    corresponding to the same function name in a scope do not constitute function redefinition. 
                    When an overload exists, it is necessary to identify which function definition is used when 
                    making a function call based on the contextual information and the argument types of the 
                    function call. 

  @Description:     Check that function definition allow overloading, functions with the same name and the same 
                    parameters set but in different scope do not constitute function overload and function usage 
                    depends on the contextual information and the argument types

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

abstract class myAClass {
    func myFunc(a: Int16) { a + 1 }
    func myFunc(a: Int32) { a + 1 }
    func myFunc(a: Int64) { a + 1 }

    func myFunc(a: Int64, b: String) { "${a} ${b}" }
    func myFunc(a: Int64, b: Rune) { "${a} ${b}" }
    func myFunc(a: Int64, b: Bool) { "${a} ${b}" }
}

class myClass <: myInterface {
    public func myFunc(a: Int16) { a + 1 }
    public func myFunc(a: Int32) { a + 1 }
    public func myFunc(a: Int64) { a + 1 }

    public func myFunc(a: Int64, b: String) { "myClass ${a} ${b}" }
    public func myFunc(a: Int64, b: Rune) { "myClass ${a} ${b}" }
    public func myFunc(a: Int64, b: Bool) { "myClass ${a} ${b}" }
}

struct myStruct {
    func myFunc(a: Int16) { a + 1 }
    func myFunc(a: Int32) { a + 1 }
    func myFunc(a: Int64) { a + 1 }

    func myFunc(a: Int64, b: String) { "myStruct ${a} ${b}" }
    func myFunc(a: Int64, b: Rune) { "myStruct ${a} ${b}" }
    func myFunc(a: Int64, b: Bool) { "myStruct ${a} ${b}" }
}

enum myEnum { 
  A 

    func myFunc(a: Int16) { a + 1 }
    func myFunc(a: Int32) { a + 1 }
    func myFunc(a: Int64) { a + 1 }

    func myFunc(a: Int64, b: String) { "myEnum ${a} ${b}" }
    func myFunc(a: Int64, b: Rune) { "myEnum ${a} ${b}" }
    func myFunc(a: Int64, b: Bool) { "myEnum ${a} ${b}" }
}

func myFunc(a: Int16) { a + 1 }
func myFunc(a: Int32) { a + 1 }
func myFunc(a: Int64) { a + 1 }

func myFunc(a: Int64, b: String) { "${a} ${b}" }
func myFunc(a: Int64, b: Rune) { "${a} ${b}" }
func myFunc(a: Int64, b: Bool) { "${a} ${b}" }

main() {

    var myInt16: Int16 = 13
    var myInt32: Int32 = 7
    var myInt64: Int64 = 8

    Assert.equals(14, myFunc(myInt16))
    Assert.equals(8, myFunc(myInt32))
    Assert.equals(9, myFunc(myInt64))

    Assert.equals("8 C", myFunc(myInt64, 'C'))
    Assert.equals("8 BBB", myFunc(myInt64, "BBB"))
    Assert.equals("8 true", myFunc(myInt64, true))

    var myClassImpl = myClass()
    Assert.equals(14, myClassImpl.myFunc(myInt16))
    Assert.equals(8, myClassImpl.myFunc(myInt32))
    Assert.equals(9, myClassImpl.myFunc(myInt64))

    Assert.equals("myClass 8 C", myClassImpl.myFunc(myInt64, 'C'))
    Assert.equals("myClass 8 BBB", myClassImpl.myFunc(myInt64, "BBB"))
    Assert.equals("myClass 8 true", myClassImpl.myFunc(myInt64, true))

    var myIImpl: myInterface = myClassImpl
    Assert.equals(14, myIImpl.myFunc(myInt16))
    Assert.equals(8, myIImpl.myFunc(myInt32))
    Assert.equals(9, myIImpl.myFunc(myInt64))

    Assert.equals("myClass 8 C", myIImpl.myFunc(myInt64, 'C'))
    Assert.equals("myClass 8 BBB", myIImpl.myFunc(myInt64, "BBB"))
    Assert.equals("myClass 8 true", myIImpl.myFunc(myInt64, true))

    var myStructImpl = myStruct()
    Assert.equals(14, myStructImpl.myFunc(myInt16))
    Assert.equals(8, myStructImpl.myFunc(myInt32))
    Assert.equals(9, myStructImpl.myFunc(myInt64))

    Assert.equals("myStruct 8 C", myStructImpl.myFunc(myInt64, 'C'))
    Assert.equals("myStruct 8 BBB", myStructImpl.myFunc(myInt64, "BBB"))
    Assert.equals("myStruct 8 true", myStructImpl.myFunc(myInt64, true))

    Assert.equals(14, myEnum.A.myFunc(myInt16))
    Assert.equals(8, myEnum.A.myFunc(myInt32))
    Assert.equals(9, myEnum.A.myFunc(myInt64))

    Assert.equals("myEnum 8 C", myEnum.A.myFunc(myInt64, 'C'))
    Assert.equals("myEnum 8 BBB", myEnum.A.myFunc(myInt64, "BBB"))
    Assert.equals("myEnum 8 true", myEnum.A.myFunc(myInt64, true))

}
