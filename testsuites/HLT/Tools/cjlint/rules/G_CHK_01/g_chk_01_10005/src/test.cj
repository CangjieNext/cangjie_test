/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.*
import std.io.*
import stdx.net.http.*

func foo(a:HttpResponse){
  return a
}

main(): Int64 {
  var s = 1
  if(s == 1){
    var a: HttpResponse = ClientBuilder().build().get("http://127.0.0.1:10245/foo")
    foo(a)
  }else{
    HttpResponseBuilder().build()
  }
  0
}

