/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_04_a04_01

  @Level:         1

  @Assertion:    13.1.3.4(4) If the parameter type in the CFunc signature is declared as VArray<T, $N>,
  the corresponding argument can only be an expression of the VArray<T, $N> type modified by inout. 
 
  @Description:  Check inout modifier cannot be omitted from argument for parameter of type VArray.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

foreign func func_01(x: VArray<Int64, $0>): Int8

main() {
    let a: VArray<Int64, $0> = [1, 2, 3, 3, 2, 1]
    unsafe { func_01(a) }
}
