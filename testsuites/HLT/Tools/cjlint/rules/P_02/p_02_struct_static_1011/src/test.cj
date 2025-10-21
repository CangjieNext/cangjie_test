/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

struct Demo{
  static var res: String = "test"
}

func foo(a:Int64){
  return a
}

main(): Int64 {
  return foo({
    => let m1: ReentrantMutex = ReentrantMutex()
    spawn{
      m1.lock()
      Demo.res = "other"
      m1.unlock()
    }
    spawn{
      m1.lock()
      Demo.res = "other"
      m1.unlock()
      spawn{
        Demo.res = "test1"
      }
    }
    0
  }())
}
