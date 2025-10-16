/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.*
import std.console.*
import stdx.net.http.*
import std.regex.*

class A{
  var rep = HttpResponseBuilder().build()
  var a = Console.stdIn.read()
}

func foo(){
  Regex(A().a.toString())
}

main(): Int64 {
  foo()
  0
}

