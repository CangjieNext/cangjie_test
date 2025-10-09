import stdx.log.*
import stdx.net.http.*
import std.io.*
import std.regex.*

main(): Int64 {
  var rep = HttpResponseBuilder().build()
  var s1: Bool = rep.close
  if(s1){
    return 0
  }else{
    0
  }

  func foo2(a:Bool){
    Regex(a.toString())
    return a
  }
  foo2(s1)
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
