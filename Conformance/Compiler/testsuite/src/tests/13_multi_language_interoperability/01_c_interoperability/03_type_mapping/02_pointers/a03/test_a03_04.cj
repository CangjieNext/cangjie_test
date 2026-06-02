/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a03_04

  @Level:         1

  @Assertion:    13.1.3.2(3)  * the arithmetic operations and read/write
                 operations should be enclosed in unsafe context.

  @Description:  'CPointer<T>.read(idx)' cannot be used outside unsafe block.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

foreign func func_01() : CPointer<Int32>

main() {
    var Ptr : CPointer<Int32> = unsafe{ func_01() }
    var Value : Int32 = Ptr.read(22);
}