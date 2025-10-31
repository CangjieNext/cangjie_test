/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

class A{
  var a: String = "a"
}

var res: A = A()

extend A{
  func foo(){
    spawn{
      while(true){
        print("${res.a}")
        break
      }
    }
    spawn{
      for (i in 0..1){
        res.a = "b"
      }
    }
    return 0
  }
}

main(): Int64 {
  return A().foo()
}
