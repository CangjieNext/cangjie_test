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
var res: A = A.B

main(): Int64 {
  let m1: ReentrantMutex = ReentrantMutex()
  var res2: Future<Unit> = match(res){
    case C => spawn{
      var ss = res
    };spawn{
      m1.lock()
      res = A.C
      m1.unlock()
      spawn{
        m1.lock()
        res = A.C
        m1.unlock()
      }
    }
    case B => spawn{}
  }
  return 0
}
