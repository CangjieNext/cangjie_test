import std.sync.ReentrantMutex

enum A{
  C|D|E
}

class F{
  var a: A = A.C
}

struct B{
  func foo(){
    let res: F = F()
    spawn{
      res.a = A.D
    }

    spawn{
      spawn{
        res.a = A.E
      }
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
