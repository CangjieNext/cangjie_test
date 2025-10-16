/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.*
import std.posix.*

class B{
  func notLog(a:String){
    return a
  }
}

struct A{
  let result = getos()
  let logger = B()
  var s1 = logger.notLog(result)
}

main(): Int64 {
  A().s1
  0
}

