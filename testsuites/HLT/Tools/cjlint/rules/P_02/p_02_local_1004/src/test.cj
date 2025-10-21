/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

class C{
  var a: Int8 = 0
}

class B{
  static func foo(){
    let res: C = C()
    spawn{
      print("$i{res.a}")
    }
    spawn{
      print("${res.a}")
    }
  }
}

main(): Int64 {
  return 0
}
