/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

class A{
  var a:UInt8 = 0
}

class B{
  let m1: ReentrantMutex = ReentrantMutex()
  func foo(){
    let res: A = A()
    spawn{
      m1.lock()
      res.a = 1
      m1.unlock()
    }
    spawn{
      var ss = res.a
    }
  }
}

main(): Int64 {
  return 0
}
