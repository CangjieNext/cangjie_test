/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.logger.*
import std.process.*
import std.regex.*
import std.posix.*
import std.console.*

main(): Int64 {
  var a = 10
  let result1 = getos()
  let result2 = getos()
  let logger = SimpleLogger(Console.stdOut)
  match (Regex("[A-Za-z0-9_]+").matcher(result1).fullMatch()) {
    case _ => match (Regex("[A-Za-z0-9_]+").matcher(result2).fullMatch()) {
      case None => logger.info( result1)
      case _ => logger.info(result2)
    }
  }
  
  {=>
    var a1: (String,String,String,String) = (Process.current.arguments[0],Process.current.arguments[1],Process.current.arguments[2],Process.current.arguments[3])
    var a2: String = a1[0]
    var a3: String = a1[1]
    var a4: String = a1[2]
    var a5: String = a1[3]
    var a6: String = a2 + a3 + a4 + a5
    var a7: String = a6[1..]
    var a8: Array<String> = [a2, a3, a4, a5, a6, a7]
    var a9: String = a8[0] + a8[1]
    //logger.info( a2 + a3 + a4 + a9  )
    match (Regex("[A-Za-z0-9_]+").matcher(a2 ).fullMatch()) {
      case _ => match (Regex("[A-Za-z0-9_]+").matcher(a3).fullMatch()) {
        case _ => match (Regex("[A-Za-z0-9_]+").matcher(a4).fullMatch()) {
          case _ => match (Regex("[A-Za-z0-9_]+").matcher(a9).fullMatch()) {
            case None => logger.info( a2 + a3 + a4 + a9)
            case _ => logger.info( a2 + a3 + a4 + a9)
          }
        }
      }
    }
  }()
  0
}


