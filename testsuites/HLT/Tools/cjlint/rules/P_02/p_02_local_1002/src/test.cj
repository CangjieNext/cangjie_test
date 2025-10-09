import std.sync.ReentrantMutex

class A{
  var a: Bool = true
}

public func test(): Unit {
  let m1: ReentrantMutex = ReentrantMutex()
  let res: A = A()
  spawn {
    m1.lock()
    res.a = false
    m1.unlock()
  }
  spawn {
    spawn{
      m1.lock()
      res.a = true
      m1.unlock()
    }
  }
}

main(): Int64 {
  return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
