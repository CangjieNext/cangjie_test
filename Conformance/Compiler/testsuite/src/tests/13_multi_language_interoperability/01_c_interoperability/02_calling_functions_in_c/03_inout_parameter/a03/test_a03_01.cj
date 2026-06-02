/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_03_a03_01

  @Level:         1

  @Assertion:    13.1.2.3(3) A pass-by-reference expression has the
                 following constraints:
                 - Can only be used on calls to CFunc; 

  @Description:  Use of inout modifier for non-CFunc.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:        0006353

  @Comment:      

*/

func func_01(Ptr: CPointer<Int32>): Unit {
    let Income = unsafe{ Ptr.read() }
    unsafe{ Ptr.write(-666) }
}

main() {
    var Arg : Int32 = 777;
    func_01(inout Arg)
}
