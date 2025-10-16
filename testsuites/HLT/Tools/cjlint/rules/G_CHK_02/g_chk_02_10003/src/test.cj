/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.logger.*
import stdx.net.http.*
import std.console.*

main(): Int64 {
  var a = Some(1)
  var rep = HttpResponseBuilder().build()
  var b = match(a){
    case Some(x) => SimpleLogger(Console.stdOut).info(rep.status.toString())
    case _ => SimpleLogger(Console.stdOut).info("非外界数据")
  }
  0
}

