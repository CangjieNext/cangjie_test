/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.*
import std.process.*
import std.regex.*

func foo(){
  var a1: (String,String,String,String) = (Process.current.arguments[0],Process.current.arguments[1],Process.current.arguments[2],Process.current.arguments[3])
  var a2: String = a1[0]
  var a3: String = a1[1]
  var a4: String = a1[2]
  var a5: String = a1[3]
  var a6: String = a2 + a3 + a4 + a5
  var a7: String = a6[1..]
  var a8: Array<String> = [a2, a3, a4, a5, a6, a7]
  var a9: String = a8[0] + a8[1]
  var a10: (String,String,String,String,String,String,String) = (a2,a3,a4,a5,a6,a7,a9)
  if (a10[0] is String){
    var b = Regex(a10[0])
  }
  ("","","","","","","")
}

main(): Int64 {
  foo()
  0
}

