/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_01_a02_15

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

  @Description:  Cangjie type 'IntNative' is mapped to C type 'ssize_t'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

foreign func func_01(x: IntNative): Unit
foreign func func_02(): IntNative

main() {
    var Val: IntNative
    let Data : Array<IntNative> = [-2147483648, -32768, -128, -127,
                             0, 127, 128, 32767, 32768, 2147483647]
    for (item in Data) {
        unsafe {
            func_01(item)
            Val = func_02()
            Assert.equals(item, Val)
        }
    }
}