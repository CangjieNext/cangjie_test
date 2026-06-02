/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a10_01

  @Level:         1
  @Assertion:    15.1(10) The following is an example of the spawn expression
                 without passing ThreadContext argument.

                func add(a: Int32, b: Int32): Int32 {
                    println("This is a new thread")
                    return a + b
                }
                main(): Int64 {
                    println("This is main")
                    // Create a thread.
                    let fut: Future<Int32> = spawn {
                        add(1, 2)
                    }
                    println("main waiting...")
                    // Waiting for the results of thread execution.
                    // Print the result.
                    let res: Int32 = fut.get()
                    println( "1 + 2 = ${res}")
                }
                // OUTPUT maybe:
                // This is main
                // main waiting...
                // This is a new thread
                // 1 + 2 = 3


  @Description:  Checks that example from the spec works

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006094

*/

func add(a: Int32, b: Int32): Int32 {
    println("This is a new thread")
    return a + b
}

main(): Int64 {
    println("This is main")
    // Create a thread.
    let fut: Future<Int32> = spawn {
        add(1, 2)
    }
    println("main waiting...")
    // Waiting for the results of thread execution.
    // Print the result.
    let res: Int32 = fut.get()
    println( "1 + 2 = ${res}")
    return 0
}
// OUTPUT maybe:
// This is main
// main waiting...
// This is a new thread
// 1 + 2 = 3
