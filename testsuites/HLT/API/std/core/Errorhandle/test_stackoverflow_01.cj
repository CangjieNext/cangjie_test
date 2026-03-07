/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not O2 and not target_ohos)EXEC: %compiler %cmp_opt -o %n.%suffix %f
// (not O2 and not target_ohos)EXEC: %run %run_opt %n.%suffix %run_args 2>&1 | compare %f
// (not O2 and not target_ohos)ASSERT: scan handle error: StackOverflowError
// (not O2 and not target_ohos)ASSERT: scan handler finished
// (not O2 and not target_ohos)ASSERT: scan quit normally

main() {
  func handler_01(err: Error): Unit { // easy handler。will all print log
    println("handle error: ${err}")
    println("handler finished")
  }

  Thread.handleUncaughtErrorBy(handler_01)

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
