/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_a01_02

  @Level:         1
  @Assertion:    15.2(1) Each thread always runs in a thread context, which
                 could affect the behavior of the thread at runtime. When users
                 create a thread, in addition to the default spawn expression,
                 they can also choose different thread contexts by passing
                 various instances of type ThreadContext, to determine
                 concurrent behaviors of the thread.

  @Description:  Checks that thread can created with MainThreadContext

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

  @Issue:        0006087

*/
import std.sync.*  // Multithreading
import utils.assert.Assert
let STR = "Testing «ταБЬℓσ»: 1<2 & 4+1>3, now 20% off!"

main() {
    let ctx = MainThreadContext()
    let fut = spawn (ctx) {
        return STR
    }
    Assert.equals(STR, fut.get())

    return 0
}
