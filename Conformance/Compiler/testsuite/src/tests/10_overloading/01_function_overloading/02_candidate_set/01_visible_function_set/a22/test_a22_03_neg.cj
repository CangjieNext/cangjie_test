 /*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a22_03_neg

  @Level:         1

  @Assertion:   10.1.2.1(22) 4) If T implements interfaces, the () operator overload function 
                obtained from the interface with the default implementation is also included.

  @Description:  Emit error as it is used  undeclared  () operator  in interface
                 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

import utils.assert.Assert
let i8 : Int8    = -8i8     
let i16: Int16   = -16i16   
let i32: Int32   = -32i32   

interface IF {
    operator func ()(arg: Int8) : Unit {
        Assert.equals(i8, arg)
    }
    operator func ()(arg: Int16) : Unit {
        Assert.equals(i16, arg)
    }

}

open class AuxTestA2202 <: IF {

}


main(ina :Array<String>) {
    var klass : AuxTestA2202 = AuxTestA2202();
    klass(i8)
    klass(i16)
    klass(i32)
    0
}

