/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_04_a03_02

  @Level:         1

  @Assertion:    13.1.3.4(3) VArray is allowed to be used as parameter type of CFunc signatures,
  but not allowed as return type. 
 
  @Description:  VArray is not allowed as return type.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
  @Issue:        0006077

*/
let f1: CFunc<(Int8) -> VArray<Int8, $10>> = { val => VArray<Int8, $10>(repeat: val) }

main() {
}
