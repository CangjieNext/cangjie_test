/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// (not O2)EXEC: %run %run_opt %n.%suffix %run_args 2>&1 | compare %f
// ASSERT: scan throws an error in the error handler


main() {
  func handler_02(err: Error): Unit { // complex handler will notfinish main
    println("handle error: ${err}")
    test()
    println("handler finished")
  }
  Thread.handleUncaughtErrorBy(handler_02)

  let fut = spawn {
    test()
  }
  
  try {
    fut.get()
  } finally {
    println("quit normally")
  }

  return 0
}

public func test(): Unit {
    test()
}