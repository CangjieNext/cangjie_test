/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a04_01

  @Level:         1

  @Assertion:       5.7.1(4) • The parameter type must be different and one of the following conditions must be 
                    satisfied: 
                        – The number of function parameters are different. 
                        – The number of functions parameters are the same, but the parameter types at the 
                        corresponding positions are different. 
                        – Must be visible in a scope. 
 
  @Description:     Check that function definition allow overloading when functions in one scope with the same names 
                    has different parameter types or different order of parameters.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

interface myInterface {
    func myFunc0(a: Int64): String
    func myFunc0(a: Int64, b: String): String
    func myFunc0(a: Int64, b: String, c: Rune): String

    func myFunc1(a: Int64, b: String) { "myInterface 1 ${a} ${b}" }
    func myFunc1(a: Int64, b: Rune) { "myInterface 1 ${a} ${b}" }

    func myFunc2(a: Int32, b: String) { "myInterface ${a} ${b}" }
    func myFunc2(b: String, a: Int32) { "myInterface ${a} ${b}" }
}

abstract class myAClass {
    func myFunc0(a: Int64) { "${a}" }
    func myFunc0(a: Int64, b: String) { "${a} ${b}" }
    func myFunc0(a: Int64, b: String, c: Rune) { "${a} ${c} ${b}" }
	
    func myFunc1(a: Int64, b: String) { "1 ${a} ${b}" }
    func myFunc1(a: Int64, b: Rune) { "1 ${a} ${b}" }

    func myFunc2(a: Int32, b: String) { "2 ${a} ${b}" }
    func myFunc2(b: String, a: Int32) { "2 ${a} ${b}" }
}

class myClass <: myInterface {
    public func myFunc0(a: Int64) { "myClass ${a}" }
    public func myFunc0(a: Int64, b: String) { "myClass ${a} ${b}" }
    public func myFunc0(a: Int64, b: String, c: Rune) { "myClass ${a} ${c} ${b}" }
	
    public func myFunc1(a: Int64, b: String) { "myClass 1 ${a} ${b}" }
    public func myFunc1(a: Int64, b: Rune) { "myClass 1 ${a} ${b}" }

    public func myFunc2(a: Int32, b: String) { "myClass 2 ${a} ${b}" }
    public func myFunc2(b: String, a: Int32) { "myClass 2 ${a} ${b}" }
}

struct myStruct {
    public func myFunc0(a: Int64) { "myStruct ${a}" }
    public func myFunc0(a: Int64, b: String) { "myStruct ${a} ${b}" }
    public func myFunc0(a: Int64, b: String, c: Rune) { "myStruct ${a} ${c} ${b}" }
	
    public func myFunc1(a: Int64, b: String) { "myStruct 1 ${a} ${b}" }
    public func myFunc1(a: Int64, b: Rune) { "myStruct 1 ${a} ${b}" }

    public func myFunc2(a: Int32, b: String) { "myStruct 2 ${a} ${b}" }
    public func myFunc2(b: String, a: Int32) { "myStruct 2 ${a} ${b}" }
}

enum myEnum { 
	A 

    public func myFunc0(a: Int64) { "myEnum ${a}" }
    public func myFunc0(a: Int64, b: String) { "myEnum ${a} ${b}" }
    public func myFunc0(a: Int64, b: String, c: Rune) { "myEnum ${a} ${c} ${b}" }
	
    public func myFunc1(a: Int64, b: String) { "myEnum 1 ${a} ${b}" }
    public func myFunc1(a: Int64, b: Rune) { "myEnum 1 ${a} ${b}" }

    public func myFunc2(a: Int32, b: String) { "myEnum 2 ${a} ${b}" }
    public func myFunc2(b: String, a: Int32) { "myEnum 2 ${a} ${b}" }
}

func myFunc0(a: Int64) { "global ${a}" }
func myFunc0(a: Int64, b: String) { "global ${a} ${b}" }
func myFunc0(a: Int64, b: String, c: Rune) { "global ${a} ${c} ${b}" }

func myFunc1(a: Int64, b: String) { "global 1 ${a} ${b}" }
func myFunc1(a: Int64, b: Rune) { "global 1 ${a} ${b}" }

func myFunc2(a: Int32, b: String) { "global 2 ${a} ${b}" }
func myFunc2(b: String, a: Int32) { "global 2 ${a} ${b}" }

main() {

    Assert.equals("global 16", myFunc0(16))
    Assert.equals("global 16 DDD", myFunc0(16, "DDD"))
    Assert.equals("global 16 C DDD", myFunc0(16, "DDD", r'C'))
    Assert.equals("global 1 16 DDD", myFunc1(16, "DDD"))
    Assert.equals("global 1 16 D", myFunc1(16, r'D'))
    Assert.equals("global 2 16 DDD", myFunc2(16, "DDD"))
    Assert.equals("global 2 16 DDD", myFunc2("DDD", 16))

    var myClassImpl = myClass()
    Assert.equals("myClass 16", myClassImpl.myFunc0(16))
    Assert.equals("myClass 16 DDD", myClassImpl.myFunc0(16, "DDD"))
    Assert.equals("myClass 16 C DDD", myClassImpl.myFunc0(16, "DDD", r'C'))
    Assert.equals("myClass 1 16 DDD", myClassImpl.myFunc1(16, "DDD"))
    Assert.equals("myClass 1 16 D", myClassImpl.myFunc1(16, r'D'))
    Assert.equals("myClass 2 16 DDD", myClassImpl.myFunc2(16, "DDD"))
    Assert.equals("myClass 2 16 DDD", myClassImpl.myFunc2("DDD", 16))

    var myStructImpl = myStruct()
    Assert.equals("myStruct 16", myStructImpl.myFunc0(16))
    Assert.equals("myStruct 16 DDD", myStructImpl.myFunc0(16, "DDD"))
    Assert.equals("myStruct 16 C DDD", myStructImpl.myFunc0(16, "DDD", r'C'))
    Assert.equals("myStruct 1 16 DDD", myStructImpl.myFunc1(16, "DDD"))
    Assert.equals("myStruct 1 16 D", myStructImpl.myFunc1(16, r'D'))
    Assert.equals("myStruct 2 16 DDD", myStructImpl.myFunc2(16, "DDD"))
    Assert.equals("myStruct 2 16 DDD", myStructImpl.myFunc2("DDD", 16))

    Assert.equals("myEnum 16", myEnum.A.myFunc0(16))
    Assert.equals("myEnum 16 DDD", myEnum.A.myFunc0(16, "DDD"))
    Assert.equals("myEnum 16 C DDD", myEnum.A.myFunc0(16, "DDD", r'C'))
    Assert.equals("myEnum 1 16 DDD", myEnum.A.myFunc1(16, "DDD"))
    Assert.equals("myEnum 1 16 D", myEnum.A.myFunc1(16, r'D'))
    Assert.equals("myEnum 2 16 DDD", myEnum.A.myFunc2(16, "DDD"))
    Assert.equals("myEnum 2 16 DDD", myEnum.A.myFunc2("DDD", 16))

}

