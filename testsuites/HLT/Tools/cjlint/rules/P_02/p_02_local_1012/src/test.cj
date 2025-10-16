import std.sync.ReentrantMutex

class A{
  var a: Float64 = 0.0
}

main(): Int64 {
  let res: A = A()
  if (true){
    res.a = 1.0
    let m1: ReentrantMutex = ReentrantMutex()
    spawn{
      m1.lock()
      res.a = 3.0
      m1.unlock()
    }
  }
  return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
