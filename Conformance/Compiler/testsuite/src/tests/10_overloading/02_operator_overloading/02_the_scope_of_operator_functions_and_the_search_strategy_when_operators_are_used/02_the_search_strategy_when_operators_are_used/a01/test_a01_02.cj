 /*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        10_02_02_02_a01_02

  @Level:         1

  @Assertion:   10.2.2.2(1)
                With the above definition for the scope of operator functions, 
                the search strategy when operators are used can be defined. Since the search
                for a unary operator function is a subcase of the search for a binary operator,
                so only the search strategy for binary operators (denoted as op) are introduced
                (the search for unary operators follows the same strategy):
                Step 1: determine the type of the left operand lOperand and the type of the right
                         operand rOperand (assuming to be lType and rType respectively);
                Step 2: Search for all operator functions associated with lType with the name
                        op and the right operand type rType in the current scope of the calling
                        expression lOperand op rOperand. If there is one and only one such operator
                        function, convert the expression call to a call to this operator function;
                        if no such function is found, continue with step 3.
                Step 3: repeat step 2 in a lower scope. If no matching operator function is found 
                        in the lowest scope level (i.e., 0), terminate the search action and generates
                        a compilation error ( undefined function error);

  @Description:  Needed () operator overload function was seeked in different interfaces
                 Float operators are implemented directly in class

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Dependencies: aux_test_a02_01.cj

*/

import utils.assert.Assert
let i8 : Int8    = -8i8     
let i16: Int16   = -16i16   
let i32: Int32   = -32i32   
let i64: Int64   = -64i64   
let u8 : UInt8   =  8u8     
let u16: UInt16  =  16u16   
let u32: UInt32  =  32u32   
let u64: UInt64  =  64u64   
let f16: Float16 =  16.0f16 
let f32: Float32 =  32.0f32 
let f64: Float64 =  64.0f64 

interface IFI {
    operator func ()(arg: Int8) : Unit {
    }
     operator func ()(arg: Int16) : Unit {
    }

    operator func ()(arg:Int32) : Unit {
    }
     operator func ()(arg:Int64) : Unit {
    }
}  

interface IFU {
  
    operator func ()(arg:UInt8) : Unit {
    }
    operator func ()(arg:UInt16) : Unit {
    }
    operator func ()(arg:UInt32) : Unit {
    }
    operator func ()(arg:UInt64) : Unit {
    }
}  


class AuxTestA2202 <: IFI & IFU  {
     public operator func ()(arg:Float64) : Unit {
        Assert.equals(f64, arg)
    }
     public operator func ()(arg:Float32) : Unit {
        Assert.equals(f32, arg)
    }
     public operator func ()(arg:Float16) : Unit {
        Assert.equals(f16, arg)
    }
}


main(ina :Array<String>) {
    var klass : AuxTestA2202 = AuxTestA2202();
    klass(i8)
    klass(i16)
    klass(i32)
    klass(i64)

    klass(u8)
    klass(u16)
    klass(u32)
    klass(u64)

    klass(f16)
    klass(f32)
    klass(f64)

    0
}

