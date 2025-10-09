import stdx.log.*
import stdx.net.http.*
import std.io.*
import stdx.encoding.url.*

main(): Int64 {
  var req = HttpRequestBuilder().build()
  var s1: URL = req.url
  func foo(a:URL){
    return a
  }
  foo(s1)
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
