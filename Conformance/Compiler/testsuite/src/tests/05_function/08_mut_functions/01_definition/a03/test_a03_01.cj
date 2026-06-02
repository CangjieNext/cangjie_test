/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_01_a03_01

  @Level:         1

  @Assertion:       5.8.1(3) The mut function allows you to assign values to the fields of a struct instance, and 
                    these assignments modify the instance and take effect immediately. As with the instance member 
                    functions, this is not required and can be inferred by the compiler. 

  @Description:     Check that mut struct member functions allow assign values to the fields of a struct instance and
                    keyword 'this' is not required.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

import utils.assert.Assert

interface myInterface { 
    mut func myFunc0(): Unit
    mut func myFunc1(): Int32
}

struct myStruct <: myInterface {
    var myInt32Var: Int32 = 10 
    var myBoolVar: Bool = true 
    public mut func myFunc0(): Unit {
        myInt32Var -= 1
    }
    public mut func myFunc0WithThis(): Unit {
        this.myInt32Var -= 1
    }
    public mut func myFunc1(): Int32 {
        myInt32Var -= 1
        myInt32Var
    }
    public mut func myFunc1WithThis(): Int32 {
        this.myInt32Var -= 1
        this.myInt32Var
    }
    mut func myStructFunc(): Unit {
        myBoolVar = !myBoolVar
    }
    mut func myStructFuncWithThis(): Unit {
        this.myBoolVar = !this.myBoolVar
    }
} 

extend myStruct { 
    mut func myExtendFunc(): Unit {
        myBoolVar = !myBoolVar
    }
    mut func myExtendFuncWithThis(): Unit {
        this.myBoolVar = !this.myBoolVar
    }
} 

main() { 

    var myStructImpl = myStruct()
    Assert.equals(10, myStructImpl.myInt32Var)
    Assert.equals(true, myStructImpl.myBoolVar)

    myStructImpl.myStructFunc()
    Assert.equals(false, myStructImpl.myBoolVar)
    myStructImpl.myStructFuncWithThis()
    Assert.equals(true, myStructImpl.myBoolVar)
    myStructImpl.myExtendFunc()
    Assert.equals(false, myStructImpl.myBoolVar)
    myStructImpl.myExtendFuncWithThis()
    Assert.equals(true, myStructImpl.myBoolVar)

    myStructImpl.myFunc0()
    Assert.equals(9, myStructImpl.myInt32Var)
    myStructImpl.myFunc0WithThis()
    Assert.equals(8, myStructImpl.myInt32Var)

    Assert.equals(7, myStructImpl.myFunc1())
    Assert.equals(7, myStructImpl.myInt32Var)
    Assert.equals(6, myStructImpl.myFunc1WithThis())
    Assert.equals(6, myStructImpl.myInt32Var)

    0

} 
