/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_01_a05_01

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

  @Description:  Checks that Future<T> has 3 methods described

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006620 0006628

*/

import utils.{macros.*, assert.Assert}

enum Status {
    INCOMPLETE | COMPLETE
}

main(): Int64 {
    let f: Future<Status> = spawn {
        return Status.COMPLETE
    }
    @matchOrThrow[Status.COMPLETE](f.get())

    // these 2 can't be the first methods, they might fail in case thread
    // result is not ready
    sleep(Duration.nanosecond * 1000)
    Assert.isSome(f.tryGet())

    0
}
