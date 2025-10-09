import stdx.logger.*
import std.posix.*
import std.regex.*
import std.io.*
import std.console.*

main(): Int64 {
  let arrayTest: Array<Int64> =[0, 1, 2]
  let result = gethostname()
  let logger: SimpleLogger = SimpleLogger(Console.stdOut)
  try {
    let lastElement = arrayTest[3]
  } catch (_) {
    logger.debug(result)
  }
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
