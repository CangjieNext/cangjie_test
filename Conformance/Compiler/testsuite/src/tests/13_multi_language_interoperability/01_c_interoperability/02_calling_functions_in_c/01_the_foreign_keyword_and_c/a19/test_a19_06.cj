/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a19_06

  @Level:         1

  @Assertion:    13.1.2.1(19) Variable-length parameters must meet the CType
                 constraint but do not have to be of the same type.

  @Description:  Struct is not allowed in variable-length parameter.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

foreign func func_01(x: Int32, ...): Int32

struct ABC {}

main() {
    var N = ABC()
    var R = unsafe{ func_01(0, N) }
}
