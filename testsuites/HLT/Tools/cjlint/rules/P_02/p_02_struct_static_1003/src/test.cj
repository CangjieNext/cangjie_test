import std.sync.ReentrantMutex

struct Demo{
  static var res: Int8 = 1
}

func test(a!: Future<Int8> = spawn{Demo.res}){
  let m1: ReentrantMutex = ReentrantMutex()
  spawn{
    spawn{
      m1.lock()
      Demo.res = 1
      m1.unlock()
    }
  }
}

main(): Int64 {
  return 1
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
