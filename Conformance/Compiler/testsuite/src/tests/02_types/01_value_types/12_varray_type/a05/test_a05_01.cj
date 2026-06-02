/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_12_a05_01

  @Level:         1

  @Assertion:    2.1.12(5) When the provided integer literal is a negative number,
                 an error will be raised during compilation.
  
  @Description:  Check negative number for VArray size

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:       0006077

  @Comment:     Compiler emit error on VArray<..., $3>

*/


main() {
    let arr1: VArray<Int64, $-3> = []
    0
}