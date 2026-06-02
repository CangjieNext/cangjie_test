/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a02_03

  @Level:         1

  @Assertion:    13.1.2.1(2)  The foreign functions can only exist in the
                 top-level scope and is only visible inside the package,
                 so no other function modifiers can be used.

  @Description:  Modifier 'public' is incompatible with 'foreign'.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

foreign public func func_01(x: Int32): Int32

main() {
    var Value : Int32 = unsafe { func_01(222); };
}