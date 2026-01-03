/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args 2>&1 | compare %f
// ASSERT: scan throws an error in the error handler

/* Output will be like:
An exception has occurred:
    Out of memory
handle error: OutOfMemoryError
Thread id: 2 throws an error in the error handler
139972 E CJNatvie Handle signal: 11.
139972 E Thread "schd-worker" catched unhandled SIGSEGV (Segmentation fault) from runtime frame. signal pc: 0xffffb4f3bcfc, addr: 0xffff94810028
139972 E   #0  0xffffb4f3bcfc in MCC_FutureNotifyAll from /path/to/libcangjie-runtime.so
139972 E   #1  0xffffb4ee6b5c in ExecuteCangjieStub from /path/to/libcangjie-runtime.so
139972 E   #2  0xffffb4f415f8 in CJ_CJThreadEntry from /path/to/libcangjie-runtime.so
[1]    139967 segmentation fault  ./errorHandler
*/

main() {
  func handler(err: Error): Unit {
    println("handle error: ${err}")
    consumeMemory()
    println("handler finished")
  }
  Thread.handleUncaughtErrorBy(handler)

  spawn {
    consumeMemory()
  }

  sleep(Duration.second * 3)
  println("quit normally")

  return 0
}

func consumeMemory() {
  let array = Array(1024*1024*1024*1024, repeat: 1024)
  for (i in 0..array.size) {
    array[i] = 0
  }
}