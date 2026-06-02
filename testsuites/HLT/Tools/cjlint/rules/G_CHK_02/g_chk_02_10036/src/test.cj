/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.logger.*
import std.posix.*
import std.regex.*
import std.console.*

main(): Int64 {
  let logger: SimpleLogger = SimpleLogger(Console.stdOut)
  let result = getos()
  var arrayTest = [0,1,2]
  try {
    let lastElement = arrayTest[3]
  } catch (_) {
    match (Regex("[A-Za-z0-9_]+").matcher(result).fullMatch()) {
      case None => logger.error(result)
      case _ => logger.error(result + result)
    }
  }
  0
}


