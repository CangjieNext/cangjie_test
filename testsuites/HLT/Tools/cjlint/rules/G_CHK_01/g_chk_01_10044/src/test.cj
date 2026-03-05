/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import cangjie_stdx::log.*
import cangjie_stdx::net.http.*
import std.io.*
import cangjie_stdx::encoding.url.*

main(): Int64 {
  var rep = HttpResponseBuilder().build()
  
  func foo(a:HttpResponse){
    return a
  }
  foo(rep)
  0
}

