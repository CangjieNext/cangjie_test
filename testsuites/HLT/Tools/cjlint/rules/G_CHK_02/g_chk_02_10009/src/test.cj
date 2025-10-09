import stdx.logger.*
import std.console.*
import stdx.net.http.*
import std.console.*

class A{
  var rep = HttpResponseBuilder().build()
  var a = Console.stdIn.read()
  var b = Console.stdIn.readln()

  var a1 = match(a){
    case Some(x) => x.toString()
    case _ => ""
  }

  var b1 = match(b){
    case Some(x) => x
    case _ => ""
  }

  var s1 = SimpleLogger(Console.stdOut).debug(rep.status.toString() + a1 + b1)
}

main(): Int64 {
  A().s1
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
