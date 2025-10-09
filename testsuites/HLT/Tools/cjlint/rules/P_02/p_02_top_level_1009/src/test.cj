import std.sync.ReentrantMutex

var res: Rune = 'a'

interface B{
  func foo(){
    let m1: ReentrantMutex = ReentrantMutex()
    spawn{
      res = 'b'
    }
    spawn{
      m1.lock()
      res = 'c'
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
