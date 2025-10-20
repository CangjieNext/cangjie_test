import std.sync.ReentrantMutex

struct Demo{
  static var res: UInt64 = 0
}

main(): Int64 {
  var i: Int64 = 0

  while (i < 100) {
    i++
    spawn {
      print(Demo.res.toString())
    }
    print(Demo.res.toString())
  }
  return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
