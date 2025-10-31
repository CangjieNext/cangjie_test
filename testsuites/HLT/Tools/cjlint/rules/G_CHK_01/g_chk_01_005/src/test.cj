/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.io.*
import stdx.net.http.*
var B: HttpResponse = ClientBuilder().build().get("http://127.0.0.1:10245/goo")
func foo(a:HttpResponse){
  return a
}

struct A{
  var a: HttpResponse = ClientBuilder().build().get("http://127.0.0.1:10245/foo")
}

main(): Int64 {
  B = A().a
  foo(B)
  0
}

