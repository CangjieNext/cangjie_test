/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

enum A{
  B|C
}

class F{
  var a: A = A.B
}

main(): Int64 {
  let m1: ReentrantMutex = ReentrantMutex()
  let res: F = F()
  var res2: Unit = match(res.a){
    case C => {
      => spawn{
        m1.lock()
        res.a = A.C
        m1.unlock()
      }
      ()
    }()
    case B => do{
      spawn{res.a = A.C}
    }while(false)
  }
  return 0
}
