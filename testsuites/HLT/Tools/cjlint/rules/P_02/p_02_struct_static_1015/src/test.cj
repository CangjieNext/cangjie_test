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

struct Demo{
  static var res: A = A.B
}

main(): Int64 {
  let m1: ReentrantMutex = ReentrantMutex()
  var res2: Future<Unit> = match(Demo.res){
    case C => spawn{
      Demo.res = A.C
    };spawn{
      m1.lock()
      Demo.res = A.C
      m1.unlock()
      spawn{
        m1.lock()
        Demo.res = A.C
        m1.unlock()
      }
    }
    case B => spawn{}
  }
  return 0
}
