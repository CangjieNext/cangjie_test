/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

class Demo{
  static var res: UInt64 = 0
}

enum E{
  B
  func foo(){
    let m1: ReentrantMutex = ReentrantMutex()
    spawn{
      m1.lock()
      Demo.res = 1
      m1.unlock()
    }
    spawn{
      m1.lock()
        Demo.res = 1
      m1.unlock()
      spawn{
        m1.lock()
        Demo.res = 1
        m1.unlock()
      }
    }
  }
}

main(): Int64 {
  return 0
