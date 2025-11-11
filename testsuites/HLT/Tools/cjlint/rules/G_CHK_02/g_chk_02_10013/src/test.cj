/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.*
import stdx.logger.*
import stdx.net.http.*
import std.console.*

main(): Int64 {
  var a = 1
  var rep = HttpResponseBuilder().build()
  var s1: Protocol = rep.version
  func foo(){
    if(a == 1){
      while(a>0){
        match(a){
          case _ => SimpleLogger(Console.stdOut).log(LogLevel.ERROR, s1.toString())
        }
      }
    }
  }
  foo()
  0
}

