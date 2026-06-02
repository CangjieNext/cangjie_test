/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_12_a08_01

  @Level:         1

  @Assertion:    2.1.12(8) For example, VArray<Int32, $5>and VArray<Float64, $5> are
                 different types of VArray.VArray<Int32, $2> and VArray<Int32, $3>
                 are also different types of VArray.
  
  @Description:  Compiler emit error, when there is assignment of unconformed types

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:       0006077

  @Comment:     Compiler emit error on VArray<..., $3>

*/



main() {
    let arr1: VArray<Int32, $5> = VArray<Int32, $5> { i => i }
    var arr0 : VArray<Float64, $5> = arr1;
    0
}