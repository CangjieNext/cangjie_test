/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_a01_01

  @Level:         1
  @Assertion:    15.2(1) Each thread always runs in a thread context, which
                 could affect the behavior of the thread at runtime. When users
                 create a thread, in addition to the default spawn expression,
                 they can also choose different thread contexts by passing
                 various instances of type ThreadContext, to determine
                 concurrent behaviors of the thread.

  @Description:  Checks that thread can created without thread context

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.Assert
let STR = "Testing «ταБЬℓσ»: 1<2 & 4+1>3, now 20% off!"

main() {
    let fut = spawn {
        return STR
    }
    Assert.equals(STR, fut.get())

    return 0
}
