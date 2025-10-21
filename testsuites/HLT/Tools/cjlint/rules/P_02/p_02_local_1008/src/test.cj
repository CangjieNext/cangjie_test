/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

class C{
  var a: Rune = 'a'
}

extend C{
  func foo(){
    let res: C = C()
    spawn{
      print("${res.a}")
    }
    spawn{
      res.a = 'b'
    }
  }
}

main(): Int64 {
  return 0
}
