/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args 2>&1 | compare %f
// ASSERT: scan handle error: OutOfMemoryError
// ASSERT: scan handler finished
// ASSERT: scan quit normally

/* Output will be like: 
An exception has occurred:
    Out of memory
handle error: OutOfMemoryError
handler finished
quit normally
*/

main() {
  func handler(err: Error): Unit {
    println("handle error: ${err}")
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