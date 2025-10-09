import std.sync.ReentrantMutex

struct Demo{
  static var res: Rune = 'a'
}

interface B{
  func foo(){
    let m1: ReentrantMutex = ReentrantMutex()
    spawn{
      Demo.res = 'b'
    }
    spawn{
      m1.lock()
      print(Demo.res.toString())
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
