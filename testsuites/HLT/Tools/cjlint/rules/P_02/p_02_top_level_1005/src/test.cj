/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

var res: UInt32 = 0

class B{
  private let m1: ReentrantMutex = ReentrantMutex()
  func foo(){
    spawn{
      m1.lock()
      res = 0
      m1.unlock()
    }
    spawn{
      print("${res}")
    }
    return 0
  }
}

main(): Int64 {
  return B().foo()
}
