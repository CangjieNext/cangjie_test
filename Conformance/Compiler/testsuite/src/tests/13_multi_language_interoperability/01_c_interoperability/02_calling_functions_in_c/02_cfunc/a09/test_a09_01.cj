/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a09_01

  @Level:         1

  @Assertion:    13.1.2.2(9)  As with the foreign functions, the parameters and
                 return types of other forms of CFunc must conform the CType
                 constraint, and named parameters and parameter default values
                 are not supported.

  @Description:  Rune is not allowed in CFunc parameters.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:        0006348

  @Comment:      

*/

main() {
    var CB: CFunc<(Rune)->Int32> = { x => 0 }
}
