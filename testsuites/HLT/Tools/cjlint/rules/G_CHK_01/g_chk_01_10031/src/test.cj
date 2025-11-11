/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.*
import stdx.net.http.*
import std.io.*

var rep = HttpResponseBuilder().build()
var s1: Bool = rep.close

main(): Int64 {
  func foo(){
    if(s1){
      return s1
    }
    s1
  }
  foo()
  0
}

