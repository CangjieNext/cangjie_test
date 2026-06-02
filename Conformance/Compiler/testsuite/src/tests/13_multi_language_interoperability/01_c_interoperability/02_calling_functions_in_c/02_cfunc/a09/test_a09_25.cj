/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a09_25

  @Level:         1

  @Assertion:    13.1.2.2(9)  As with the foreign functions, the parameters and
                 return types of other forms of CFunc must conform the CType
                 constraint, and named parameters and parameter default values
                 are not supported.

  @Description:  CFunc may use Unit as return type.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

@C
func func_01(x: Int32): Unit {}

main() {
    var FPtr: CFunc<(Int32)->Unit> = func_01
    unsafe{ func_01(222) }
}
