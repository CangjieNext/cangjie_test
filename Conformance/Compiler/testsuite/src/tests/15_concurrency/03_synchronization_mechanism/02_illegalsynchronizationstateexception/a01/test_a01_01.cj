/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_02_a01_01

  @Level:         1
  @Assertion:    15.3.2(1) IllegalSynchronizationStateException is a runtime
                 exception that is used by all built-in concurrency primitives
                 to report violations of any invariants, e.g. when thread
                 tries to unlock mutex that was not previously acquired by
                 this particular thread.

  @Description:  Checks that IllegalSynchronizationStateException is thrown
                 when thread tries to unlock mutex that was not previously
                 acquired by this particular thread.

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @CompileWarning: no

  @Issue:          0006505

*/
import std.sync.*  // Mutex
import utils.assert.Assert

let m = Mutex()

main(): Int64 {
    m.lock()

    let f: Future<Int64> = spawn {
        try {
            m.unlock()
            Assert.fail()
        } catch (e:IllegalSynchronizationStateException) {
            Assert.pass()
        }
        return 0
    }

    Assert.equals(0, f.get())

    0
}
