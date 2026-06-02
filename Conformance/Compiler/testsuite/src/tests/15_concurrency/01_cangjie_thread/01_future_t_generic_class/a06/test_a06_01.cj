/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_01_a06_01

  @Level:         1
  @Assertion:    15.1.1(6) If the thread corresponding to the Future<T> object
                 terminates due to an exception, an exception will be thrown
                 when calling get().  E.g.

  @Description:  Checks that Future<T> with exception compiled without warnings

  @Mode:         run
  @Negative:     no
  @Structure:    single
  @CompileWarning: no

  @Issue:        0006114

*/

main(): Int64 {
    let f = spawn {
        throw Exception("Expected Exception in thread")
    }

    println("spawn has created Future<Unit> ? ${f is Future<Unit>}")
    0
}
