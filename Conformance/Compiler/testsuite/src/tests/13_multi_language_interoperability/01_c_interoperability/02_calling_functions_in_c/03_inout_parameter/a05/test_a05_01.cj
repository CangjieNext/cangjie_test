/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_03_a05_01

  @Level:         1

  @Assertion:    13.1.2.3(5) The modified object can not be defined with let,
                 can not be a literal, a value of other expression and other
                 temporary variables; 

  @Description:  Define modified object with let.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:        0006353

  @Comment:      

*/

@C func func_01(Ptr: CPointer<Int32>): Unit {
    let Income = unsafe{ Ptr.read() }
    unsafe{ Ptr.write(-666) }
}

main() {
    let Arg : Int32 = 777;
    unsafe{ func_01(inout: Arg) }
}