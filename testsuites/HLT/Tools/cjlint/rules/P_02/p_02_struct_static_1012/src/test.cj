/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

struct Demo{
  static var res: Float64 = 0.0
}

main(): Int64 {
  if (true){
    spawn{
      print(Demo.res.toString())
    }
    spawn{
      if(false){}else{
        let m1: ReentrantMutex = ReentrantMutex()
        m1.lock()
        Demo.res = 3.0
        m1.unlock()
      }
    }
  }else{spawn{}}
  return 0
}
