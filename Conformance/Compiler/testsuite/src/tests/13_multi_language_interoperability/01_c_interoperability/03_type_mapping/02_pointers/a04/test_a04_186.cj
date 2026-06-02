/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a04_186

  @Level:         1

  @Assertion:    13.1.3.2(4)  * CPointer<T1> is allowed to cast to CPointer<T2>
                 in unsafe context.

  @Description:  Type 'CPointer<Int32>' can be casted to 'CPointer<UInt16>' in
                 unsafe context only.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:        0006172

  @Comment:      

*/

foreign func func_01(): CPointer<Int32>

main() {
    var Ptr : CPointer<Int32> = unsafe{ func_01() }
    var Ptr2: CPointer<UInt16> = CPointer<UInt16>(Ptr)
}