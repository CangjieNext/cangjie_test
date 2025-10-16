import stdx.logger.*
import std.posix.*
import std.console.*

main(): Int64 {
  var result = getlogin()
  var logger = SimpleLogger(Console.stdOut)
  var b = match(result){
    case "" => logger.info(result)
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
