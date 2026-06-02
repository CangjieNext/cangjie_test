/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_01_a05_04

  @Level:         1
  @Assertion:    15.1.1(5) Future<T> is a generic class that is defined as follows:
    class Future<T> {
         ... ...
         // Blocking the current thread, waiting for the result of the thread
         // corresponding to this Future<T> object.
         // If an exception occurs in the corresponding thread, the method will throw the exception.
         func get(): T

         // Same as above, but with an extra timeout.
         // If the corresponding thread has not completed execution within
         // `ns` toNanoseconds, the method will return Option<T>.None.
         // If an exception occurs in the corresponding thread, the method will throw the exception.
         func get(ns: Int64): Option<T>

         // Non-blocking method that immediately returns None if thread has not finished execution.
         // Returns the computed result otherwise.
         // If an exception occurs in the corresponding thread, the method will throw the exception.
         func tryGet(): Option<T>
    }

  @Description:  Checks that negative timeout == Infinite

  @Mode:         run
  @Negative:     no
  @ExpectTimeout
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

  @Issue:        0006120 0006620 0006628

*/

import utils.assert.Assert
import std.random.Random
import std.time.* //Duration
import thread_commons.*

var blocked = true
let result:Int64 = 0x29A

main(): Int64 {
    let f: Future<Int64> = spawn {
        while (blocked) {
            sleep(Duration.nanosecond * 10)
        }
        return result
    }

    let rnd = Random()
    let nextInt:Int64 = Int64(rnd.nextUInt32(100_000))
    let timeout:Int64 = 0i64 - nextInt;
    println("We will check Future.get(${timeout})");
    f.get(Duration.nanosecond * timeout)
    Assert.fail()

    return 0
}
