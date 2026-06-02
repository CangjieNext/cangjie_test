/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a21_03

  @Level:         1

  @Comment:      It is a header of a list of assetions which include current assertion: 
                 In addition to the preceding syntax definitions, local variables may be introduced 
                 in the following scenarios:

  @Assertion:    3.3.1(21) Parameters in function and lambda definitions. For details, see Parameters.

  @Description:  Parameters in function definition - check that local variable used as parameter 
                 is invisibile out of scope
                 Case: after function call

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

func myFunc(mylocalUnnamed1: Int32): Int32 { mylocalUnnamed1 * 2 }

main() {
    let myVar = myFunc(15)
    print("myVar ${myVar}")
    print("mylocalUnnamed1 ${mylocalUnnamed1}")
}