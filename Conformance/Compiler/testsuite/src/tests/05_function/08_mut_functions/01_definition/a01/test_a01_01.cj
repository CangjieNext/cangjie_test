/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_01_a01_01

  @Level:         1

  @Assertion:       5.8.1(1) Mut functions are modified with the mut keyword, are only allowed to be defined in the 
                    interface, struct and struct extensions, and can only act on instance member functions (static 
                    member functions are not supported). 

  @Description:     Check that mut function definition is available according rules.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

interface myInterface { 
    static func myStaticFunc(): String
    mut func myFunc0(): Unit
    mut func myFunc1(): Int32
}

struct myStruct <: myInterface {
    var myInt32Var: Int32 = 10 
    var myBoolVar: Bool = true 
    public static func myStaticFunc(): String {"myStruct static"}
    public mut func myFunc0(): Unit {
        myInt32Var -= 1
    }
    public mut func myFunc1(): Int32 {
        myInt32Var -= 1
        myInt32Var
    }
    mut func myStructFunc(): Unit {
        myBoolVar = !myBoolVar
    }
} 

extend myStruct { 
    mut func myExtendFunc(): Unit {
        myBoolVar = !myBoolVar
    }
} 

main() {
    Assert.equals("myStruct static", myStruct.myStaticFunc())

    var myStructImpl = myStruct()
    Assert.equals(10, myStructImpl.myInt32Var)
    Assert.equals(true, myStructImpl.myBoolVar)
    myStructImpl.myStructFunc()
    Assert.equals(false, myStructImpl.myBoolVar)
    myStructImpl.myExtendFunc()
    Assert.equals(true, myStructImpl.myBoolVar)
    myStructImpl.myFunc0()
    Assert.equals(9, myStructImpl.myInt32Var)
    Assert.equals(8, myStructImpl.myFunc1())
    Assert.equals(8, myStructImpl.myInt32Var)

    0
} 
