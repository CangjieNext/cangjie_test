/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a08_01

  @Level:         1

  @Assertion:    13.1.2.2(8)  The following example shows how it can be used: 
                 foreign func atexit(cb: CFunc<()->Unit>) 


  @Description:  Case 2.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

foreign func atexit(cb: CFunc<()->Unit>): Unit

main() {
    var CB: CFunc<()->Unit> = { => print("Finishing Canjie application")}
    unsafe{ CB() }
}