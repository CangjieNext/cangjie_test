import stdx.logger.*
import stdx.net.http.*
import std.io.*
import std.console.*

var rep = HttpResponseBuilder().build()
var s = SimpleLogger(Console.stdOut).warn(rep.close.toString())

main(): Int64 {
  s
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
