/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a07_02

  @Level:         1

  @Assertion:    13.1.2.1(7)  foreign function is a declaration, without
                 function body, its parameters and return types cannot
                 be omitted.

  @Description:  foreign function without return type.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

foreign func func_01(x : Int32)

main() {
    unsafe { func_01(0) }
}
