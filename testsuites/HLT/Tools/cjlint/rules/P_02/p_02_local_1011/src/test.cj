/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

class SS{}
class A{
  var a: SS = SS()
}

interface B{
  func f(){
    let res: A = A()
    let m1: ReentrantMutex = ReentrantMutex()
    spawn{
      res.a = SS()
    }
    spawn{
      m1.lock()
      res.a = SS()
      m1.unlock()
    }
  }
}

main(): Int64 {
  return 0
}
