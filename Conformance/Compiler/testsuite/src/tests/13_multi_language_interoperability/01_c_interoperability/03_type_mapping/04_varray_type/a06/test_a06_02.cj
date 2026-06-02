/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_04_a06_02

  @Level:         1

  @Assertion:    13.1.3.4(6) If the parameter type in the CFunc signature is declared as CPointer<T> , 
  the corresponding argument can be an expression of the VArray<T, $N> type modified by inout. 
 
  @Description:  Check inout modifier cannot be omitted from VArray argument for parameter of type CPointer.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

foreign func func_01(x: CPointer<Int64>): Int8

main() {
    unsafe { func_01(VArray<Int64, $5> { i => i}) }
}
