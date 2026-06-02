/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a09_16

  @Level:         1

  @Assertion:    13.1.2.2(9)  As with the foreign functions, the parameters and
                 return types of other forms of CFunc must conform the CType
                 constraint, and named parameters and parameter default values
                 are not supported.

  @Description:  VArray is not allowed as CFunc return type.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:        0006077

  @Comment:      

*/

main() {
    var CB: CFunc<(Int32)->VArray<Int32, $3>> = { x => [0, 1, 2] }
}
