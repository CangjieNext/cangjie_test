/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.*
import stdx.logger.*
import std.posix.*
import std.console.*

main(): Int64 {
  var a = 1
  var result: UInt64 = UInt64(getuid())
  let logger = SimpleLogger(Console.stdOut)
  func foo(){
    if(a == 1){
      while(a>0){
        match(a){
          case _ => logger.log(LogLevel.ERROR, result.toString())
        }
      }
    }
  }
  foo()
  0
}

