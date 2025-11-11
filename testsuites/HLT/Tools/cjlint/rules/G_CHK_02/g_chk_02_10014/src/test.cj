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

var rep = HttpResponseBuilder().build()
var s1: Protocol = rep.version

main(): Int64 {
  try {
    SimpleLogger(Console.stdOut).debug(s1.toString())
  } catch (_) {}
  0
}

