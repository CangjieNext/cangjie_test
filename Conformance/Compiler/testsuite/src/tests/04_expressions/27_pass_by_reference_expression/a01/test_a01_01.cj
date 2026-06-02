/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_27_a01_01

  @Level:         1

  @Assertion:   4.27(1) A pass-by-reference expression can only be used in the scenario where CFuncis invoked in C
                interop. For details, see the inout parameter section in Chapter 13.
  @Description: Checks compilation and execution of a program that uses a pass-by-reference expression.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6353

*/

import utils.assert.Assert

@C
func assign(ptr: CPointer<Int64>) {
    unsafe {
        ptr.write(0, 0x1122334455667788)
    }
}

main() {
    var x: Int64 = 0
    unsafe {
        assign(inout x)
    }
    Assert.equals(0x1122334455667788, x)
}
