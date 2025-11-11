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
import std.regex.*

struct Test{
  var b = ByteBuffer()
  var a: HttpResponse = ClientBuilder().build().put("http://127.0.0.1:10245/foo", b)
}

extend Test{
  func foo(){
    var s1 = Test().a.version
    var s2 = (s1,s1)
    var s3 = [s2]
    var s4 = {=> s3}()
    var s5 = (s4)
    var s6 = s5[0]
    var s7 = s6[0]
    var s8 = s7.toString()
    Regex(s8)
    ""
  }
}

main(): Int64 {
  Test().foo()
  return 0
}

