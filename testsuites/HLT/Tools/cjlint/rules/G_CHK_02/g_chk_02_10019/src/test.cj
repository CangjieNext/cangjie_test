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

class B{
  static var a: HttpResponse = ClientBuilder().build().get("http://127.0.0.1:10245/foo")
  func notLog(a:String){
    return a
  }
}

struct A{
  var s1 = B().notLog(({=>([B.a],[B.a])}()[0][0].version).toString())
}

main(): Int64 {
  A().s1
  0
}

