import stdx.logger.*
import std.posix.*
import std.regex.*
import std.console.*

main(): Int64 {
  let logger: SimpleLogger = SimpleLogger(Console.stdOut)
  let result = getos()
  var b = match (Regex("[A-Za-z0-9_]+").matcher(result).fullMatch()) {
    case None => logger.warn(result)
    case _ => logger.info("非外界数据")
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
