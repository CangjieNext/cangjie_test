/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_12_a07_01

  @Level:         1

  @Assertion:    2.1.12(7) 4.For 2 VArraytypes, if the type variables T are instantiated
                 as different types, or the $IntLiteral annotation lengths are not equal,
                 they are considered different VArraytypes.
  
  @Description:  Compiler emit error, when there is assignment of unconformed types

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:       0006077

  @Comment:     Compiler emit error on VArray<..., $3>

*/



main() {
    let arr1: VArray<Int64, $3> = VArray<Int64, $3> { i => i }
    var arr0 : VArray<Int32,$3> = arr1;
    0
}