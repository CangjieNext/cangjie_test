/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a17_01

  @Level:         1

  @Assertion:    13.1.2.1(17) The foreign function does not support named
                 parameters and parameter default values.

  @Description:  named parameters are not allowed in a foreign function.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

foreign func func_01(x: Int32, y!: Int32): Int32

main() {
}
