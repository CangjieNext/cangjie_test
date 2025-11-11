/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

class A{
  var a: Int32 = 2
}

func foo(){
  let res: A = A()
  func test(b!: Future<Int32> = spawn{res.a}){
    let m1: ReentrantMutex = ReentrantMutex()
    spawn{
      {
        => m1.lock()
        res.a = 2
        m1.unlock()
      }
    }
  }
  test()
}

main(): Int64 {
  foo()
  return 1
}
