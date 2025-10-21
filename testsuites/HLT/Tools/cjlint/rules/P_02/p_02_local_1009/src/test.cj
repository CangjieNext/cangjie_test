/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

class A{
  var a: Rune = 'a'
}

interface B{
  func f(){
    let res: A = A()
    func foo(){
      let m1: ReentrantMutex = ReentrantMutex()
      spawn{
        res.a = 'b'
      }
      spawn{
        m1.lock()
        res.a = 'c'
        m1.unlock()
      }
    }
    foo()
    return 0
  }
}

class C <: B{}

main(): Int64 {
  return C().f()
}
