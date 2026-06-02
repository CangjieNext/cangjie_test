/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_01_a02_01

  @Level:         1

  @Assertion:    13.1.3.1(2) The ** fundamental type mapping table ** matching
                 the Cangjie programming language and C language is as follows:
                    Cangjie Type      C type       Size 
                    Unit              void         0 
                    Bool              bool         1 
                    Int8              int8_t       1 
                    UInt8             uint8_t      1 
                    Int16             int16_t      2 
                    UInt16            uint16_t     2 
                    Int32             int32_t      4 
                    UInt32            uint32_t     4 
                    Int64             int64_t      8 
                    UInt64            uint64_t     8 
                    IntNative         ssize_t      platform dependent 
                    UIntNative        size_t       platform dependent 
                    Float32           float        4 
                    Float64           double       8 

  @Description:  Cangjie type 'Unit' is mapped to C type 'void'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(): CPointer<Int32>
foreign func func_02(x: CPointer<Int32>): Unit

main() {
    var Ptr : CPointer<Int32>
    var Val : Int32
    unsafe {
        Ptr = func_01()
        Ptr.write(777)
        Val = Ptr.read()
    }
    Assert.equals(777, Val)
    unsafe {
        func_02(Ptr)
        Val = Ptr.read()
    }
    Assert.equals(666, Val)
}