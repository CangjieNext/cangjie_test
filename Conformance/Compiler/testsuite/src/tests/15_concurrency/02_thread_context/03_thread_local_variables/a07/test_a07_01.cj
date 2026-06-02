/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_03_a07_01

  @Level:         1
  @Assertion:    15.2.3(7) class ThreadLocal<T> {
        // Construct a thread-local variable contains None.
        public init()
        // Get the value of the thread-local variable of the current executing thread.
        public func get(): ?T
        // Set a value to the thread-local variable.
        public func set(value: ?T): Unit
    }
    The following example illustrates how to use thread-local variables.
    let tlv = ThreadLocal<Int64>() // Define a thread-local variable
    main(): Unit {
        for (i in 0..3) {
            // Spawn three threads
            spawn {
                tlv.set(i) // Each thread sets a different value
                // ...
                println("${tlv.get()}") // Each thread prints its own value
            }
        }
        // ...
        println("${tlv.get()}") // Print `None`
        // since the current thread does not set any value.
    }

  @Description:  Checks that example from the spec works

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006095

*/

import std.sync.*  // Multithreading

let tlv = ThreadLocal<Int64>() // Define a thread-local variable

main(): Int64 {
    for (i in 0..3) {
        // Spawn three threads
        spawn {
            tlv.set(i) // Each thread sets a different value
            // ...
            println("${tlv.get()}") // Each thread prints its own value
        }
    }
    // ...
    println("${tlv.get()}") // Print `None`
    // since the current thread does not set any value.

    return 0
}
