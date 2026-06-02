/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_04_a02_03

  @Level:         1

  @Assertion:    13.1.3.4(2) When the element type TinVArray<T, $N> meets the CType constraint, 
  the VArray<T, $N> type also meets the CType constraint.
  class A{}// A is not a CType.
  let arr1 :VArray <A,$2>// arr1 is not a CType.
  let arr2 :VArray <Int64 ,$2>// arr2 is a CType.
 
  @Description:  Check VArray of String is not CType

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
  @Issue:        0006077

*/
class CTypeChecker<T> where T <: CType {}

@C struct SS {}

main() {
    let BadUnit    = CTypeChecker<VArray<String, $0>>()
}
