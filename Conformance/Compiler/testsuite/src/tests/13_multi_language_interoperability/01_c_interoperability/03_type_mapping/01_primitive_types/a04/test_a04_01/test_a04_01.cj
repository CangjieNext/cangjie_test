/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_01_a04_01

  @Level:         1

  @Assertion:    13.1.3.1(4)  The types of the parameters and return values of
                 the foreign function in the Cangjie programming language need
                 to correspond to the types of C function parameters and return
                 values.

  @Description:  Check if argument in foreign function call correspond to C
                 function parameters.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      Tests for each basic type are provided in the assertion:
  
                    13.1.3.1(2) The ** fundamental type mapping table ** matching
                    the Cangjie programming language and C language is as follows:
                    ...

*/

import utils.assert.Assert

foreign func initialize(): CPointer<Int32>
foreign func func_01(x: Int32, y: CPointer<Int32>, z: Float64): Float32

main() {
    var Ptr : CPointer<Int32> = unsafe{ initialize() }
    var Value : Float32 = unsafe { func_01(222, Ptr, 2.0f64) }
    Assert.approxEquals(1.414213562373095048801688724209f32, Value);
}