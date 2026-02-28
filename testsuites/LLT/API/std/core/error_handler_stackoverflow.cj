/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args 2>&1 | compare %f
// ASSERT: scan handle error: StackOverflowError
// ASSERT: scan handler finished
// ASSERT: scan quit normally

/* Output will be like: 
An exception has occurred:
StackOverflowError
         at default.test()(/path/to/errorHandlerSOF.cj)
         at default.test()(/path/to/errorHandlerSOF.cj:22)
         at default.test()(/path/to/errorHandlerSOF.cj:22)
         at default.test()(/path/to/errorHandlerSOF.cj:22)
         at default.test()(/path/to/errorHandlerSOF.cj:22)
         ... Some frames are not displayed ...
handle error: StackOverflowError
handler finished
An exception has occurred:
StackOverflowError
         at default.test()(/path/to/errorHandlerSOF.cj)
         at default.test()(/path/to/errorHandlerSOF.cj:22)
         at default.test()(/path/to/errorHandlerSOF.cj:22)
         at default.test()(/path/to/errorHandlerSOF.cj:22)
         ... Some frames are not displayed ...
*/

var a = 0

main() {
  func handler(err: Error): Unit {
    println("handle error: ${err}")
    println("handler finished")
  }
  Thread.handleUncaughtErrorBy(handler)

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

func test(): Unit {
    test()
    a++
}