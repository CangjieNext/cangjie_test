import stdx.log.*
import stdx.net.http.*
import std.io.*

var res : String = ""

func foo(param: String) {              
  for (arr in param.toArray()) { 
    var y : UInt8 = 0
    for (i in 0..arr) {            
      y = y + 1
    }
    res = res + Rune(y)         
  }
  return res
}

main(): Int64 {
  foo(res)
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
