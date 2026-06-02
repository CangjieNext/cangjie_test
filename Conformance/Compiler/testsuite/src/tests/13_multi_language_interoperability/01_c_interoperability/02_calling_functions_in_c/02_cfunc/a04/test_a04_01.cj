/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a04_01

  @Level:         1

  @Assertion:    13.1.2.2(4)  Unlike normal lambda expressions, CFunc lambda
                 cannot capture variables.

  @Description:  CFunc that references @C function.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

main() {
    var Local:Int32 = 123;
    var CB: CFunc<(Int32)->Int32> = { x => Local + x }
    var Arg : Int32 = 777;
    var Value : Int32 = unsafe { CB(Arg) }
}