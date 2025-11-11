/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.*
import stdx.net.http.*
import std.regex.*
import std.console.*

main(): Int64 {
  var a = Some(1)
  var rep = HttpResponseBuilder().build()
  var s1 = rep.status.toString()
  var b = match (Regex("[A-Za-z0-9_]+").matcher(s1).fullMatch()) {
    case None => SimpleLogger(Console.stdOut).warn(s1)
    case _ => SimpleLogger(Console.stdOut).info("非外界数据")
  }
  0
}

