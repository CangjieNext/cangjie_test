/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a02_01

  @Level:         1

  @Assertion:       5.3.2(2) 1 If type arguments are specified in the function call expression, only functions whose 
                    type parameters quantity is the same as specified type arguments may pass the type checking. For 
                    example, assuming that function call expression is f<T1, ..., Tm>(A1, ..., An), and m type 
                    arguments are specified, the function who pass the type checking must have m type parameters.

  @Description:     Check that if call function with typed arguments in specific order - will be invoked function with 
                    the sutable set of parameters.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func myFunc0(a: Int32) {"myClass.myFunc0(a: Int32)"}
    func myFunc0(a: Rune) {"myClass.myFunc0(a: Rune)"}
    func myFunc0(a: Bool) {"myClass.myFunc0(a: Bool)"}

    func myFunc1(a!: Int32, b!: Int64) {"myClass.myFunc1(a!: Int32, b!: Int64)"}
    func myFunc1(a!: Int64, b!: Int32) {"myClass.myFunc1(a!: Int64, b!: Int32)"}
    func myFunc1(a!: Int32, b!: String) {"myClass.myFunc1(a!: Int32, b!: String)"}
    func myFunc1(a!: Int32, b!: Bool) {"myClass.myFunc1(a!: Int32, b!: Bool)"}

    func myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>) {
        "myClass.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)"
    }
    func myFunc2(a: Int32, b: Int64, c: Bool, d: Bool) {"myClass.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)"}
    func myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Int32>) {
        "myClass.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Int32>)"
    }
    func myFunc2(a: Int32, b: Int64, c: Bool, d: Array<String>) {
        "myClass.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<String>)"
    }
}

struct myStruct {
    func myFunc0(a: Int32) {"myStruct.myFunc0(a: Int32)"}
    func myFunc0(a: Rune) {"myStruct.myFunc0(a: Rune)"}
    func myFunc0(a: Bool) {"myStruct.myFunc0(a: Bool)"}

    func myFunc1(a: Int32, b: Int64) {"myStruct.myFunc1(a: Int32, b: Int64)"}
    func myFunc1(a: Int32, b: String) {"myStruct.myFunc1(a: Int32, b: String)"}
    func myFunc1(a: Int32, b: Bool) {"myStruct.myFunc1(a: Int32, b: Bool)"}

    func myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>) {
        "myStruct.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)"
    }
    func myFunc2(a: Int32, b: Int64, c: Bool, d: Bool) {"myStruct.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)"}
    func myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Int32>) {
        "myStruct.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Int32>)"
    }
    func myFunc2(a: Int32, b: Int64, c: Bool, d: Array<String>) {
        "myStruct.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<String>)"
    }
}

enum myEnum {
	E
	
    func myFunc0(a: Int32) {"myEnum.myFunc0(a: Int32)"}
    func myFunc0(a: Rune) {"myEnum.myFunc0(a: Rune)"}
    func myFunc0(a: Bool) {"myEnum.myFunc0(a: Bool)"}

    func myFunc1(a: Int32, b: Int64) {"myEnum.myFunc1(a: Int32, b: Int64)"}
    func myFunc1(a: Int32, b: String) {"myEnum.myFunc1(a: Int32, b: String)"}
    func myFunc1(a: Int32, b: Bool) {"myEnum.myFunc1(a: Int32, b: Bool)"}

    func myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>) {
        "myEnum.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)"
    }
    func myFunc2(a: Int32, b: Int64, c: Bool, d: Bool) {"myEnum.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)"}
    func myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Int32>) {
        "myEnum.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Int32>)"
    }
    func myFunc2(a: Int32, b: Int64, c: Bool, d: Array<String>) {
        "myEnum.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<String>)"
    }
}

func myFunc0(a: Int32) {"myFunc0(a: Int32)"}
func myFunc0(a: Rune) {"myFunc0(a: Rune)"}
func myFunc0(a: Bool) {"myFunc0(a: Bool)"}

func myFunc1(a: Int32, b: Int64) {"myFunc1(a: Int32, b: Int64)"}
func myFunc1(a: Int32, b: String) {"myFunc1(a: Int32, b: String)"}
func myFunc1(a: Int32, b: Bool) {"myFunc1(a: Int32, b: Bool)"}

func myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>) {
    "myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)"
}
func myFunc2(a: Int32, b: Int64, c: Bool, d: Bool) {
    "myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)"
}
func myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Int32>) {
    "myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Int32>)"
}
func myFunc2(a: Int32, b: Int64, c: Bool, d: Array<String>) {
    "myFunc2(a: Int32, b: Int64, c: Bool, d: Array<String>)"
}

main() {
    Assert.equals("myFunc0(a: Bool)", myFunc0(true))
    Assert.notEquals("myFunc0(a: Rune)", myFunc0(true))
    Assert.notEquals("myFunc0(a: Int32)", myFunc0(true))

    Assert.equals("myFunc1(a: Int32, b: Int64)", myFunc1(32, 64))
    Assert.notEquals("myFunc1(a: Int32, b: String)", myFunc1(32, 64))
    Assert.notEquals("myFunc1(a: Int32, b: Bool)", myFunc1(32, 64))

    Assert.equals("myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", myFunc2(12, 64, false, [true, false]))
    Assert.notEquals("myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", myFunc2(12, 64, false, [true, false]))
    Assert.equals("myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", myFunc2(12, 64, false, true, false))
    Assert.notEquals("myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", myFunc2(12, 64, false, true, false))
    Assert.notEquals("myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", myFunc2(12, 64, false, true))
    Assert.equals("myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", myFunc2(12, 64, false, true))
    Assert.equals("myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", myFunc2(12, 64, false, [true]))
    Assert.notEquals("myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", myFunc2(12, 64, false, [true]))

    var myClassImpl = myClass()
    Assert.equals("myClass.myFunc0(a: Bool)", myClassImpl.myFunc0(true))
    Assert.notEquals("myClass.myFunc0(a: Rune)", myClassImpl.myFunc0(true))
    Assert.notEquals("myClass.myFunc0(a: Int32)", myClassImpl.myFunc0(true))
    var a: Int32 = 32
    var b: Int64 = 64
    Assert.equals("myClass.myFunc1(a!: Int32, b!: Int64)", myClassImpl.myFunc1(a: a, b: b))
    Assert.notEquals("myClass.myFunc1(a!: Int64, b!: Int32)", myClassImpl.myFunc1(a: a, b: b))
    Assert.notEquals("myClass.myFunc1(a!: Int32, b!: String)", myClassImpl.myFunc1(a: a, b: b))
    Assert.notEquals("myClass.myFunc1(a!: Int32, b!: Bool)", myClassImpl.myFunc1(a: a, b: b))

    Assert.equals("myClass.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", 
        myClassImpl.myFunc2(12, 64, false, [true, false]))
    Assert.notEquals("myClass.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", 
        myClassImpl.myFunc2(12, 64, false, [true, false]))
    Assert.equals("myClass.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", 
        myClassImpl.myFunc2(12, 64, false, true, false))
    Assert.notEquals("myClass.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", 
        myClassImpl.myFunc2(12, 64, false, true, false))
    Assert.notEquals("myClass.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", 
        myClassImpl.myFunc2(12, 64, false, true))
    Assert.equals("myClass.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", myClassImpl.myFunc2(12, 64, false, true))
    Assert.equals("myClass.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", 
        myClassImpl.myFunc2(12, 64, false, [true]))
    Assert.notEquals("myClass.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", 
        myClassImpl.myFunc2(12, 64, false, [true]))

    var myStructImpl = myStruct()
    Assert.equals("myStruct.myFunc0(a: Bool)", myStructImpl.myFunc0(true))
    Assert.notEquals("myStruct.myFunc0(a: Rune)", myStructImpl.myFunc0(true))
    Assert.notEquals("myStruct.myFunc0(a: Int32)", myStructImpl.myFunc0(true))

    Assert.equals("myStruct.myFunc1(a: Int32, b: Int64)", myStructImpl.myFunc1(32, 64))
    Assert.notEquals("myStruct.myFunc1(a: Int32, b: String)", myStructImpl.myFunc1(32, 64))
    Assert.notEquals("myStruct.myFunc1(a: Int32, b: Bool)", myStructImpl.myFunc1(32, 64))

    Assert.equals("myStruct.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", 
        myStructImpl.myFunc2(12, 64, false, [true, false]))
    Assert.notEquals("myStruct.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", 
        myStructImpl.myFunc2(12, 64, false, [true, false]))
    Assert.equals("myStruct.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", 
        myStructImpl.myFunc2(12, 64, false, true, false))
    Assert.notEquals("myStruct.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", 
        myStructImpl.myFunc2(12, 64, false, true, false))
    Assert.notEquals("myStruct.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", 
        myStructImpl.myFunc2(12, 64, false, true))
    Assert.equals("myStruct.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", 
        myStructImpl.myFunc2(12, 64, false, true))
    Assert.equals("myStruct.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", 
        myStructImpl.myFunc2(12, 64, false, [true]))
    Assert.notEquals("myStruct.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", 
        myStructImpl.myFunc2(12, 64, false, [true]))

    Assert.equals("myEnum.myFunc0(a: Bool)", myEnum.E.myFunc0(true))
    Assert.notEquals("myEnum.myFunc0(a: Rune)", myEnum.E.myFunc0(true))
    Assert.notEquals("myEnum.myFunc0(a: Int32)", myEnum.E.myFunc0(true))

    Assert.equals("myEnum.myFunc1(a: Int32, b: Int64)", myEnum.E.myFunc1(32, 64))
    Assert.notEquals("myEnum.myFunc1(a: Int32, b: String)", myEnum.E.myFunc1(32, 64))
    Assert.notEquals("myEnum.myFunc1(a: Int32, b: Bool)", myEnum.E.myFunc1(32, 64))

    Assert.equals("myEnum.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", 
        myEnum.E.myFunc2(12, 64, false, [true, false]))
    Assert.notEquals("myEnum.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", 
        myEnum.E.myFunc2(12, 64, false, [true, false]))
    Assert.equals("myEnum.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", 
        myEnum.E.myFunc2(12, 64, false, true, false))
    Assert.notEquals("myEnum.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", 
        myEnum.E.myFunc2(12, 64, false, true, false))
    Assert.notEquals("myEnum.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", 
        myEnum.E.myFunc2(12, 64, false, true))
    Assert.equals("myEnum.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", 
        myEnum.E.myFunc2(12, 64, false, true))
    Assert.equals("myEnum.myFunc2(a: Int32, b: Int64, c: Bool, d: Array<Bool>)", 
        myEnum.E.myFunc2(12, 64, false, [true]))
    Assert.notEquals("myEnum.myFunc2(a: Int32, b: Int64, c: Bool, d: Bool)", 
        myEnum.E.myFunc2(12, 64, false, [true]))
}
