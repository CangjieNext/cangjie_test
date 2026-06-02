/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_03_a03_01

  @Level:         1
  @Assertion:    15.1.3(3) The following example illustrates how to terminate a thread.
    main(): Unit {
        let future = spawn { // Create a new thread
            while (true) {
                //...
                if (Thread.currentThread.hasPendingCancellation) {
                    return // Terminate when having a request
                }
                //...
            }
        }
        //...
        future.cancel()  // Send a termination request
        future.get()     // Wait for thread termination
    }

  @Description:  Checks that example from the spec works.

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @CompileWarning: no
  @Issue:        0006620 0006621

*/

import std.sync.*  // Concurrency

main(): Int64 {
    let future = spawn { // Create a new thread
        while (true) {
            //...
            if (Thread.currentThread.hasPendingCancellation) {
                return // Terminate when having a request
            }
            //...
        }
    }
    //...
    future.cancel()    // Send a termination request
    future.get()       // Wait for thread termination

    return 0
}
