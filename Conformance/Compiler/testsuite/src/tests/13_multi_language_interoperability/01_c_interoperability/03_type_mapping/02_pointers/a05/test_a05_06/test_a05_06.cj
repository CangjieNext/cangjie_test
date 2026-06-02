/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a05_06

  @Level:         1

  @Assertion:    13.1.3.2(5)  CPointer has a few member methods:
                 func isNull() : bool

                 // operator overloading
                 unsafe operator func + (offset: int64) : CPointer<T>
                 unsafe operator func - (offset: int64) : CPointer<T>

                 // read and write access
                 unsafe func read() : T
                 unsafe func write(value: T) : Unit

                 // read and write with offset
                 unsafe func read(idx: int64) : T
                 unsafe func write(idx: int64, value: T) : Unit

  @Description:  Check 'CPointer<Int32>.write'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(): CPointer<Int32>

main() {
    var Ptr : CPointer<Int32> = unsafe{ func_01() }
    Assert.isFalse(Ptr.isNull())
    var Val = unsafe{ Ptr.read(0) }
    Assert.equals(77, Val)
    Val = unsafe{ Ptr.read(1) }
    Assert.equals(-666, Val)
    unsafe{ Ptr.write(0, -123) }
    unsafe{ Ptr.write(1, 22) }
    Val = unsafe{ Ptr.read(0) }
    Assert.equals(-123, Val)
    Val = unsafe{ Ptr.read(1) }
    Assert.equals(22, Val)
}