/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.*
import stdx.net.http.*
import std.regex.*

func foo(){
  var rep = HttpResponseBuilder().build()
  var con: Int64 = rep.bodySize ?? 0
  var b = Regex(con.toString())
  if (con is Int64){
    return con
  }
  return 0
}

main(): Int64 {
  foo()
  0
}

