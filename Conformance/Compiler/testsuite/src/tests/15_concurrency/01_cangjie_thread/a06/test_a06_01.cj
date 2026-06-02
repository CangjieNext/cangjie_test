/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a06_01

  @Level:         1
  @Assertion:    15.1(6) When main exits, the execution exits as well, and it
                 does not wait for other threads to complete.

  @Description:  Checks that thread will be killed on main exit
  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

let count = AtomicInt64(0)

class A {
    static let f = spawn {
        count.fetchAdd(1)
        while (true) {
            sleep(Duration.Zero)
        }
        println("Print after sleep class A")
    }
}

let f = spawn {
    count.fetchAdd(1)
    while (true) {
        sleep(Duration.Zero)
    }
    println("Print after sleep 0")
}


main(): Int64 {
    spawn {
        count.fetchAdd(1)
        while (true) {
            sleep(Duration.Zero)
        }
        println("Print after sleep")
    }

    while(count.load() != 3) {
        sleep(Duration.Zero)
    }


    return 0
}
